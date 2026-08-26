# Folder structures for knowledge work

Three proven layouts. Pick the one that matches the work, and rename folders to the user's own vocabulary where it helps.

## 1. Recurring report

For work that repeats on a cadence: weekly analysis, monthly reports, quarterly reviews.

```
project/
  CLAUDE.md        # how agents work here
  README.md        # what this project is
  index.md         # what lives where
  learnings.md     # repeated friction and patterns, dated notes
  inputs/          # raw exports dropped in each cycle, date-prefixed
  reference/       # the last known-good output, the format target
  outputs/         # finished work, date-prefixed
  plans/           # specs and handoffs
```

Rules: treat `inputs/` as read-only; date-prefix everything (`2026-08_...`); when a cycle produces a better output than the reference, promote it to `reference/`.

## 2. Analysis project

For a one-off or evolving investigation: a deal, a market study, a decision to make.

```
project/
  CLAUDE.md  README.md  index.md  learnings.md
  sources/         # gathered material, never edited
  analysis/        # working documents
  outputs/         # deliverables
  plans/           # specs and handoffs
```

## 3. General workspace

A standing folder for a role rather than a single project.

```
workspace/
  CLAUDE.md  README.md  index.md  learnings.md
  projects/        # one subfolder per effort, each with its own README
  inbox/           # unsorted drops, triaged regularly
  outputs/
```

When `index.md` can no longer describe the folder in one screen, split by project.
