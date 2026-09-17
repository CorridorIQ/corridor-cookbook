---
name: scaffold
description: Use right after start hands over the one-paragraph job, or when the user says "set up this folder", "scaffold my workspace", "organize this project". Turns a folder into a repository-shaped working environment. Run it before real work begins so structure is never in the way again.
---

# scaffold

Turn this folder into an advanced, seriously organized working environment any agent can walk into cold, with every piece of technical friction removed. The folder is the environment. Once it is shaped, the user stops thinking about structure and thinks about the work.

Take the one-paragraph job from start. If start did not run, ask for the job in one paragraph first, then proceed.

## Steps

1. **Read what is here.** Skim the paragraph and any files already in the folder. If the user brought a handoff from another chat, read that too.
2. **Pick a layout.** Read `references/folder-structures.md` and choose the shape that matches the work: recurring output, analysis, or general workspace. Rename folders to the user's own vocabulary where it helps.
3. **Scaffold the repository.** Create these at the folder root:
   - `CLAUDE.md` from `references/claude-md-template.md`. It holds the hard rules, file naming, how to validate a run, and the tone. Every future agent reads it first, so keep it short.
   - `README.md`: what this folder is, where things live, and how to make it better.
   - `index.md`, `learnings.md`, and `improvements.md`, the empty inbox that improve fills later.
   - Folders: `plans/`, `inputs/`, `reference/`, `outputs/`.
   - `versions/` when the work is a model or a document that iterates version over version.
   - `skills/` and `agents/` when this workspace will grow its own over time.

   Move existing files into place: source data to `inputs/`, the format target to `reference/`, prior work to `outputs/`. Never delete anything.
4. **Index it.** Dispatch the corridor-cookbook indexer agent to catalog what lives where into `index.md`.
5. **Record the project in the brain.** First `personal_search` the project name. If a project record already exists, `personal_update` its state and next step, because capture is create-only and a repeat name conflicts. Otherwise call `personal_capture`, type project, with these fields: name, summary, state, next_step, and notes. Put the folder's absolute path in notes, for example "Workspace: /Users/you/monthly-report"; there is no path field, so a path anywhere else is dropped. This gives the workspace a twin that outlives the session. If no connector is present, say so in one line and continue.
6. **Close with the tree.** Draw the folder tree in chat as a fenced text block, annotated with how work flows through it. Plain text only, no HTML, no separate file.

## The two files that carry the folder

The README is for the human and the agent both: the premise of the work, where each thing lives, how to improve the setup. Plain language.

The CLAUDE.md is the agent's operating manual: hard rules, file-naming conventions, how to check a run is right, the register to write in. Short enough that every agent actually reads it. For each line, ask whether removing it would cause a mistake. If not, cut it.

## The closing tree

Shape to follow, annotated for the specific folder:

```
monthly report/
  CLAUDE.md          <- agents read this first
  README.md          <- what this folder is
  index.md           <- what lives where
  learnings.md       <- what worked, what did not
  improvements.md    <- skill-change inbox
  inputs/            <- exports land here, read-only
  reference/         <- the format to match
  outputs/           <- finished work, date-prefixed
  plans/             <- specs and handoffs
  versions/          <- iterations of the model

flow:  inputs/ + reference/  ->  plan  ->  build  ->  outputs/
```

## Common mistakes

- Deleting or overwriting a file the user brought. Move, never delete.
- A long CLAUDE.md nobody reads. Cut every line that would not cause a mistake if removed.
- Skipping the brain record. The twin is what makes the work compound across sessions.
- Every folder for every job. Add versions/, skills/, and agents/ only when the work needs them.
