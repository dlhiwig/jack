# Jack — Personal AI Agent for Sean Howen

Jack is a ready-to-deploy personal AI agent powered by [OpenClaw](https://github.com/dlhiwig/openclaw). He's direct, competent, and built to get things done without drama.

Jack runs as your always-on digital familiar — handling email, calendar, research, code, and coordination so you can focus on what matters.

---

## Prerequisites

- **Node.js 18+** — [Download here](https://nodejs.org/)
- **npm** (comes with Node.js)
- **Anthropic API key** — [Get one here](https://console.anthropic.com/)

---

## Install

```bash
# 1. Clone this repo
git clone https://github.com/dlhiwig/jack.git && cd jack

# 2. Run the installer
chmod +x install.sh && ./install.sh

# 3. Add your Anthropic API key when prompted

# 4. Start Jack
openclaw start

# 5. Talk to Jack
openclaw chat
```

That's it. Jack is live.

---

## What Jack Can Do

- **Email** — Draft, send, triage, and summarize email
- **Calendar** — Check schedule, create events, send reminders
- **Research** — Web search, summarize documents, pull data
- **Code** — Write, review, debug, deploy
- **Writing** — Drafts, memos, structured documents
- **Coordination** — Track tasks, follow up, keep things moving
- **Memory** — Remembers context, preferences, and patterns over time
- **Monitoring** — Heartbeat checks on email, calendar, CI, weather

---

## Customization

Jack is yours to shape. The key files:

| File | Purpose |
|------|---------|
| `SOUL.md` | Jack's personality and behavior |
| `USER.md` | Your info, schedule, preferences |
| `IDENTITY.md` | Jack's name, emoji, contact fields |
| `TOOLS.md` | Accounts, hardware, contacts |
| `HEARTBEAT.md` | Automated check schedules |
| `AGENTS.md` | Model routing, safety rules |

Edit `USER.md` first — fill in your details so Jack knows who he's working for.

Edit `SOUL.md` if you want to adjust Jack's tone or behavior.

---

## Skills Included

- **Email Management** — Triage, draft, send with HTML formatting
- **Calendar Ops** — Schedule awareness, conflict detection, reminders
- **Research & Summarization** — Web search, document analysis
- **Code Assistant** — Multi-language support, PR reviews, debugging
- **Task Tracking** — Memory-backed task and project management
- **Heartbeat Monitoring** — Periodic checks on your key systems
- **Telegram Integration** — Chat with Jack from your phone (configure in `openclaw.json`)

---

## Project Structure

```
jack/
├── README.md              # You're here
├── SOUL.md                # Jack's personality
├── IDENTITY.md            # Jack's identity card
├── USER.md                # Your profile (fill this in)
├── AGENTS.md              # Agent behavior rules
├── HEARTBEAT.md           # Automated monitoring config
├── TOOLS.md               # Accounts & access config
├── MEMORY.md              # Jack's memory index
├── memory/                # Memory files (gitignored)
├── install.sh             # One-command installer
├── openclaw.json.template # Config template
└── .gitignore
```

---

## Built By

Built for **Sean Howen** by **Daniel Heiwig & Chris (AI Familiar)**.

---

## License

MIT — do whatever you want with it.
