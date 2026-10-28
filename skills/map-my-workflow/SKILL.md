---
name: map-my-workflow
description: Map one piece of recurring work as it runs today, redesign it around AI, and pick what to build first. Use when the user says "map my workflow", "map my process", "what should I automate", "as-is to-be", "how could AI help with this job", or brings a recurring task they want to stop doing by hand.
---

# map-my-workflow

Most people put AI on top of the process they already have and get the same mess, faster. This skill maps the job the way it actually runs (the **as-is**), questions every step, designs how it should run (the **to-be**), and ends with one thing to build and one first move this week.

Order is the method. The gap between what someone does and what they would ideally do is the signal, and it only shows if the as-is is on the table before anyone describes the ideal. When they jump ahead, keep the idea for step 5 and bring them back.

Read the evidence before asking. The user has already described this work in meetings, notes, and email; asking them to repeat it is the slow path. Ask only what the evidence could not answer.

## 1. Name the job

If their message names a recurring job, use it. Otherwise ask one question: what do you do most weeks that eats the most time and follows the same shape? If a personal brain is connected, offer your best two guesses from it. Narrow a category to one concrete run: "the Monday portfolio update", not "reporting". If the job repeats across clients or teams, anchor on the most recent full run and use the others as cross-checks. Done when the job has a name of five words or fewer and one anchor run with a date; frequency comes from the evidence.

## 2. Gather the evidence

Build a case file before asking anything else. Check in this order, because each source narrows the next, and stop at about eight useful sources or twelve tool calls:

- **Meetings first.** `meeting_search` matches titles and descriptions only, so search by the counterpart, client, or team name, not the job's name. Read up to three summaries with `meeting_details`. Note dates, attendees, and the counterpart's email domain.
- **Their brain.** If Corridor Context is connected and the host expects it, `cold_start_context` once for orientation; it holds rules, not evidence. Then `personal_search` with `path` set to `projects`, `notes`, or `decisions` for the counterpart and the job's key nouns. Search `transcripts` only when you need their exact words.
- **Email and calendar.** Filter by the counterpart's domain and a window around the meeting dates. Find the email that starts the job and the one that ends it; they show the true trigger, inputs, and who else touches it.
- **Their work folder.** If they keep past deliverables, open the ones for the anchor run. File and commit times are the best evidence of how long prep takes. For a large pile, send parallel `researcher` agents if available, one slice each, told to quote what they rely on.

Keep a pointer for every fact (meeting and date, email subject, file name). If nothing is connected, ask them to talk it through once by voice, start to finish, messy is fine. When prep files and the meeting record disagree, the meeting record is the as-is; the gap between plan and reality is a finding, so show it. Done when the trigger, the finished state, and each step's tool have a source, and no more than three things remain unknown.

## 3. Show the as-is

Draw it before you ask about it: boxes and arrows, not paragraphs. Use `references/map-template.md`: numbered steps, each with the tool, rough time, and who triggers or receives it, plus a total. Where the surface can render an artifact, draw up to six steps as a left-to-right flow; past six, use the text layout in the template. Quote their own words beside the step they came from, from a transcript, an email, or a file they wrote ("you said on the Oct 12 call: ..."); label lines from an AI meeting summary "the summary says". People trust a map built from what they said. Keep client figures and personal details out of quotes.

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

- **Skill**: a repeatable how-to they trigger. Hand off to `make-a-skill` if installed.
- **Workspace**: multi-step work with files in and out, run from a folder with its own rules. Hand off to `start` if installed.
- **Scheduled task**: the same work, started by a clock instead of by them.

Containers combine; a scheduled task often runs a skill. If no hand-off skill is installed, the build prompt in step 7 is the hand-off. Name what must tie out for them to trust it (these become checks; `verifier` builds them if installed). Done when the container, the reason, and at least two tie-out checks are named.

## 7. Hand back the map and the first move

Write the one-pager from `references/map-template.md`, including the build prompt (`examples/morning-inbox.md` shows a finished one), and save it where they keep work: the folder they named, or `personal_write` to `notes/workflow-<job-slug>.md` in their brain.

The first move is a prototype that tests one idea, not the whole to-be. Pick the riskiest to-be step, build only that, and run it on a past period whose right answer they already know. A small prototype that works makes the case faster than a plan does.

Done when they hold the one-pager, the build prompt, and one first move they can finish this week. Work stops at the map: building is the next step they choose.
