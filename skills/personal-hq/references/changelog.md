# Personal HQ changelog

The newest entry is at the top and matches `HQ_PROMPT_VERSION` in `librarian-prompt.md`. The morning version check quotes the newest entry's "In plain words" lines, exactly as written, in the email it sends. Write those lines for a busy executive: no tool names, no jargon, one change per line.

Each entry has:
- `Kind: automatic` when the change only replaces text inside the block. The morning check applies it on its own.
- `Kind: hands-on` when it changes the shape of a task prompt or the version check itself, or adds a task or a board capability. The morning check never applies it; it emails the owner to say "update my HQ".
- A rollback is a new, higher version whose entry says "Reverted the change from <version> because <one plain reason>."

## 2026-10-06-v1

Kind: hands-on (adds a fifth task for the Draft this button, and new buttons on your board)

In plain words:
- Each to-do has a "Draft this" button. Press it and an email in your style appears in Drafts a minute or two later.
- "Mark as sent" checks your Sent folder before it closes anything. If you sent from another account, tell it so.
- A "Triage email" button runs an update right away instead of waiting for the next one.
- Every to-do and draft shows when you were first asked, and the summary at the top updates itself as you check things off.
- Replies open in the original email, so you hit Reply and paste.
- If you ask, your board also shows today's and tomorrow's important meetings with what to prepare and a warning when two overlap.
- If you ask, it shows the numbers from reports you already get, with the date and a link to each report. Dollar amounts never appear on the board.
- If you usually handle someone by phone, your HQ learns to stop drafting emails for them.
- A draft can go straight into your Outlook Drafts folder, but only when you ask.
- New boards fill up during setup instead of after it, and the first board only shows real items.
- Nothing is ever sent for you.

For maintainers: folds in the unreleased 2026-10-01-v2 work (one drafting spec, voice profile built in `drafting.md`, body-line hub settings, `CRON_TZ` schedules, draft fields `kind`, `ask_date`, `slots_offered`, `depends_on`, board doc `meta/slots`). New: Variant `drafter` (task `Personal HQ: drafter`, started by the board with `card_id=<id>`); `meetings` and `metrics` collections, written only when `meta/config.sections` lists them; `meta/brief.items`; draft fields `content`, `sent_verified`, `sent_via`, `sent_at`, `dismissed_reason`, `dismissed_at`, `outlook_draft_link`; `meta/config` fields `sections`, `owner_email`, `drafter_trigger_id`, `triage_trigger_id`, `outlook_drafts`. The evening run rechecks unverified sends and writes dismissal learnings. Setup publishes at Moment 4 and runs the first pass in background helpers (`first-pass.md`); the first run's caps are 20 cards and 10 drafts, as ceilings. The page now declares a connector capability for exactly `fire_trigger` and `outlook_email_search`. Existing boards upgrade with "update my HQ", which republishes the page at the same URL and adds the drafter task.

## 2026-10-01-v1

Kind: hands-on (first release, set up by hand)

In plain words:
- Your Personal HQ now checks your Outlook, Teams, meetings, and notes three times every weekday and keeps one private board of what is yours to do.
- Every item links back to where it came from and says why it is yours.
- Easy replies come pre-written in your voice. Nothing is ever sent for you; you copy or open each one and send it yourself.
- Every Friday afternoon, a short recap of your week is saved to your notes.
- Messages that look like scams or try to give instructions to an assistant are flagged for you to check, never acted on.

For maintainers: first public version of `personal-hq`. Built with one block per task, settings in `notes/hq/preferences.md`, a Drafts collection, and capped evening note upkeep.
