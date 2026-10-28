---
name: map-my-workflow
description: Map one piece of recurring work as it runs today, redesign it around AI, and pick what to build first. Use when the user says "map my workflow", "map my process", "what should I automate", "as-is to-be", "how could AI help with this job", or brings a recurring task they want to stop doing by hand.
---

# map-my-workflow

Most people put AI on top of the process they already have and get the same mess, faster. This skill maps the job the way it actually runs (the **as-is**), questions every step, designs how it should run (the **to-be**), and ends with one thing to build and one first move this week.

Order is the method. The gap between what someone does and what they would ideally do is the signal, and it only shows if the as-is is on the table before anyone describes the ideal. When they jump ahead, keep the idea for step 5 and bring them back.

Read the evidence before asking. The user has already described this work in meetings, notes, and email; asking them to repeat it is the slow path. Ask only what the evidence could not answer.

## 1. Name the job

If their message names a recurring job, use it. Otherwise ask one question: what do you do most weeks that eats the most time and follows the same shape? If a personal brain is connected, offer your best two guesses from it. Narrow a category to one concrete run: "the Monday portfolio update", not "reporting". Done when the job has a name of five words or fewer and a rough frequency.

## 2. Gather the evidence

Build a case file before asking anything else. Check, in this order, and stop at about eight useful sources:

- **Their brain.** If Corridor Context is connected: `cold_start_context` once, then `personal_search` for the job's name and its key nouns (the report, the system, the counterpart).
- **Meetings.** `meeting_search` for titles and attendees tied to the job; read up to three summaries with `meeting_details`. Pull lines where they described doing the work or complained about it.
- **Email and calendar.** If a mail connector is present, find the last two or three real instances: the email that starts the job, the one that ends it. They show the true trigger, inputs, and who else touches it.
- **Files they point to.** Open a few yourself. For a large pile, send parallel `researcher` agents, one slice each, told to quote what they rely on.

Keep a pointer for every fact (meeting and date, email subject, file name). If nothing is connected, ask them to talk it through once by voice, start to finish, messy is fine. Done when you can draft every as-is step with a source or a marked gap.

## 3. Show the as-is

Draw it before you ask about it. Use `references/map-template.md`: numbered steps, each with the tool, rough time, and who else is involved, plus a total. Where the surface can render an artifact, draw it as a left-to-right diagram; otherwise use the text layout in the template. Quote their own words beside the step they came from ("you said on the Oct 12 call: ..."); people trust a map built from what they said.

Mark each gap with "?" and ask about the gaps only: at most three questions per round, each with your best guess so they can answer in a word. Done when they say the map is right, including the trigger and what "finished" looks like.

## 4. Find the cow paths

Walk the confirmed as-is with the tests in `references/redesign.md`: copy and paste, re-explaining context, waiting on someone, re-typing between systems, checking by redoing. For each step ask the hard question: if you were starting today, would this step exist? Then name the outcome one level up: the decision this work drives and who makes it. A to-be that serves that decision beats one that only speeds up the steps. Done when they have named the one or two worst steps and the decision the work feeds.

## 5. Design the to-be

Now ask how it should run. Four to six steps, each with an input, an action, and an output; inputs land in one place; the work runs before they sit down where it can. Sort every step, using the definitions in `references/redesign.md`:

- **Black and white**: a rule or a check can do it, and prove it is right.
- **Gray**: AI drafts it, they judge it.
- **Human**: only them.

Show the as-is and the to-be side by side, with the sort on each to-be step. Done when every to-be step has an input, an output, and one sort mark, and they agree it is how the work should run.

## 6. Pick what to build

Choose one container and say why in one sentence (guide in `references/redesign.md`):

- **Skill**: a repeatable how-to they trigger. Hand off to `make-a-skill`.
- **Workspace**: multi-step work with files in and out, run from a folder with its own rules. Hand off to `start`.
- **Scheduled task**: the same work, started by a clock instead of by them.

Containers combine; a scheduled task often runs a skill. Name what must tie out for them to trust it (these become checks; `verifier` builds them). Done when the container, the reason, and at least two tie-out checks are named.

## 7. Hand back the map and the first move

Write the one-pager from `references/map-template.md`, including the build prompt (`examples/morning-inbox.md` shows a finished one), and save it where they keep work: the folder they named, or `personal_write` to `notes/workflow-<job-slug>.md` in their brain.

The first move is a prototype that tests one idea, not the whole to-be. Pick the riskiest to-be step, build only that, and run it on a past period whose right answer they already know. A small prototype that works makes the case faster than a plan does.

Done when they hold the one-pager, the build prompt, and one first move they can finish this week. Work stops at the map: building is the next step they choose.
