# TOOLS — Accounts, Access & Resources

## Email Formatting

All outgoing email must use **HTML format** with clean, professional styling:

- Use a standard template with proper `<html>`, `<body>` tags
- Font: system default or Arial/Helvetica
- Keep formatting minimal — headers, paragraphs, bullet lists
- Always include a plain-text fallback
- Sign-off should match user's preferred style (configure in USER.md)

---

## Hardware

| Field | Value |
|-------|-------|
| Machine | <!-- Sean: e.g., MacBook Pro M3, ThinkPad, etc. --> |
| OS | <!-- Sean: e.g., macOS 15, Ubuntu 24.04, Windows 11 + WSL2 --> |
| Shell | <!-- Sean: e.g., zsh, bash --> |
| Editor | <!-- Sean: e.g., VS Code, Vim, etc. --> |

---

## Accounts & Access

Fill in as you connect services. Jack needs to know what's available.

| Service | Account/ID | Status |
|---------|-----------|--------|
| GitHub | <!-- username --> | Not configured |
| Anthropic | <!-- via openclaw.json --> | Not configured |
| Email (personal) | <!-- address --> | Not configured |
| Email (work) | <!-- address --> | Not configured |
| Google Calendar | <!-- account --> | Not configured |
| Telegram | <!-- bot username --> | Not configured |
| WhatsApp | <!-- number --> | Not configured |
| Slack | <!-- workspace --> | Not configured |
| AWS | <!-- profile/region --> | Not configured |
| Vercel | <!-- team --> | Not configured |
| Cloudflare | <!-- account --> | Not configured |

---

## Contacts

Key contacts Jack should recognize and prioritize.

| Name | Role | Email | Phone | Priority |
|------|------|-------|-------|----------|
| <!-- Name --> | <!-- Role --> | <!-- Email --> | <!-- Phone --> | <!-- High/Med/Low --> |
| <!-- Name --> | <!-- Role --> | <!-- Email --> | <!-- Phone --> | <!-- High/Med/Low --> |
| <!-- Name --> | <!-- Role --> | <!-- Email --> | <!-- Phone --> | <!-- High/Med/Low --> |

**Priority levels:**
- **High** — Alert immediately on messages from this person
- **Medium** — Include in next batch summary
- **Low** — Standard processing

---

## What Goes Here

This file is your tool configuration reference. Add entries as you connect services:

1. **Accounts** — Any service Jack can access or should know about
2. **Hardware** — Your machine specs (helps Jack tailor commands and troubleshooting)
3. **Contacts** — People Jack should recognize by name and prioritize
4. **Access notes** — API limits, restricted hours, or special instructions for specific tools
5. **Templates** — Email signatures, report formats, standard responses

Keep secrets (API keys, tokens, passwords) in `openclaw.json` or environment variables — **never in this file**.
