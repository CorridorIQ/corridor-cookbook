# Brain files

Personal HQ keeps two kinds of state. Today's cards and drafts live on the board. Everything that should still matter next month lives in the owner's brain as plain Markdown, so it survives a new board, a new scheduler, or a move to another harness. No card is ever mirrored into the brain.

Every file below sits under `notes/hq/`, has YAML frontmatter, and ends with a `## Related` section of standard Markdown links, `[Preferences](notes/hq/preferences.md)`, because the brain server expects them, not wikilinks. Frontmatter carries only the server's standard keys (title, type, status, owner, created, updated, confidence, sources, tags, links); the brain rejects any other key. HQ settings (`board_url`, `hq_version`, `auto_updates`, `timezone`) go as plain `key: value` lines at the top of the body instead. `personal_update` stamps `updated` itself: never edit a date by hand. The hub links all of them. Write new files with `personal_write`; change existing ones with `personal_read` then `personal_update`, so nothing the owner added is lost.

## Who writes what

| File | Written by | When | Never written by |
| --- | --- | --- | --- |
| `notes/hq/hq.md` | Setup; Friday recap (week link, `updated`); evening librarian (`updated`, only when it wrote); morning version check (the `hq_version:` line); "roll back my HQ" (the `auto_updates:` line) | Setup, Fridays, evenings with writes, update mornings | Morning and midday card work |
| `notes/hq/preferences.md` | Setup; this skill in chat when the owner asks for a change | Setup, then on request only | Any scheduled task. Librarians read it every run and only suggest "possible preference: ..." in `meta/sweep.summary`. |
| `notes/hq/learnings.md` | Setup (empty); evening librarian | Evenings, at most 2 lines a day | Anything that copies text from a message |
| `notes/hq/opportunities.md` | Setup (empty); Friday recap | Fridays, at most 3 lines a week | Librarians |
| `notes/hq/weeks/YYYY-Www.md` | Friday recap | Fridays | Anyone else |
| `notes/hq/backups/<version>.md` | Morning version check, before it patches | Update mornings | Anyone else |
| `notes/my-email-voice.md` | Setup or "learn my voice" (`drafting.md`); evening librarian appends to `## Learned from edits` only | Setup or on request; at most one rule a week | Anything that copies text the owner received |

People, project, and decision pages elsewhere in the brain get at most 5 evening writes a day (librarian STEP 13), each checked with `personal_search` first.

## The hub: `notes/hq/hq.md`

```markdown
---
title: My Personal HQ
owner: Jordan Reyes
type: note
status: active
created: 2026-10-01
updated: 2026-10-01
confidence: high
sources: [setup]
tags: [personal-hq]
links: [notes/hq/preferences.md, notes/hq/learnings.md, notes/hq/opportunities.md]
---
Last upkeep: 2026-10-01

board_url: https://claude.ai/artifact/abc123
hq_version: 2026-10-01-v2
auto_updates: on

Jordan's Personal HQ: a private board that three librarians keep current from Outlook, Teams, meetings, and this brain, plus a Friday recap.

## Files
- [Preferences](notes/hq/preferences.md): what to look for and what to leave out
- [Learnings](notes/hq/learnings.md): patterns learned from how Jordan works
- [Opportunities](notes/hq/opportunities.md): bigger things worth a look
- [Email voice](notes/my-email-voice.md): how Jordan writes, used for drafts

## Weeks
(the Friday recap adds one line per week here, newest first)

## Related
- [Identity](core/identity.md)
- (up to 5 key people and project pages from setup)
```

`auto_updates` is `on` or `paused`. Read and change these lines with `personal_read` and `personal_update`, like any body text. Only "roll back my HQ" pauses it and only "check my HQ" turns it back on, with the owner's yes. Remove the `(the Friday recap ...)` hint line when the first week link is added. If `notes/my-email-voice.md` does not exist yet, leave its line out and add it when the voice profile is built.

## Settings: `notes/hq/preferences.md`

```markdown
---
title: HQ preferences
type: note
status: active
owner: Jordan Reyes
created: 2026-10-01
updated: 2026-10-01
confidence: high
sources: [setup]
tags: [personal-hq]
links: [notes/hq/hq.md]
---
timezone: America/Chicago

## What I want each morning
"A holistic picture of what I've got in the works, without every single follow-up." (Jordan, setup, 2026-10-01)
- Aim for the top 3 to 5 open to-dos per area.
- Read meeting transcripts, not just summaries.

## Areas
- Operations (9 communities; executive directors report in)
- Owner relations
- Risk and compliance

## People I answer to
- Dana Whitfield (CEO)

## Key people and projects
- Marcus Lee, VP Operations: [Marcus lee](people/marcus-lee.md)
- Q4 owner reviews: [Q4 owner reviews](projects/q4-owner-reviews.md)
- Client email domains (when areas are clients): oakparkliving.com, harborpoint.com

## Sources
outlook, teams, meeting, brain, phone

## Leave out
- Personal email from family (Jordan's words: "anything from my sister")
- Always left out by company policy: financial figures and account numbers, legal terms and advice, health information, highly sensitive personal details, passwords and codes.

## What counts as mine
- Asked of me by name, my own promises, or clearly a priority in my areas. Not "can someone" to a group, unless it is a project I own.
- Every promise I made in a meeting or email: recaps, intros, scheduling, sending something.
- Steps I owe in a client's onboarding, and anything blocking a client.
- When my areas are clients: an unaddressed ask from a client's contact to my company or team ("can you guys", "Jordan and Sam") counts as mine, unless a teammate clearly took it.
- Before making a scheduling to-do or draft, check my calendar. If I already organized an event with that person after the ask, it is done.
- If I close a to-do or say I handled it by phone, it never comes back.

## Schedule
- Morning 7:00, midday 12:00, evening 17:00, weekdays. Friday recap 16:00. Times are America/Chicago.

## Related
- [HQ hub](notes/hq/hq.md)
- [Dana whitfield](people/dana-whitfield.md)
```

Rules:
- Areas: 2 to 8, in the owner's words. These also fill the board's `__AREAS__` token and `meta/config.areas`; keep all three in step when one changes.
- Leave out: the owner's own words, quoted where possible, then the policy line exactly as above. If they named nothing, write only the policy line.
- Sources: ids from `outlook | teams | meeting | brain | phone | pocket`. These match `meta/config.sources` and the board's source chips.
- Schedule: local times the owner agreed to. Tasks use `CRON_TZ=<timezone>` schedules, so these times hold through daylight saving.
- The "What counts as mine" lines after the first are defaults from the pilot. Keep the client line only when areas are clients or accounts; drop any line the owner disagrees with.
- The first-run lookback is not here. It is `meta/config.lookback_days`, used once.

## Learned patterns: `notes/hq/learnings.md`

```markdown
---
title: HQ learnings
owner: Jordan Reyes
updated: 2026-10-01
---
Patterns the evening librarian noticed in how Jordan works. Each line names what they did. Delete any line that is wrong.

## Learnings
- 2026-10-08: Deletes cards from the facilities vendor portal; treat its notices as noise. Evidence: deleted 4 such cards this week.

## Related
- [HQ hub](notes/hq/hq.md)
- [Preferences](notes/hq/preferences.md)
```

At most 2 new lines a day and 40 in total; past 40, the oldest are folded into one summary line. Each line is a pattern in the owner's own behavior: cards deleted, drafts dismissed, replies sent, cards moved. A line never quotes or paraphrases a message as a rule (security rule 13), because every later run trusts this file.

## Opportunities: `notes/hq/opportunities.md`

```markdown
---
title: HQ opportunities
owner: Jordan Reyes
updated: 2026-10-01
---
Bigger than a to-do: repeated work worth automating, relationships going quiet, commitments that run past this quarter. The Friday recap adds at most 3 a week. Delete what is not useful.

## Opportunities
- 2026-10-09: The weekly occupancy summary was assembled by hand three Fridays running; a saved prompt could draft it. Source: [2026 W41](notes/hq/weeks/2026-W41.md).

## Related
- [HQ hub](notes/hq/hq.md)
```

## A week: `notes/hq/weeks/2026-W40.md`

Frontmatter `title`, `week`, `generated`, `owner`. Sections in order: `## Done`, `## Wins`, `## Waiting on`, `## Next week`, `## Numbers` (cards added, cards closed, drafts made, drafts sent), `## Related`. One screen. The exact shape is in the FRIDAY RECAP section of `librarian-prompt.md`. Week ids are ISO weeks (Monday start), the usual weekly-note naming.

## Restore point: `notes/hq/backups/<version>.md`

Written by the morning version check before it changes any task. Frontmatter `title`, `saved`, `version`. One `## <task name>` section per task holding its full prompt in a fenced block, then `## Related` linking the hub. "Roll back my HQ" restores from the newest one. These hold no mailbox data, only the task prompts.

## The currency guarantees

The brain stays current without anyone being asked to maintain it, through four cheap checks:

1. **Evening:** if the librarian wrote anything to the brain, it bumps the hub's `updated`, then writes `meta/brain` so the board footer can say "Notes current as of Oct 1".
2. **Friday:** the recap writes the week file, then the hub link, in that order. If either fails it sets `meta/weekly.brain_write_failed: true` and the board shows a quiet amber line.
3. **Morning:** if the hub's `updated` is more than 10 days old, the librarian adds one card: "Refresh your HQ notes ... say 'check my HQ'". Staleness is visible within a day, for the cost of one read.
4. **Version:** the morning check sets the hub's `hq_version` after an update, and every run writes `hq_version` to `meta/sweep`, so drift shows on the board and in the brain.

## Policy exclusions

Never in any brain file: financial figures and account or card numbers, legal terms and advice, health information, highly sensitive personal details, passwords and codes. A relevant event keeps only a sanitized gist, such as "Call with the lender about the Oak Park refinance; follow-up needed."
