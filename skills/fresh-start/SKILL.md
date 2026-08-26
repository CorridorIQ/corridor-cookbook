---
name: fresh-start
description: Wrap up the current session into a short handoff so the user can start a clean one without losing anything. Use when the user says "fresh start", "wrap this up", "handoff", "I'm running out of context", when the conversation has grown long and slow, or when the user is moving between Claude Cowork and Claude Code.
---

# fresh-start

Your context window works like a person's working memory: it holds a lot, but past a point performance drops. A short handoff plus a clean session beats a long tired one.

1. **Write the handoff**, 15 lines maximum, in a fenced code block the user can copy: what we were working on, what got done, decisions made, open items, the exact next step, and the key file paths.
2. **Save the same text** to `plans/handoffs/YYYY-MM-DD_handoff.md`, creating the folder if needed.
3. **Mark where work left off in the user's brain.** If a personal brain or memory tool is connected to this session (for example Corridor Context), log 2-3 lines: current state, the exact next step, and the path to today's handoff file. If nothing is connected, skip this; the saved handoff file is the durable copy.
4. **Tell the user what to do**: copy the block, run `/clear` in Claude Code or open a fresh chat in Cowork, paste it, and the work continues where it left off.

Done when the handoff is on screen and saved, the brain note is logged when a brain is connected, and someone brand new could pick up the work from the block alone.
