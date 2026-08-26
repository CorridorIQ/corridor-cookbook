---
name: setup-workspace
description: Turn a folder into a working environment for knowledge work. Use when the user says "set up this folder", "set up my workspace", "organize this project", brings a handoff from another chat and wants to get started, or points Claude at a folder of files and a vision for what they want to do.
---

# setup-workspace

Turn this folder into a working environment any AI agent can walk into cold.

1. **Gather context.** If the user brought a handoff document from another chat, read it. Skim whatever files already exist in the folder.
2. **Pick a layout.** Read `references/folder-structures.md` and choose the one matching the work: recurring report, analysis project, or general workspace.
3. **Scaffold.** Create `CLAUDE.md` from `references/claude-md-template.md`, a `README.md` saying what this project is and what this folder is for, an `index.md`, a `learnings.md`, and the layout's folders. Move existing files into place. Never delete anything.
4. **Index.** Dispatch the corridor-cookbook indexer agent to catalog what lives where into `index.md`.
5. **Interview the user**, 2 to 4 questions per round: what work happens here, on what cadence, what inputs arrive and from where, what a good output looks like (ask for a reference example and put it in `reference/`), who reads the outputs. Done when you can write the README's "what happens here" section without guessing anything.
6. **Fill in** `CLAUDE.md` and `README.md` from the interview. Keep `CLAUDE.md` short; it is the file every future agent reads first, and it must stay maintained.
7. **Close with a simple visual, drawn right in the chat** as a fenced code block: the folder tree on the left, annotated with how work flows through it. Plain text diagram only; no HTML, no separate file. Shape:

   ```
   investor updates/
     CLAUDE.md          <- agents read this first
     inputs/            <- monthly exports land here
     reference/         <- the format to match
     outputs/           <- finished work
     plans/

   flow:  inputs/ + reference/  ->  Claude  ->  outputs/
   ```

The user should leave with a folder where they can open any new Claude session, in Code or Cowork, and the agent already knows the job.
