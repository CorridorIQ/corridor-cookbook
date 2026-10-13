---
name: scaffold
description: Turn a folder into a working environment any AI tool can walk into cold. Use right after start hands over the job paragraph, or when the user says "set up this folder", "scaffold my workspace", "organize this project".
---

# scaffold

The folder is the environment. Shape it once, from the job paragraph start produced, so the user thinks about the work and never about structure again. If start did not run, ask for the job in one paragraph first.

## Steps

1. **Read what is here:** the job paragraph, every file in the folder, and any handoff the user brought. Done when you can name what each existing file is for.
2. **Pick a layout** from `references/folder-structures.md`, and use the user's own words for folder names. Done when the user has seen the planned tree.
3. **Write the files** the layout lists. Fill `AGENTS.md` from `references/agents-md-template.md`, one slot at a time from the job paragraph; where the paragraph is silent, ask the user. Keep each line one that prevents a real mistake. Move the user's files into place and keep every original.
4. **Set the first run.** For recurring work, the first run is a finished past period whose answers the user already knows. Write it as the next action in `NOW.md`, and offer to run plan on it.
5. **Offer what fits**, one line each, and build only what the user accepts:
   - a short note on how this work is done well in their field, written by the researcher agent into `reference/practices.md`
   - the verifier, when the output is numbers or claims someone will act on
6. **Record the project in the brain** when a Corridor Context connector is present. Search the brain for the project first, then update it or capture a new project record with the folder's absolute path. Without a connector, say so in one line.
7. **Close with the tree** in chat, annotated with how work flows through it.

Done when a fresh session that reads only `AGENTS.md` and `NOW.md` can say what happens next.
