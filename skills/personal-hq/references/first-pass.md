# First pass: filling a new board during setup

The first pass reads the last `lookback_days` (14 by default) and fills the board while the person finishes setup. It starts right after Publish, runs in background helpers split by area, and the main chat merges what they return. Up to 20 cards and up to 10 drafts. Those are ceilings: a board with 9 real items shows 9, and filler is a failure.

**For maintainers: why it is built this way.** Helpers follow the librarian block in `librarian-prompt.md` instead of a copy of its rules, so HUNT, ADJUDICATE, card fields, and draft conditions keep one source of truth. Helpers write nothing. The main chat writes once, because only it holds the Leave out answer (Moment 5), the voice profile (Moment 6), and every helper's scheduling needs, and because a single writer cannot race itself. A dedicated `Variant` for this was rejected: every scheduled run would pay its tokens forever for a job that runs once.

## When to use helpers

Use helpers when the host has a subagent tool that can run in the background (an Agent or Task tool with a background option). Otherwise use the fallback at the end. Use the fallback too if helpers report Microsoft 365 or the brain "not connected" while the chat has them.

## Split

Up to 4 helpers, each with 1 to 3 areas, balanced by how busy each area looks. Helper 1 also covers People I answer to and direct asks that fit no area. If the subagent tool takes a model, pass Sonnet 5.5: two weeks of seven client areas cost about 1M tokens on the pilot's discovery helpers.

## The helper brief

Fill the angle brackets with real values and send each helper this:

> You are a Personal HQ first-pass helper for <full name> (<work email>), timezone <IANA timezone>. Open <skill folder>/references/librarian-prompt.md and read its fenced block. Follow its SAFETY RULES, TOOLS, STEP 3 to STEP 6, and STEP 8 conditions 1 to 7, as a first run with Variant morning, with these changes:
> - Window: the last <lookback_days> days, up to now.
> - Your areas: <each area with its people, projects, and client email domains>. Read only what touches them.<For helper 1: You also cover asks from <people they answer to> and direct asks to the owner that fit no area.>
> - Preferences: use these instead of notes/hq/preferences.md. What they want each morning: "<their Moment 2 words>". What counts as mine: <the lines from brain-files.md, adapted>.
> - The board is new and empty. Skip STEP 0, 1, 2, 7, and 9 onward, and every board read.
> - Budget: up to <ceil(20 / helpers), at least 6> cards. No minimum.
> - Write nothing anywhere. Return one JSON object and nothing else:
>   {"cards": [{the STEP 6 fields, plus "tier" (1 to 4, STEP 5) and "draft": null or {"kind", "to", "cc", "subject", "thread_link", "content", "scheduling", "facts": ["short fact (where you read it)"], "ask": "what the email must do"}}], "also_seen": ["short title (who)"], "audit": {"sources_read": [], "seen": 0, "kept": 0, "dropped": {}}}
> - Set "draft" only when STEP 8 conditions 1 to 7 hold. Leave the body to the main chat.

## Merging (main chat)

Check for returned helpers between moments. Never end your turn to wait; the person would have to type to wake you. When all are back, and after Moment 6 if it is still in progress:

1. Drop candidates under the Leave out answer from Moment 5.
2. Dedupe across helpers with STEP 4's cluster test: one card per ask, the most direct source kept, the others named in detail ("Also raised in Tuesday's sync.").
3. Keep up to 20 cards in STEP 5's order, with at most 3 suspicious cards outside the 20. The rest go in "Also seen" (at most 6).
4. Draft up to 10 of the kept cards that carry a "draft", newest ask first, following `drafting.md`. Use the voice profile if Moment 6 built it (else plain, `voice_version: "none"`). Read the calendar and `meta/slots` once and allocate windows across all drafts together. Use only the helper's facts; anything else goes in [brackets] and `assumptions`.
5. Write one ArtifactData batch: the cards (doc ids per STEP 6), the drafts, each card's `draft_id`, `meta/slots`, `meta/brief` (`focus`, `items`, `written_at`, per STEP 11), and `meta/sweep` (`last_sweep_at` now, `last_variant: "setup"`, `sweep_count: 1`, `hq_version`, `summary` in STEP 12's shape, `audit` summed across helpers, `recent` with one line).

Then show the board (the script's words) and start the test run.

## Test run

`fire_trigger` the midday librarian once. Because `last_sweep_at` is set, it reads only about the last day, so it is quick and cheap. It proves scheduled runs work and fills meetings and metrics when those sections are on. Check `list_triggers` between short beats until `last_run.finished_at` is set, then read `meta/sweep.summary`. A run that never finishes usually means permissions: check `permission_mode` and return to the walkthrough.

## Fallback: one back pass

With no background helpers, run the first pass after Schedule instead: `fire_trigger` the morning librarian. With no `last_sweep_at`, it runs as a first run over the lookback window with the same ceilings (20 cards, 10 drafts). Teach the board while it runs (3 to 6 minutes), then read `meta/sweep`, `todos`, and `drafts`, and show the board. This run is also the test run.
