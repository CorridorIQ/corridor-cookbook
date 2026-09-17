# Folder structures for knowledge work

Shape the folder like a repository, so long-running work can be planned, verified, and improved instead of held in one degrading context window. Three layouts below. Pick the one that matches the work, and rename folders to the user's own vocabulary where it helps.

## The base every layout shares

```
project/
  CLAUDE.md        # hard rules, file naming, how to validate, tone. Agents read this first.
  README.md        # what this folder is, where things live, how to make it better
  index.md         # what lives where, kept current by the indexer agent
  learnings.md     # what worked and what did not, dated, written only by learn
  improvements.md  # the inbox improve appends skill-change proposals to
  plans/           # specs and handoffs, one per dated plan
  inputs/          # source material dropped in, treated as read-only
  reference/       # the last known-good output, the format to match
  outputs/         # finished work, date-prefixed
```

Add these only when the work needs them:

- `versions/` when the work is a model or a document that iterates version over version. Each save lands here, so a good run can be recovered when a later one breaks.
- `skills/` and `agents/` when the workspace will grow its own over time, as the specific version of the work gets encoded.

Two rules hold across every layout: work in a copy, never on the live or shared file, and never delete what the user brought.

## 1. Recurring output

For work that repeats on a cadence: weekly analysis, monthly reports, quarterly reviews.

Use the base as written. Date-prefix everything in `inputs/` and `outputs/` (`2026-08_...`). When a cycle produces a better output than the reference, promote it to `reference/`. Add `versions/` if a model carries forward between cycles.

## 2. Analysis project

For a one-off or evolving investigation: a deal, a market study, a decision to make.

Keep `CLAUDE.md`, `README.md`, `index.md`, `learnings.md`, `improvements.md`, `plans/`, and `outputs/`. Swap the input folders:

```
  sources/         # gathered material, never edited
  analysis/        # working documents
```

## 3. General workspace

A standing folder for a role rather than a single project.

Keep the base files. Swap the work folders:

```
  projects/        # one subfolder per effort, each with its own README
  inbox/           # unsorted drops, triaged regularly
  outputs/
```

When `index.md` can no longer describe the folder in one screen, split by project. That split is the signal the workspace has grown up and should carry its own `skills/` and `agents/`.
