# The job skill

Contents: Folder. Building it. SKILL.md template. Where it goes. Run log and open exceptions.

One skill per recurring job, `<job>-checks`, that runs each time the job comes up without the verifier loaded, so the template carries everything a run needs. What changes per run (level, proof, log) lives beside the work, so the skill stays fixed between Updates.

## Folder

```
<job>-checks/
  SKILL.md
  scripts/              only when the inputs keep the same structure every run
    check_<job>.py      every mechanical check, one function each, printing both sides and the result
    test_planted.py     per check: copy the inputs, plant its error, re-read to confirm it landed, assert Failed; re-run after every Update
```

Scripts only when the inputs keep the same structure every run (the same export, columns, repo); when they change shape (an email thread, a voice note, a draft), each check is a listed step and there is no `scripts/`. Call checks the job already runs (a test suite, a verify command) rather than redo them.
For a code change with something to run (a web app, a CLI, an API), the mechanical layer is a `verify-<app>` skill: call the repo's, or create one that starts the app, drives it the way a user would, and captures what comes back. The job skill adds the owner's standard, the stakes, the people-only steps, and the level.

## Building it

1. Scripted checks go in `check_<job>.py`, each planted error in `test_planted.py`. Run the tests; a check that passes its broken copy is rewritten or cut before the skill is shown. A test whose inputs are missing fails and names them; it never skips, because a skip reads as a pass.
2. Listed checks are one line each in Run step 5, with the planted error in the check table.
3. Fill in the template in the owner's words. With split ownership, list each owner with what they decide, and route each question to the owner of that area. No amounts, account numbers, or customer details: those go in proof files.
4. Write the description in the job's own words (its command, file names, the moment it happens), never only "verify", so it doesn't collide with the verifier or another job skill.
5. Add one trigger line where the job starts, because a description alone may not fire, and a command that says "reply with this and nothing else" stops it outright. In a folder: "Then run <job>-checks." at the end of the command or playbook the job runs through, or in the folder's `AGENTS.md`. In a chat app: the user pastes "Before sending <job>, run <job>-checks." into the project instructions. Name the line and where it went in the hand-off.

## SKILL.md template

```
---
name: <job>-checks
description: Check <job> against <owner>'s standard before it <goes where>. Use when <the job's own words: the command, the file, the moment>, or when <owner> asks whether <output> is right.
---

# <Job> checks

Made with verifier <version, from the verifier's SKILL.md> on <date>. Owner: <name> (<what they decide>), one entry per owner. Used by <who> to <decision or action>.

## Run

1. Read the log at <place>. If none can be reached (a plain chat), ask for its last line; with none, run at level 1, say the proof status is unknown, and run the proof only if asked. No "checks proven" line: this is the proof run. "Checks proven" but no "proof passed": only the owner's question is open, so ask it at step 7 and plant nothing. The latest level line sets the level; no line means level 1. Open exceptions lead the report. If today is past Next review, first ask <owner> whether anything about the job has changed.
2. Read back, before any check runs: "<the job's read-back line>", built from the inputs alone. Mark each part said (by the user) or inferred (by Claude), and turn any two sources that disagree into a question ("The header says 5 of 7 comps; the comp set says 6. Which is right?"). <Monthly or rarer: read back the definitions too.> Nothing below runs until a yes. If a script builds this line, run that part alone first.
3. Human reads, before any of our values are shown: <role, items, threshold>. Ask for each value without ours beside it: "Open <source>, find <item>, and type what you see."
4. Gates: <each gate, the checks it blocks, what to tell whom when it fails>. A failed gate stops every check that depends on it. A case the definitions don't cover gets one question to <owner>; log the answer with the date, and add it to the definitions at the next Update.
5. Checks. <Scripted: run `scripts/check_<job>.py` on <inputs>.> <Listed, one line each: what is read, from where, without sight of the output, and what it is compared to.> Compare step 3's values with ours. Then the pointer check: re-open each cited location and confirm the value.
   Proof run: tell <owner> what you will break and why. Plant each check's error, never in live work: <scripted: run `scripts/test_planted.py`> <listed: on a copy of <the last finished one> marked as a test, plant each error, re-read to confirm it landed, run the checks, discard the copy>. Replay <past misses>. When every plant is caught, log "checks proven <date>". That line is about the checks, not the data: a run that fails on real data can still prove its checks.
6. Report for the level. Level 1: everything. Level 2: result line, failures, near-misses (within 10% of a tolerance), one random passed row with its source. Level 3: result line, failures, one random passed row with its source. Write the full proof to <place> and add this run's line to the log.
7. Until "proof passed" is logged: if errors were planted, show one catch in full (what changed, the check, both sides, Failed; the one closest to a past miss) and the rest in one line. Then, with the real output in front of <owner>: "Is there anything here you'd have flagged that these checks didn't?" Log "proof passed <date>: <their answer, short>". Each thing they name becomes a check through the verifier's Update.
8. After a clean run, count the streak. At <N> clean runs covering <cycle>, tell <owner> the job is ready to step down and that the verifier does it. On <back-to-1 triggers>, log "level 1 from <date>: <trigger>" at once.

## Rules (verifier <version>)

- Report: one result line, then failures with both sides and the gap, then Not run with who can unblock it, then what was not checked, then the table (# | Output | Value | Label | Source | As-of | Value as read | Check | Result).
- Four results: Passed, Failed, Not run (with why), or Failed, accepted by <name> on <date>: <reason>. Not run never counts as passed.
- On a failure, show both sides and stop. Never plug, round, or redefine a number, and never widen a tolerance, to turn a result green.
- Every number and claim carries where it was read, the value or words read there, and that source's as-of date.
- A value read from a document or page is read without sight of ours, then compared: in code for numbers, dates, and names; otherwise by a separate pass asked to list the differences, never to confirm a match.
- The deliverable ships clean; evidence goes only in the proof file.
- <People only> are done by a person. Claude prepares them.
- An open exception closes only when its check re-runs and passes; "I fixed it" opens the re-run.
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

After the owner approves the plan, write the master copy to the work folder at `skills/<job>-checks/` (tool-neutral; it travels with the folder), then install it for the tool in use and tell the user why there, in one line. Full steps, when present: the cookbook's `make-a-skill/references/install.md`. Short version:

- **Claude Code:** copy to `~/.claude/skills/<job>-checks/`. **Codex:** copy to `~/.agents/skills/<job>-checks/`.
- **Claude Cowork, claude.ai, a plain chat:** Claude can't install it (Cowork loads the account's skills, not `~/.claude/skills/`). Hand over a zip; the user uploads it: Customize > Skills > + > Create skill > Upload a skill. claude.ai needs "Code execution and file creation" on in Settings > Capabilities.
- **ChatGPT:** hand over a zip; the user uploads it: Plugins > Skills > Create > Upload from your computer.
- **Log and proof:** in a work folder, `checks/<job> log.md` and `checks/proof/<instance> <period>.<ext>` (instance: the market, store, or account for a job run once per each; otherwise leave it out). In a chat app, project files the user adds or keeps ("<job> log" and the proof files); each run hands back its log line and proof file. With the Corridor brain connector on, the log can be a brain page, written on the user's yes.
- **A definition the whole team should share** (what counts as a sale): also propose it to the team brain (`company_propose`); it is pending until a person approves it.

Name the destination in every save.

## Run log and open exceptions

One line per run, added at the end, never rewritten:

```
<run date> | <period> | level <n> | <passed> passed, <failed> failed, <not run> not run | failures: <short> | open exceptions: <n> | signed: <name, date>
```

Own lines for proof, level, and corrections: `checks proven <date>`, `proof passed <date>: <owner's answer>`, `level 2 from <date>: <owner>'s yes after <N> clean runs`, `level 1 from <date>: <trigger>`.

Open exceptions stay in the log until closed:

```
<id> | <check> | found <date> | owner <name> | due <date> | closed <date>, check re-run and passed
```
