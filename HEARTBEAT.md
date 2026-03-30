# HEARTBEAT — Automated Monitoring

## Schedule

| Check | Frequency | Times | Priority |
|-------|-----------|-------|----------|
| Calendar | Hourly | Every hour 0700–1800 | High |
| Email | 3x daily | 0800, 1200, 1700 | High |
| Weather | Daily | 0630 | Low |
| GitHub CI | On push + 2x daily | 0900, 1500 | Medium |
| News/Briefing | Daily | 0700 | Low |

---

## Calendar Check

**Account:** <!-- Sean: add your calendar account/ID here -->

### Actions
- Alert immediately if meeting starts in <30 minutes
- Flag scheduling conflicts
- Note cancellations or changes since last check
- Summarize next 3 upcoming events

### Alert Threshold
- **Immediate:** Meeting in <30 min, double-booking detected
- **Batch:** New invites, changes to future events

---

## Email Check

**Accounts:**
- <!-- Sean: add personal email here -->
- <!-- Sean: add work email here -->

### Actions
- Triage inbox: flag urgent, summarize important, ignore noise
- Draft replies for routine messages if patterns are known
- Alert on emails from key contacts (see TOOLS.md contacts)
- Summarize unread count and top 3 items

### Alert Threshold
- **Immediate:** Email from commander, flagged sender, or containing urgent keywords
- **Batch:** Everything else — include in next summary

---

## Weather Check

**Location:** <!-- Sean: add your city/zip here -->

### Actions
- Report current conditions and forecast
- Flag severe weather alerts
- Note if weather affects any outdoor calendar events

---

## GitHub CI Check

**Repos:**
- <!-- Sean: add your GitHub repos to monitor here -->

### Actions
- Check for failed CI runs
- Report new PRs needing review
- Note any security alerts (Dependabot, etc.)

### Alert Threshold
- **Immediate:** CI failure on main branch, security vulnerability
- **Batch:** PR activity, successful builds

---

## State Tracking

Track the following between heartbeat runs:

```
last_calendar_check: null
last_email_check: null
last_weather_check: null
last_ci_check: null
last_daily_summary: null
unread_email_count: 0
next_meeting: null
active_alerts: []
```

---

## Daily Summary

Generated at **1800** (or on request). Includes:

1. **Calendar** — What happened today, what's tomorrow
2. **Email** — Messages received, replies sent, items pending
3. **Tasks** — Completed, in progress, blocked
4. **CI/Code** — Build status, PRs merged, issues opened
5. **Weather** — Tomorrow's forecast
6. **Alerts** — Anything still unresolved
