---
name: make-a-skill
description: Use when the user wants to turn a piece of their own recurring work into a reusable skill, says "make a skill", "turn this into a skill", "I do this every month, get Claude to do it my way", or notices Claude keeps getting the same job wrong until they add their rules. Finds which part of their work is worth a skill, interviews the workflow, and writes the skill around it.
---

# make-a-skill

A skill is your judgment on a recurring job, written down, so Claude runs the job your way every time instead of guessing. The skill is the SOP. This skill helps you find which of your jobs is worth one, then builds it around how you actually work. One person might end up with a skill for reviewing a page before it ships, another with one for closing the month. This finds your version.

The steps run in order. Read `references/rules.md` before writing, and build from `references/template.md`.

## 1. Find the work worth a skill

Ask three questions, one at a time:

- What do you do most weeks that follows the same shape every time?
- Where does Claude fall short until you correct it with your own rules?
- What does your role do that nobody else does the same way?

A job that hits two of the three is worth a skill. Pick one. Done when the user names one specific recurring job, not a category. "My monthly budget close," not "finance stuff."

## 2. Interview the workflow

Get the six things a skill needs to run without the user in the room. Two to four questions per round:

- **Trigger.** The words they would say, or the moment it fires. This becomes the description.
- **Inputs.** What files or facts arrive, and from where.
- **Output.** What the finished thing looks like. Ask for one real example and keep it; the skill copies its shape.
- **Judgment that stays human.** The calls only they make. These stay theirs. The skill flags them, it does not decide them.
- **Checks.** How they know the output is right before it goes out.
- **Boundaries.** What the skill leaves alone.

Done when you can say the trigger, the inputs, the output shape, and the one human-judgment step in a sentence each.

## 3. Write the skill

Build from `references/template.md`, following the 12 rules in `references/rules.md`. Keep the main file short and push detail into `references/`. Name the folder for the job. End it with one worked example in the real output format, the way `examples/monthly-budget-close/SKILL.example.md` does. That file is named `SKILL.example.md` so it reads as a reference and never loads as a skill; a real skill's main file is `SKILL.md`.

## 4. Test it, read the transcript

Run the new skill on two prompts phrased the way the user would really say them, not the way the description reads. Read the whole transcript, not just the output. Watch where the run guessed, skipped the human-judgment step, or wandered off the format. Fix the skill at the line that let it wander. One good correction here beats three more rules.

## 5. Point to skill-creator for evals

If Anthropic's `skill-creator` is installed, tell the user it runs evals and benchmarks on a skill once the skill exists, and hand off there for that. This skill shapes a skill around one person's workflow. skill-creator measures it. Leave that job to it.

Done when the skill runs both test prompts cleanly, the human-judgment step stayed with the human, and the user could hand the folder to a teammate who would get the same result.
