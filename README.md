# SDR-Command-Center-Framework
A data-driven management dashboard designed to shift SDR performance from volume-based activity to revenue-impact metrics.
Title: SDR Command Center Framework
> Objective: To solve the "Vanity Metric Trap" by measuring Sales Development impact through Quality, Conversion, and Pipeline Velocity.
> 
I. The Problem
Traditional SDR tracking (Calls/Emails) incentivizes "Busy Work." This framework implements a North Star Metric (SQO Created) and Anti-Gaming Guards (Rejection Rate) to ensure sales activity leads to actual revenue.
II. Core Metrics & R/Y/G Thresholds
| Metric | Definition | Green (Good) | Red (Crisis) |
|---|---|---|---|
| SQOs | AE-Accepted Opportunities | 15+ per Rep | < 10 per Rep |
| Connect Rate | Live Talk / Total Dials | > 15% | < 8% |
| Conv. Rate | Meetings / Connects | > 10% | < 5% |
| Rejection Rate | Meetings DQ'd by AE | < 10% | > 20% |

III. Data Architecture
The dashboard follows a Z-Pattern Layout:
 * Scoreboard (Top): Real-time pacing against the 100 SQO monthly goal.
 * Diagnostics (Middle): Pacing trendlines and Stage 2 Velocity (Anti-gaming).
 * Action Center (Bottom): Skill vs. Will scatter plot and Rep-level Rejection tracking.

There is "SQL Implementation" and this query handles the join between Activity (Tasks) and Impact (Opportunities).
