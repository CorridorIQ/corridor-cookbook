---
name: learn
description: Name the one rule that would change the next run, with the evidence for it. Runs at the end of every run-plan, and when the user says "what did we learn", "remember that", or corrects your output. Run it at the close of each build without being asked; a workflow that never records what it learned keeps repeating the same misses.
---

# learn

A skill gets better only when the workflow writes down what it learned. This is where the work teaches the cookbook. A learning is a rule for the next run, not a diary of this one.

Ask yourself one question: what rule would change the next run, and what is the evidence for it? If you cannot name both, there is nothing to learn. Say so and write nothing. Silence is the correct output most of the time.

## When to run

At the end of run-plan, every time. Also when the user says "what did we learn", "remember that", or corrects your output. A correction is the highest-signal moment you get, so treat every edit the user makes as a question: what rule sits behind this change?

## The two sections in learnings.md

learnings.md lives at the workspace root. It has two sections. `references/learnings-template.md` shows the exact shape.

- **Observed once.** A candidate. One rule you have evidence for a single time. Each entry carries the date, the time, and the concrete evidence.
- **Learnings.** Promoted rules. The judgment the workflow now runs by.

A candidate moves from Observed once to Learnings when one of two things happens:

1. You see the same rule a second time. Two sightings means a pattern, not an accident.
2. The user states it as a rule. A person saying "always do X" outweighs your own observations, so it goes straight to Learnings on the first hearing.

Every entry in either section carries the date and a timestamp. That is how you tell a first sighting from a second one later.

## What counts, and what does not

Write the general rule, never the one-off. When the user fixes your report ordering, the learning is "lead the callouts with the largest change," not "move Thistledown up." Understand why the correction was made, not just that it was made.

A learning must be able to change a future run, and its evidence must be concrete: a number, a file, a correction you can point to. Skip chatter, test logs, and facts that will never recur. When in doubt whether something is a rule or a detail, it is a detail.

## Mirror promoted rules to the personal brain

When a candidate is promoted, mirror it so it outlives this session and this machine.

- **First promotion in this project:** create `notes/<project-slug>-learnings.md` with `personal_write`. Front matter follows that tool's conventions. Add a Related section that links the project record scaffold captured with `personal_capture`, type project.
- **Every promotion after:** append with `personal_update`. Read the file, take its last line, and replace that last line with itself plus the new learning. One connector call per promotion, not a sync engine.

If no personal brain connector is present, say so in one line and continue. learnings.md at the workspace root is the durable copy.

## Done

Done when either you wrote at least one dated, evidenced entry, or you told the user there was nothing to learn and wrote nothing. Promoted rules are mirrored to the brain when a connector is present.
