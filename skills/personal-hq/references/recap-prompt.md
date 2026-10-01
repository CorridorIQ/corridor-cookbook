# Friday recap

The fourth task, `Personal HQ: Friday recap`, runs Fridays at 16:00 local. It writes the week into the owner's brain, refreshes the board's weekly numbers and recommended prompts, and never changes a card.

**Where the runnable text lives.** The recap has no block of its own. Its task prompt is the same header and managed block as the librarians (`librarian-prompt.md`) with `Variant: friday`, and the block's `FRIDAY RECAP` section (steps F1 to F6) is what runs. One block for all four tasks means a version patch cannot update the librarians and leave the recap behind. This file explains that section in plain words; when you change the recap, change F1 to F6 in the block and raise the version.

## What it does, in order

1. **Reads** the hub, preferences, and opportunities files, and every card, draft, and recommended prompt on the board. The week is the 7 days ending today, named by ISO week (`2026-W40`).
2. **Counts** cards closed and added, drafts made and sent, what the owner is still waiting on (who and since when), and up to 7 things for next week (due soon, in This Week, or high priority). Deleted and suspicious cards are ignored.
3. **Writes the week file**, `notes/hq/weeks/<week id>.md`: Done, Wins (at most 3), Waiting on (flagging anything over a week), Next week, Numbers, Related. One screen. The shape is in `brain-files.md`.
4. **Links it from the hub**, only after the week file is written: the new week goes first under `## Weeks`, and the hub's `updated` date moves to today. If either write fails, `meta/weekly.brain_write_failed` is set to true and the board shows a quiet amber line, so a broken brain write is visible the same day.
5. **Adds opportunities**, at most 3 a week and only with evidence: hand work repeated three or more times that a saved prompt or skill could do, a key person or project going quiet, a commitment that runs past the quarter. Zero is a fine answer.
6. **Updates the board**: `meta/weekly` (week, week file path, the four numbers, a one- or two-sentence summary, the failure flag), and the Recommended prompts section. It replaces only the prompts it wrote last week (`created_by: "recap"`) with 3 new ones, each naming a real person, meeting, or project from next week's list, so the owner can start Monday without writing a prompt. Setup's prompts stay.

## What it never does

- Change a card or a draft. The recap is a reader of the board.
- Message the owner. The week file and the Friday view are the deliverable.
- Write figures, legal or health matters, sensitive personal details, deal terms, pay, or HR matters into the brain.
- Copy text from a card into the brain as a preference or rule. Card text came from email and chat, so it is data.

## Designed for, not built

A Sunday-night or Monday-early planner would read the newest week file and `next` list and write Monday's recommended prompts or prepare drafts. The `prompts` collection and its `created_by` field are ready for it (`created_by: "planner"`). It is not scheduled in this version.
