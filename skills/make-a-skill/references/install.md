# Install a skill

The folder copy at `skills/<name>/SKILL.md` is the master. Each AI tool loads skills from its own place, so install a copy there, and install again after every edit to the folder copy. Keep the skill's folder name and its `name:` the same.

| Running in | Install |
|---|---|
| Claude Code | Copy the skill folder to `~/.claude/skills/<name>/`. It loads in the running session; if `~/.claude/skills/` did not exist when the session started, run `/reload-skills`. |
| Codex | Copy the skill folder to `~/.agents/skills/<name>/`. Restart Codex if it does not appear. |
| Claude Cowork or claude.ai | Zip the skill folder, so the zip holds `<name>/SKILL.md`, and give the user the file. Walk them through **Customize > Skills**, then **+**, **Create skill**, and **Upload a skill**. To update, delete the old skill from its **...** menu and upload the new zip. |
| ChatGPT | Zip the skill folder the same way and give the user the file. Walk them through **Plugins** in the sidebar, the **Skills** tab, **Create**, then **Upload from your computer**. |

In any other tool, ask the user where it keeps personal skills, or package the zip and have them upload it in the tool's skill settings.

Then add the skill to the Skills section of the folder's `AGENTS.md`: its name, what it does, and where it is installed.
