---
name: drivers-seat
description: Stay in the driver's seat before building or analyzing anything sizable. Pins down the outcome, surfaces unknowns through questions and visuals, and ends in a one-page HTML spec. Use when someone says "driver's seat", "help me think this through", "what should we build", "write a spec", or brings an idea, a request, or a pile of data that is not yet clear.
---

# Driver's seat

The person owns the intent; you help them find it.
Every gap in a request is a guess you would make for them, and a polished guess is hard to question.

## In every step

- **One question at a time**, highest impact first, through the host's question tool if it has one. After step 2, give short options and say in one line which you would pick and why, so they can disagree.
- **Show it.** When they would recognize the answer but cannot describe it, show a rough visual: inline or an artifact where the host renders one, otherwise one HTML file with fake data.
- **Short, plain words.** A line or a picture beats a paragraph.
- **Read first.** Look up what you can in connected notes, meetings and files. If nothing is connected, say so in one line.
- **Watch the clock.** Ask only what would change the outcome, and list the rest as defaults. In a live room, name one person to answer for the group and run steps 1, 2, 3 and the spec.

## Steps

1. **Outcome.** Ask what should be true when this is done, and for whom. Get who, what, when and why in their words, and what they have already tried. Record any solution they bring as part of their step 2 guess and ask what it would achieve. If they are vague, ask about the last time this came up: who asked, what they needed, what happened. If two stories leave it unclear, name who could answer and stop; that is a real finding. Done when they agree with your one-sentence outcome.

2. **Best guess.** Before you offer anything, ask what they expect the result to look like. A bad guess is fine. Record it verbatim as the test for the output. Start the spec page now. Done when both exist.

3. **Blind spot pass.** Look for unknown knowns (too obvious to mention) and unknown unknowns (not yet considered). Name the three to five they have not raised that would most change the outcome, in plain words, and have them rule each in or out in one reply. Done when they have.

4. **Interview and show.** Work the remaining ambiguities. Make one HTML page with three or four directions that differ in what the thing is, and have them pick one. Ask for an existing page, sheet or report they like. Ask what would have to be true for this to be wrong, and how to find out. Done when no open question would change the outcome and every silent decision is answered or listed as a default.

5. **Spec.** Keep one HTML page on screen and add to it after every step, so they watch it fill. It holds intent, not implementation:
   - Outcome: who, what, when, why
   - Their best guess beside where you landed
   - Decisions and defaults with reasons, most likely to change first
   - Out of scope
   - Done means: something to point to, such as a number, a screenshot or a test
   - What would prove this wrong
   - The smallest prototype that tests the riskiest idea

6. **Teach back.** Have them say the main point in their own words without reading the spec, and fix what does not match. Done when one named person would sign it, or the spec names who must see it first.

If any step shows this should not be built, say so plainly. No is a result.

## Sources

- Addy Osmani, [Critical thinking when agents do the work](https://x.com/addyosmani/article/2117512471930167377)
- Addy Osmani, [Intent debt](https://addyosmani.com/blog/intent-debt/)
- Thariq Shihipar, [Finding your unknowns](https://claude.com/resources/articles/a-field-guide-to-claude-fable-finding-your-unknowns)
