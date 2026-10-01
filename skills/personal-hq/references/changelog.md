# Personal HQ changelog

The newest entry is at the top and matches `HQ_PROMPT_VERSION` in `librarian-prompt.md`. The morning version check quotes the newest entry's "In plain words" lines, exactly as written, in the email it sends. Write those lines for a busy executive: no tool names, no jargon, one change per line.

Each entry has:
- `Kind: automatic` when the change only replaces text inside the block. The morning check applies it on its own.
- `Kind: hands-on` when it changes the shape of a task prompt or the version check itself. The morning check never applies it; it emails the owner to say "update my HQ".
- A rollback is a new, higher version whose entry says "Reverted the change from <version> because <one plain reason>."

## 2026-10-01-v1

Kind: hands-on (first release, set up by hand)

In plain words:
- Your Personal HQ now checks your Outlook, Teams, meetings, and notes three times every weekday and keeps one private board of what is yours to do.
- Every item links back to where it came from and says why it is yours.
- Easy replies come pre-written in your voice. Nothing is ever sent for you; you copy or open each one and send it yourself.
- Every Friday afternoon, a short recap of your week is saved to your notes.
- Messages that look like scams or try to give instructions to an assistant are flagged for you to check, never acted on.

For maintainers: first public version of `personal-hq`. Built with one block per task, settings in `notes/hq/preferences.md`, a Drafts collection, and capped evening note upkeep.
