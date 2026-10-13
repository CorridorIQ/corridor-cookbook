# The job skill

Setup's output: one skill per recurring job, named `<job>-checks`, that runs every time the job comes up without the verifier loaded.
It holds the owner's standard, the run steps written for this job, the rules every run follows, and, where the job's inputs allow, scripts for the mechanical checks.
What changes from run to run (level, proof, log) lives beside the work, so the skill stays fixed between Updates.

## Folder

```
<job>-checks/
  SKILL.md
  scripts/              only when the inputs keep the same structure every run
    check_<job>.py      every mechanical check, one function each, printing both sides and the result
    test_planted.py     per check: copy the inputs, plant its error, re-read to confirm it landed, assert Failed
```

Write scripts only when the inputs keep the same structure every run: the same export, the same columns, the same repo. Then code checks every row the same way each time. When the inputs change shape from run to run (an email thread, a voice note, a draft), each check is a listed step instead: Claude reads the source without sight of the output, then compares. Such a job has no `scripts/`.
If the job already runs checks (a test suite, a verify command), the skill calls them rather than redoing them.
For a code change in a repo with something to run (a web app, a CLI, an API), the mechanical layer is a `verify-<app>` skill that drives the real thing. Call it if the repo has one. If not, create it: a `verify-<app>` skill whose steps start the app, drive it the way a user would, and capture what comes back (`references/evidence.md`, Code and systems). The job skill adds what that layer lacks: the owner's standard, the stakes, the people-only steps, and the level.

## Building it

1. Scripted checks: write each into `check_<job>.py`, and its planted error into `test_planted.py`. Run the tests; a check that passes its broken copy is rewritten or cut before the skill is shown. A test whose inputs are missing fails and names what is missing. It never skips, because a skipped test reads as a pass.
2. Listed checks: write each as one line in Run step 5 (what is read, from where, without sight of the output, and what it is compared to), with its planted error in the check table. The proof run plants these by hand on a marked copy (`references/checks.md`).
3. Fill in the template below in the owner's words. When ownership is split (one person sets the checks, another owns the definitions), list each owner with what they decide, and send each question in the Run steps to the owner of that area. No amounts, account numbers, or customer details: those go in proof files.
4. Write the description in the job's own words (its command, its file names, the moment it happens), never only "verify", so it doesn't collide with the verifier or another job's skill.
5. Add one trigger line where the job starts, because a description alone may not fire, and a command that says "reply with this and nothing else" stops it outright. In Claude Code or Cowork, put "Then run <job>-checks." at the end of the command or playbook the job runs through, or in the folder's `AGENTS.md` (How a run works, step 5) if there is none. In Claude.ai, the user pastes "Before sending <job>, run <job>-checks." into the project instructions. Name the line and where it went in the hand-off.

## SKILL.md template

```
---
name: <job>-checks
description: Check <job> against <owner>'s standard before it <goes where>. Use when <the job's own words: the command, the file, the moment>, or when <owner> asks whether <output> is right.
---

# <Job> checks

Made with verifier <version, from the verifier's SKILL.md> on <date>. Owner: <name> (<what they decide>), one entry per owner. Used by <who> to <decision or action>.

## Run

1. Read the log at <place>. If no log can be reached (a plain chat), ask for its last line; with none, run at level 1, say the proof status is unknown, and run the proof only if asked. No "checks proven" line: this is the proof run. "Checks proven" but no "proof passed": the checks are proven and only the owner's question is open, so ask it again at step 7 and plant nothing. The latest level line sets the level; no line means level 1. Open exceptions in the log lead this run's report. If today is past Next review, first ask <owner> whether anything about the job has changed.
2. Read back, before any check runs: "<the job's read-back line>", built from the inputs alone. Mark each part as said (by the user) or inferred (by Claude), and turn any two sources that disagree into a question ("The header says 5 of 7 comps; the comp set says 6. Which is right?"). <For work that runs monthly or less often: read back the definitions too.> Wait for a yes; nothing below runs until then. If a script builds this line, run that part on its own first.
3. Human reads, before any of our values are shown: <role, items, threshold>. Ask for each value without ours beside it ("Open <source>, find <item>, and type what you see"), so the person reads the source, not our answer.
4. Gates: <each gate, the checks it blocks, and what to tell whom when it fails>. A failed gate stops every check that depends on it. A case the definitions don't cover gets one question to <owner>; log the answer with the date, and it goes into the definitions at the next Update.
5. Checks. <Scripted: run `scripts/check_<job>.py` on <inputs>.> <Listed, one line each: what is read, from where, without sight of the output, and what it is compared to, such as "each figure in the draft against the sales report" or "one random unit's rent off the live page against the workbook".> Compare the values from step 3 with ours. Then the pointer check: re-open each cited location and confirm the value there.
   On the proof run, also plant each check's error: <scripted: run `scripts/test_planted.py`> <listed: on a marked copy of <the last finished one>, plant each error, re-read to confirm it landed, and run the checks>. Replay <past misses, if any>. When every plant is caught, log "checks proven <date>". That line is about the checks, not this run's data: a run that fails on real data can still prove its checks.
6. Report for the level. Level 1: everything. Level 2: result line, failures, near-misses, one random passed row with its source. Level 3: result line and failures. Write the full proof to <place> and add this run's line to the log.
7. Until "proof passed" is logged: if this run planted errors, show one catch in full (the one closest to a past miss, if there is one) and the rest in one line. Then, with the real output in front of <owner>, ask: "Is there anything here you'd have flagged that these checks didn't?" When they answer, log "proof passed <date>: <their answer, short>". Each thing they name becomes a check through the verifier's Update.
8. After a clean run, count the streak in the log. At <N> clean runs covering <cycle>, tell <owner> the job is ready to step down and that the verifier does it. On <back-to-1 triggers>, log "level 1 from <date>: <trigger>" at once.

## Rules (verifier <version>)

- Report: one result line first, then failures with both sides and the gap, then Not run with who can unblock it, then what was not checked, then the table (# | Output | Value | Label | Source | As-of | Value as read | Check | Result).
- Four results: Passed, Failed, Not run (with why), or Failed, accepted by <name> on <date>: <reason>. Not run never counts as passed.
- On a failure, show both sides and stop. Never plug, round, or redefine a number, and never widen a tolerance, to turn a result green.
- Every number and claim carries where it was read, the value or words read there, and that source's as-of date.
- A value read from a document or page is read without sight of ours, then compared: in code for numbers, dates, and names; otherwise by a separate pass asked to list the differences, never to confirm a match.
- The deliverable ships clean; evidence goes only in the proof file.
- <People only> are done by a person. Claude prepares them.
- A correction from <owner>, or a changed source, layout, definition, or owner, goes to the verifier's Update path, which changes this skill.

## The standard

Source of truth: <for each side>
As-of rule: <the date every source is pulled as of, or which version counts as latest>

Definitions (in <owner>'s words):
| Term | Means | In / out | Formula, if derived |
|---|---|---|---|

| Check | Covers | Compares (direction) | Tolerance | Catches | Planted error | Who, when |
|---|---|---|---|---|---|---|

People only: <what a person always does>
Never include: <what never appears in the output>
Not checked, by choice: <item, reason, date>
Considered and left out: <check, one line on why>
Open, for <name>: <question only they can answer>
Next review: <date>, or sooner if <triggers>
```

## Where it goes

Pick by where the job runs, and tell the user why in one line.

| The job runs in | Job skill | Log and proof | How |
|---|---|---|---|
| A folder, in Claude Cowork or Claude Code | `.claude/skills/<job>-checks/` in that folder, kept with the work, plus the trigger line (Building it, step 5) | `checks/<job> log.md` and `checks/proof/<instance> <period>.<ext>` (the instance is the market, store, or account, for a job run once per each; leave it out otherwise) | Write them after the owner approves the plan. |
| Claude.ai | Customize > Skills, through **Save skill** on the file Claude makes. Needs "Code execution and file creation" on in Settings > Capabilities. | Project files the user adds: "<job> log" and the proof files. Each run hands back its log line and proof file to add. With the Corridor brain connector on, the log can be a brain page instead, written on the user's yes. | Claude can't save it. Show the file and say "Click Save skill." |
| A plain chat | As in Claude.ai | The user keeps the files | As in Claude.ai |
| A definition the whole team should share, such as what counts as a sale | Also proposed to the team brain (`company_propose`) | Not applicable | Pending until a person approves it. |

Name the destination in every save.

## Run log

One line per run, added at the end, never rewritten:

```
<run date> | <period> | level <n> | <passed> passed, <failed> failed, <not run> not run | failures: <short> | open exceptions: <n> | signed: <name, date>
```

Proof runs, level changes, and corrections get their own lines: `checks proven <date>` (every planted error caught), `proof passed <date>: <owner's answer>` (the owner said what the checks missed, or nothing), `level 2 from <date>: <owner>'s yes after <N> clean runs`, `level 1 from <date>: <trigger>`.
Because level lives in the log, a level change never needs the skill re-saved.

## Open exceptions

Carried in the log until closed:

```
<id> | <check> | found <date> | owner <name> | due <date> | closed <date>, check re-run and passed
```

An exception closes only when its check re-runs and passes. "I fixed it" opens the re-run; it does not close the item.
