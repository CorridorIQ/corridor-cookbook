---
name: teach
description: Use when the user says "teach me", "what just happened", "explain what you did", "I'm lost", "show me how this works", or after a big step (a folder set up, a skill built, a plan run) when the user may not follow. Explains in plain English with a chalkboard picture that shows inline in Claude chat, Cowork, and the Codex app.
---

# teach

Explain what the AI just did, so the user understands their own setup. The teacher agent writes the lesson on Sonnet. You show it, because only the main conversation can draw inline.

## Steps

1. **Write the handoff.** The teacher cannot see this conversation. Give it:
   - What you just did, in 3 to 6 lines.
   - The files and folders you created or changed, with full paths.
   - The user's question in their own words, or "explain the last step".
2. **Dispatch the teacher agent** with the handoff. If you cannot start agents here, read `../../agents/teacher.md` from this skill's folder and follow it yourself.
3. **Show the explanation** as normal text.
4. **Show the chalkboard inline,** with the HTML unchanged:
   - **Claude chat or Cowork:** show it as a custom visual (an inline visual in your reply).
   - **Codex app:** use the built-in Visualize skill to show the HTML file inline. Save it under the home folder (`~/.codex/visualizations/...`), not the workspace, or it does not render.
   - **Anywhere else** (a terminal, another model): save it to `lessons/YYYY-MM-DD-<topic>.html` in the user's folder, open it, and say where it is.
5. **End the turn on the check question.**
