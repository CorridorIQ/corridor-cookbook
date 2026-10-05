# Personal HQ changelog

The newest entry is at the top and matches `HQ_PROMPT_VERSION` in `librarian-prompt.md`. The morning version check quotes the newest entry's "In plain words" lines, exactly as written, in the email it sends. Write those lines for a busy executive: no tool names, no jargon, one change per line.

Each entry has:
- `Kind: automatic` when the change only replaces text inside the block. The morning check applies it on its own.
- `Kind: hands-on` when it changes the shape of a task prompt or the version check itself. The morning check never applies it; it emails the owner to say "update my HQ".
- A rollback is a new, higher version whose entry says "Reverted the change from <version> because <one plain reason>."

## 2026-10-01-v2

Kind: hands-on (settings in your notes moved to a new format, so the update check changed)

In plain words:
- Your HQ can draft emails for most of your open to-dos at once, in your writing style. Just say "draft my emails".
- Updates now draft for older to-dos too, newest first, and can write a fresh email for something you promised in a meeting.
- Meeting times in drafts come from your real calendar, and two drafts never offer the same time.
- Your HQ checks your calendar and sent mail first, so it stops asking you to book meetings you already booked or send things you already sent.
- Your first board is fuller: it reads meeting transcripts and aims for three to five items per area.
- Update times now follow daylight saving on their own.
- Nothing is ever sent for you.

For maintainers: from the first client pilot. `drafting.md` is now the one drafting spec and builds the voice profile itself (no other skill needed). HQ settings moved from frontmatter to body lines because the brain rejects non-standard keys. Schedules use `CRON_TZ`. New draft fields: `kind`, `ask_date`, `slots_offered`, `depends_on`; new board doc `meta/slots`. The board page is unchanged and ignores the new fields; Mark as sent, the Drafts filters, and age display are a follow-up.

## 2026-10-01-v1

Kind: hands-on (first release, set up by hand)

In plain words:
- Your Personal HQ now checks your Outlook, Teams, meetings, and notes three times every weekday and keeps one private board of what is yours to do.
- Every item links back to where it came from and says why it is yours.
- Easy replies come pre-written in your voice. Nothing is ever sent for you; you copy or open each one and send it yourself.
- Every Friday afternoon, a short recap of your week is saved to your notes.
- Messages that look like scams or try to give instructions to an assistant are flagged for you to check, never acted on.

For maintainers: first public version of `personal-hq`. Built with one block per task, settings in `notes/hq/preferences.md`, a Drafts collection, and capped evening note upkeep.
