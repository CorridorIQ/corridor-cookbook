---
name: verifier
description: Verify work against its owner's own checks, with every number and claim beside the source it came from, and build a checks skill for each recurring job. Use when the user asks to verify, tie out, or show the work behind an output; wants checks set up for recurring work such as a report, reconciliation, list, analysis, or email; corrects an output or says a source or definition changed; wants a job's checks stepped down a level; or is about to send work built from data.
---

# verifier

Version 2.3 (2026-10-13). Job skills carry this number; one with an older number is rebuilt with this one at its next Update.

The owner's checks are the standard: the owner decides what counts as correct, what tolerance is fine, and when the work can be watched less. Claude only finds facts, proposes, and runs.

## Pick the path

Look for a `<folder>-<job>-checks` skill (`<job>-checks` from earlier versions): loaded here, in the work folder's `skills/`, in `~/.claude/skills/`, in `~/.agents/skills/`, or in the folder's `.claude/skills/` (where earlier versions saved them). Installed skills are shared across folders: use one whose recorded work folder is this one (in a chat app, the project stands in for the folder). One that records another folder, or an older one with none recorded found outside this folder: ask the user whether this run is that job before using it.

- A job skill covers this work: say "This is <folder>-<job>-checks' job" and run it.
- The user corrected an output; a source, report layout, definition, or owner changed; or a job skill says it is ready to step down: **Update**, per `references/job-skill.md`.
- No job skill; the user wants this one output checked: **Show your work**, then offer: "Want this set up so every run checks itself? About fifteen minutes."
- The user wants checks set up, or said yes: **Set up**, following `references/setup.md` step by step.

Done when you have told the user the path, in one line.

## Rules every path follows

Job skills copy this list word for word.

- **Independent sides.** Each automatic check compares two things from different places: a source's printed total vs the sum of its rows, bank vs book, a closed period's known answer. Arithmetic runs in code or a formula, never by eye. Not evidence: Claude re-reading its own output, a second pull of the same extract, a second total from the same place. No independent second side: make it a human check or put it under Not checked.
- **Read, then compare.** Read a value from a document or page in a step that asks for it ("what is the total on page 1?"), without sight of ours; compare in code for numbers, dates, and names. Otherwise a separate pass sees both sides and lists the differences, never confirms a match. In Claude Cowork or Code, a subagent that sees only the source does the read.
- **Pointer, value as read, as-of** on every number and claim: where it lives (file > sheet > cell or rows; report name and run date; sender and date), the value or words read there, that source's as-of date. A description of the method is not a pointer.
- **Labels:** found (read from a source), calculated (from found values, formula shown), assumed (filled in by Claude or a rule), judgment (someone's call). Assumptions the result depends on come first.
- **Four results:** Passed; Failed; Not run (with why); Failed, accepted by <name> on <date>: <reason>. No fifth such as "flagged". Each shows both observed values. Not run never counts as passed, and is the right answer when a source is out of reach.
- **Open differences stay open.** On a failure, show both sides and the gap, and stop; the owner decides. Explanations offered always include "it is a data error", plus the document that would decide. Hard guardrail: never plug, round, or redefine a number, or widen a tolerance, to turn a result green. A tolerance changes only through setup or Update, never to clear a failure in front of you; a failure the owner accepts is "Failed, accepted by".
- **Say what was not checked.** Every report ends with the numbers with no check, sources not opened, and assumptions made.
- **Clean deliverable, separate proof.** The work ships as the owner would send it; evidence goes in a proof file beside it.
- **People do the one-way things:** posting, paying, approving, sending outside the team, promising a customer, closing a period, deploying, migrating or deleting data, moving or deleting source files. Claude only prepares them.
- **Exceptions close on a re-run.** An open exception closes only when its check re-runs and passes; "I fixed it" opens the re-run.

Before building the deliverable or its proof, read `references/evidence.md` for the medium at hand.

## Show your work

The report, in this order on every path; job skills copy its five parts and the table header word for word:

1. Result line: the counts passed, failed, and not run; who can unblock each Not run; and whether anything was changed or sent. "9 passed, 1 failed, 1 not run (bank portal: controller). Nothing was changed or sent."
2. Failures, each with both sides and the difference.
3. Not run, each with what it needs and who can get it.
4. Not checked.
5. The table, one row per number or claim in the output:

| # | Output | Value | Label | Source | As-of | Value as read | Check | Result |
|---|---|---|---|---|---|---|---|---|
| 4 | Store 12 net sales, Sep | 48,210.55 | calculated | POS export 2026-09-30.xlsx > Sales > rows 4-19, Store = 12 | 9/30 | 48,210.55 (sum, trade-ins netted) | Control total to the export's printed store total | Passed |

With no job skill, run only what needs no standard: the pointer check on every row (re-open each cited location, confirm the value), row counts where the source has rows, and any total the source prints. All else goes under Not checked.
Define before you pull: before pulling data with columns, list each field and its meaning; wait for a yes.
A one-off (big email, board memo, change going live) is verified once, here; no job skill unless the user wants that kind of work checked every time. First ask, one per message: "What would make this wrong?" "Which parts matter most to get right?" "Who is it going to, and can you take it back?" The answers are this run's checks.

Done when every number and claim in the output has a row and every row has a result.

## Traps seen in the field

- A field means other than its name: trade-ins as negative quantities change "sales" and "units".
- Sources from different days: yesterday's extract against today's screen.
- A filtered or truncated export: every tie-out to it passes.
- A save to the wrong brain, project, or folder. Name the destination in every save.

## Worked examples

`references/examples.md`: one finished standard per kind of work and two job skills, one scripted and one with listed checks. Read before proposing a plan; show it when the user wants to see finished work.
