WITH Raw_Activities AS (
    -- Aggregating Dials and Live Connects
    SELECT 
        owner_name AS rep_name,
        COUNT(id) AS total_dials,
        COUNT(CASE WHEN call_disposition = 'Connected' THEN 1 END) AS connects
    FROM sfdc_task_history
    WHERE activity_date = CURRENT_MONTH()
    GROUP BY 1
),

Funnel_Metrics AS (
    -- Aggregating Meetings, SQOs, and Rejections
    SELECT 
        sdr_owner_name AS rep_name,
        COUNT(meeting_id) AS meetings_booked,
        COUNT(CASE WHEN stage = 'Qualified' THEN 1 END) AS sqos_accepted,
        COUNT(CASE WHEN stage = 'Disqualified' THEN 1 END) AS rejections,
        COUNT(CASE WHEN stage IN ('Proposal', 'Negotiation', 'Closed Won') THEN 1 END) AS stage_2_plus
    FROM sfdc_opportunity_pipe
    WHERE created_date = CURRENT_MONTH()
    GROUP BY 1
)

SELECT 
    a.rep_name,
    a.total_dials,
    a.connects,
    f.meetings_booked,
    f.sqos_accepted,
    f.stage_2_plus AS velocity_deals,
    f.rejections,
    -- Rate Calculations
    ROUND(CAST(a.connects AS FLOAT) / NULLIF(a.total_dials, 0), 4) AS connect_rate,
    ROUND(CAST(f.meetings_booked AS FLOAT) / NULLIF(a.connects, 0), 4) AS conv_rate,
    ROUND(CAST(f.rejections AS FLOAT) / NULLIF(f.meetings_booked, 0), 4) AS rejection_rate
FROM Raw_Activities a
LEFT JOIN Funnel_Metrics f ON a.rep_name = f.rep_name
ORDER BY f.sqos_accepted DESC;
