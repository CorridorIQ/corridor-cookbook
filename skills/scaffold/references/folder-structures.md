# Folder structures for knowledge work

Shape the folder like a repository, so long-running work can be planned, verified, and improved instead of held in one degrading context window. Three layouts below. Pick the one that matches the work, and rename folders to the user's own vocabulary where it helps.

## The base every layout shares

```
project/
  AGENTS.md        # what needs the user's yes, which source wins, how a run works. Read first.
  CLAUDE.md        # one line: @AGENTS.md, so every AI tool reads the same rules
  NOW.md           # where the work stands and the one next action
  README.md        # what this folder is, where things live, how to make it better
  sources.md       # every source, plus a data dictionary for each table-shaped one
  rules/           # the user's decisions as small CSVs: which source wins, name maps
  learnings.md     # only lessons that changed a file or rule, written by learn
  improvements.md  # the inbox improve appends skill-change proposals to
  inbox/           # drop anything here
  inputs/          # filed evidence by period, never edited
  reference/       # the last known-good output, and practices.md if the user wanted one
  outputs/         # finished work, by period
  plans/           # specs and handoffs, one per dated plan
```

Add these only when the work needs them:

- `versions/` when the work is a model or a document that iterates version over version. Each save lands here, so a good run can be recovered when a later one breaks.
- `.claude/skills/` and `.claude/agents/` when a step has repeated and earns its own skill. Add a skill after the second repeat.
- `index.md` when the README table no longer fits one screen. The indexer agent writes it.

Work flows `inbox/ -> inputs/<period>/ -> plan -> run-plan -> outputs/<period>/`.


## 1. Recurring output

For work that repeats on a cadence: weekly analysis, monthly reports, quarterly reviews.

Use the base as written. File by period (`inputs/2026-09/`, `outputs/2026-W42/`). When a cycle produces a better output than the reference, promote it to `reference/`. Add `versions/` if a model carries forward between cycles.

## 2. Analysis project

For a one-off or evolving investigation: a deal, a market study, a decision to make.

Keep the base. Add one folder:

```
  analysis/        # working documents
```

## 3. General workspace

A standing folder for a role rather than a single project.

Keep the base files. Add:

```
  projects/        # one subfolder per effort, each with its own README
```

Split into `projects/` when the README table no longer fits one screen.
