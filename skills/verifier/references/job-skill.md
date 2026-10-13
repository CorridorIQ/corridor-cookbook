# The job skill

Contents: Update. Folder. Building it. SKILL.md template. Where it goes. Run log and open exceptions.

One skill per recurring job, `<folder>-<job>-checks` (`<folder>`: the work folder's short name, or the project's in a chat app, as in the cookbook's make-a-skill `<folder>-<job>`), run each time the job comes up, without the verifier loaded, so the template carries everything a run needs. What changes per run (level, proof, log) lives beside the work; the skill stays fixed between Updates. Older `<job>-checks` skills keep their name. Installed copies are shared across folders, so the folder in the name keeps two folders' jobs from overwriting each other, and the recorded work folder keeps a run from reading another folder's log.

## Update

1. **Correction.** Fix the output; show before and after. Make it a check: mechanical ("trade-ins are negative-quantity lines") becomes a script function plus its planted-error test, or without scripts a listed check with its planted error; judgment ("commentary names the cause") becomes a human check in the owner's words. Run the test; show it catches the error.
2. **Change, or an error that got out:** new source, report layout, definition, owner, or model, or a real error that reached someone. Update the standard; log "level 1 from <date>: <trigger>". Re-run the last finished one now and compare it to its proof; show the result before saving.
3. **Step down.** Check the four conditions in `references/trust-ladder.md` against the log; log the new level only on the owner's yes.
4. Show the check table with changes marked, ask "Save this?", rebuild with the verifier's current version in the stamp and Rules heading, reinstall where the job runs. A job skill found in a folder's `.claude/skills/` (saved by an earlier version) moves to the folder's `skills/` now, under its existing name, and gets its work folder recorded. Before installing it, if an installed copy with that name records another work folder, rename this one `<folder>-<job>-checks` and rewrite its trigger line (Building it, step 5) to match, naming both in the hand-off. Otherwise rename nothing: a renamed skill strands its trigger line and leaves the old installed copy running.

Done when the change is in the saved job skill, every new check has been seen catching its planted error, and after a change (step 2) the last finished one has been re-run against its proof.

## Folder

```
<folder>-<job>-checks/
  SKILL.md
  scripts/            only when inputs keep the same structure every run
    check_<job>.py    each mechanical check a function printing both sides and the result
    test_planted.py   per check: copy inputs, plant its error, re-read to confirm, assert Failed; re-run after every Update
```

Inputs that change shape (an email thread, a draft): each check is a listed step, no `scripts/`. Call checks the job already runs (test suite, verify command); don't redo them.
A code change with something to run (web app, CLI, API): the mechanical layer is a `verify-<app>` skill. Call the repo's, or create one that starts the app, drives it as a user would, and captures what comes back, following `references/evidence.md`, Code and systems. The job skill adds the owner's standard, stakes, people-only steps, and level.

## Building it

1. Write the scripts; run the tests. A check that passes its broken copy is rewritten or cut before the skill is shown. A test whose inputs are missing fails and names them; never skips (a skip reads as a pass).
2. Listed checks: one line each in Run step 5; planted error in the check table.
3. Fill the template in the owner's words. Split ownership: list each owner with what they decide; route each question to that area's owner. Amounts, account numbers, and customer details go in proof files, never here.
4. Description in the job's own words (its command, file names, the moment it happens), never only "verify", plus the work folder's name, so it doesn't collide with the verifier or another job skill.
5. One trigger line where the job starts, since a description alone may not fire, and a command that says "reply with this and nothing else" stops it outright. In a work folder (Claude Code, Claude Cowork, Codex): "Then run <folder>-<job>-checks." at the end of the command or playbook the job runs through, or in the folder's `AGENTS.md` if there is none. In claude.ai, ChatGPT, or a plain chat: the user pastes "Before sending <job>, run <folder>-<job>-checks." into project instructions. Name the line and where it went in the hand-off.

## SKILL.md template

```
---
name: <folder>-<job>-checks
description: Check <job> for <folder> against <owner>'s standard before it <goes where>. Use when <the job's own words: the command, the file, the moment>, or when <owner> asks whether <output> is right.
---

# <Job> checks

Made with verifier <version> on <date>. Work folder: <full path, or the project name in a chat app>; every path below is relative to it. Owner: <name> (<what they decide>), one entry per owner. Used by <who> to <decision or action>.

## Run

1. Started from another folder (or project): name the work folder this skill records and ask whether this run is that job before reading anything; on a no, stop and say this job's checks are not installed here, nothing was checked, and the verifier's Update fixes it; on a yes, use the work folder's files, never this folder's; work folder out of reach: say so and ask for its log's last line. Read the log at <place>. None reachable (a plain chat): ask for its last line; with none, run at level 1, say proof status is unknown, run the proof only if asked. No "checks proven" line: this is the proof run. "Checks proven" but no "proof passed": only the owner's question is open; ask it at step 7, plant nothing. The latest level line sets the level; none means level 1. Open exceptions lead the report. Past Next review: first ask <owner> whether anything about the job has changed.
2. Read back before any check runs: "<read-back line>", built from the inputs alone. Mark each part said (by the user) or inferred (by Claude); two sources that disagree become a question. <Monthly or rarer: read back the definitions too.> Nothing below runs until a yes; if a script builds this line, run that part alone first.
3. Human reads, before any of our values are shown: <role, items, threshold>. "Open <source>, find <item>, and type what you see."
4. Gates: <each gate, the checks it blocks, what to tell whom when it fails>. A failed gate stops every check that depends on it. A case the definitions don't cover: one question to <owner>, answer logged with the date, added to the definitions at the next Update.
5. Checks. <Scripted: run `scripts/check_<job>.py` on <inputs>.> <Listed, one line each: what is read, from where, without sight of the output, compared to what, such as "each figure in the draft against the sales report" or "one random unit's rent off the live page against the workbook".> Compare step 3's values with ours. Then the pointer check: re-open each cited location, confirm the value.
   Proof run: tell <owner> what you will break and why. Plant each check's error, never in live work: <scripted: run `scripts/test_planted.py`> <listed: on a copy of <the last finished one> marked as a test, plant each, re-read to confirm it landed, run the checks, discard the copy>. Replay <past misses>. Every plant caught: log "checks proven <date>". That line is about the checks, not the data; a run that fails on real data can still prove them.
6. Report for the level. 1: everything. 2: result line, failures, near-misses (within 10% of a tolerance), one random passed row with its source. 3: result line, failures as they happen, one random passed row with its source. Write the full proof to <place>, with the differences that passed within tolerance totaled; add this run's log line.
7. Until "proof passed" is logged: if errors were planted, show one catch in full (what changed, the check, both sides, Failed; the one closest to a past miss), the rest in one line. Then, with the real output in front of <owner>: "Is there anything here you'd have flagged that these checks didn't?" Log "proof passed <date>: <answer, short>". Each thing named becomes a check through the verifier's Update.
8. After a clean run, count the streak. At <N> clean runs covering <cycle>, tell <owner> the job is ready to step down and that the verifier does it. On <back-to-1 triggers>, log "level 1 from <date>: <trigger>" at once.

## Rules (verifier <version>)

<The verifier SKILL.md's "Rules every path follows" list and its Show-your-work report (five parts in order, with the table header), copied word for word.>
- <People only> are done by a person. Claude prepares them.
- A correction from <owner>, or a changed source, layout, definition, or owner, goes to the verifier's Update path, which changes this skill.

## The standard

Source of truth: <for each side>
As-of rule: <the date every source is pulled as of, or which version counts as latest>

Definitions (in <owner>'s words; a derived field in plain English, then its formula):
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

When building, fill every `<slot>`, and replace the Rules placeholder with the copied text itself, never a pointer: a run has no verifier to look it up in.

## Where it goes

After the owner approves the plan, write the master copy to the work folder at `skills/<folder>-<job>-checks/` (tool-neutral; it travels with the folder), install it for the tool in use, and tell the user why there, in one line. Full steps, if present: the cookbook's `make-a-skill/references/install.md`.

- **Claude Code:** copy to `~/.claude/skills/`. **Codex:** `~/.agents/skills/`.
- **Claude Cowork, claude.ai, a plain chat:** Claude can't install it (Cowork loads the account's skills, not `~/.claude/skills/`). Hand over a zip for the user to upload: Customize > Skills > + > Create skill > Upload a skill. claude.ai needs "Code execution and file creation" on (Settings > Capabilities).
- **ChatGPT:** a zip the user uploads: Plugins > Skills > Create > Upload from your computer.
- **Log and proof:** in a work folder, `checks/<job> log.md` and `checks/proof/<instance> <period>.<ext>`, under the work folder the skill records, wherever a run starts (instance: the market, store, or account, for a job run once per each; else omit). In a chat app, project files the user keeps or adds; each run hands back its log line and proof file. With the Corridor brain connector, the log can be a brain page, written on the user's yes.
- **A definition the whole team should share** (what counts as a sale): also propose it to the team brain (`company_propose`); pending until a person approves.

## Run log and open exceptions

One line per run, appended, never rewritten:

```
<run date> | <period> | level <n> | <passed> passed, <failed> failed, <not run> not run | failures: <short> | open exceptions: <n> | signed: <name, date>
```

Own lines: `checks proven <date>` (every planted error caught), `proof passed <date>: <owner's answer>` (the owner said what the checks missed, or nothing), `level 2 from <date>: <owner>'s yes after <N> clean runs`, `level 1 from <date>: <trigger>`.

Open exceptions stay in the log until closed:

```
<id> | <check> | found <date> | owner <name> | due <date> | closed <date>, check re-run and passed
```
