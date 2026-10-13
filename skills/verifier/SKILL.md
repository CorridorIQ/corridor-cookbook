---
name: verifier
description: Verify work against its owner's own checks, with every number and claim beside the source it came from, and build a checks skill for each recurring job. Use when the user asks to verify, tie out, or show the work behind an output; wants checks set up for recurring work such as a report, reconciliation, list, analysis, or email; corrects an output or says a source or definition changed; wants a job's checks stepped down a level; or is about to send work built from data.
---

# verifier

Version 2.2 (2026-10-13). Job skills carry this number; a job skill with an older one is brought up to date at its next Update.

People trust AI work when checking it is cheap.
This skill makes checking cheap two ways: every number arrives beside the exact place it was read, and every recurring job gets its own checks skill, built from its owner's answers, that runs every time the job comes up.
The owner's checks are the standard. Claude finds the facts, proposes, and runs; the owner decides what counts as correct, what tolerance is fine, and when the work can be watched less.

## Pick the path

Look for a job skill for this work: a `<job>-checks` skill in this chat's skills or the folder's `.claude/skills/`.

| Situation | Path |
|---|---|
| A job skill covers this work | Hand over in one line ("This is <job>-checks' job") and run that skill |
| The user corrected an output; a source, report layout, definition, or owner changed; or a job skill says it is ready to step down | **Update** |
| No job skill, and the user wants this one output checked | **Show your work**, then offer setup in one line: "Want this set up so every run checks itself? About fifteen minutes." |
| The user wants checks set up, or said yes to the offer | **Set up**: read `references/setup.md` and follow it step by step |

Done when you have told the user which path, in one line.

## Rules every path follows

- **Independent sides.** Each automatic check compares two things from different places: a total the source prints against the sum of its rows, the bank against the book, a closed period's known answer. Arithmetic runs in code or a formula. Claude re-reading its own output adds no evidence, and neither does a second pull of the same extract.
- **Read values, then compare.** When a value must be read from a document, read it in a step that asks for the value ("what is the total on page 1?") and compare the two in code. Where the comparison is not a number, date, or name (is every ask answered?), a separate pass sees both sides and is asked to list the differences, never to confirm a match. In Claude Cowork or Claude Code, give that read to a subagent that sees only the source.
- **Pointer, value as read, as-of.** Every number and claim carries where it lives (file > sheet > cell or rows; report name and run date; sender and date), the value read there, and that source's as-of date. A description of the method is not a pointer.
- **Labels.** Each value is found (read from a source), calculated (from found values, formula shown), assumed (filled in by Claude or a rule), or judgment (a call someone made). Assumptions the result depends on are listed first.
- **Four results.** Passed, Failed, Not run (with why), or Failed, accepted by <name> on <date>: <reason>. Each shows both observed values. Not run never counts as passed, and it is the right answer when a source is out of reach.
- **Open differences stay open.** On a failed check, show both sides and the gap, and stop. The owner decides what happens to a failure. Hard guardrail: never plug, round, or redefine a number, and never widen a tolerance mid-run, to turn a result green.
- **Say what was not checked.** Every report ends with the numbers that have no check, the sources not opened, and the assumptions made.
- **Clean deliverable, separate proof.** The work ships the way the owner would send it; evidence goes in a proof file beside it. Read `references/evidence.md` for the format in the medium at hand.
- **People do the one-way things.** Posting, paying, approving, sending outside the team, promising a customer, closing a period, and moving or deleting source files are done by a person. Claude prepares them.

## Show your work

The report every path uses, and the one each job skill copies:

1. One result line first: "9 passed, 1 failed, 1 not run (bank portal: controller). Nothing was changed or sent."
2. Failures, each with both sides and the difference.
3. Not run, each with what it needs and who can get it.
4. Not checked.
5. The table, one row per number or claim in the output:

| # | Output | Value | Label | Source | As-of | Value as read | Check | Result |
|---|---|---|---|---|---|---|---|---|
| 4 | Store 12 net sales, Sep | 48,210.55 | calculated | POS export 2026-09-30.xlsx > Sales > rows 4-19, Store = 12 | 9/30 | 48,210.55 (sum, trade-ins netted) | Control total to the export's printed store total | Passed |

With no job skill, run what needs no standard: the pointer check on every row, row counts where the source has rows, and any total the source prints; everything else goes under Not checked.
A one-off (a big email, a board memo, a change going live) is verified once, in this chat, and gets no job skill. First ask three questions, one per message: "What would make this wrong?", "Which parts matter most to get right?", and "Who is it going to, and can you take it back?" The answers become this run's checks.
Before pulling data with columns, list each field with its meaning and wait for a yes ("define before you pull").
Done when every number and claim in the output has a row and every row has a result.

## Update

Changes a job skill. Read `references/job-skill.md` first.

1. **A correction.** Fix the output and show it before and after. Turn the correction into a check: a mechanical one ("trade-ins are negative-quantity lines") becomes a function in the script plus its planted-error test, or, in a job without scripts, a listed check with its planted error; a judgment one ("commentary names the cause, not the number") becomes a human check in the owner's words. Run the test to show it catches the error.
2. **A change, or an error that got out.** A new source, report layout, definition, owner, or model, or a real error that reached someone: update the standard, and log "level 1 from <date>: <trigger>". Re-run the last finished one and compare it to its proof.
3. **A step down.** Read `references/trust-ladder.md`, check its four conditions against the log, and on the owner's yes log the new level.
4. Show the check table with any change marked, ask "Save this?", and rebuild the skill with today's verifier version in its stamp.

Done when the change is in the saved job skill and every new check has been seen catching its planted error.

## Traps seen in the field

- A field means something other than its name says: trade-ins entered as negative quantities, so "sales" and "units" depend on a definition.
- Two sources from different days: yesterday's extract against today's screen.
- A filtered or truncated export, so every tie-out to it passes.
- A second total that came from the same place as the first, so it cannot disagree.
- A save to the wrong brain, project, or folder. Name the destination in every save.

## Worked examples

`references/examples.md` has one finished standard per kind of work (a bank rec, sales reporting, accruals, a voice note to a board, a weekly recap, a repair intake, an access review, a big email, a code change) and two complete job skills, one with scripts and one without. Read it before proposing a plan, and show one when the user wants to see what finished looks like.
