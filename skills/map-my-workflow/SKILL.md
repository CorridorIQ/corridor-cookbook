---
name: map-my-workflow
description: Map one piece of recurring work as it runs today, redesign it around AI, and pick what to build first. Use when the user says "map my workflow", "map my process", "what should I automate", "as-is to-be", "how could AI help with this job", or brings a recurring task they want to stop doing by hand.
---

# map-my-workflow

Most people put AI on top of the process they already have and get the same mess, faster. This skill maps the job the way it actually runs (the **as-is**), questions every step, designs how it should run (the **to-be**), and ends with one thing to build and one first move this week.

Order is the method. The gap between what someone does and what they would ideally do is the signal, and it only shows if the as-is is on the table before anyone describes the ideal. When they jump ahead, keep the idea for step 5 and bring them back.

Read the evidence before asking. The user has already described this work in meetings, notes, and email; asking them to repeat it is the slow path. Ask only what the evidence could not answer.

Talk to them in plain words. Three pairs of terms are worth teaching, so use them with a plain gloss the first time: the **as-is** (how it runs today), the **to-be** (how it should run), and **black and white, gray, human** (what a check can do, what AI drafts and they judge, what only they do). Every other term in this file stays inside it: in questions, say "starts when" and "done when", "what would you check before you trust it", "would you still do this step if you started from scratch".

## 1. Name the job

If their message names a recurring job, use it. Otherwise ask one question: what do you do most weeks that eats the most time and follows the same shape? If a personal brain is connected, offer your best two guesses from it. In the same message, ask where the work happens (a spreadsheet, a tracker, a shared folder, a system) unless the evidence already makes it obvious; in Cowork, ask them to give you that folder. Narrow a category to one concrete run: "the Monday portfolio update", not "reporting". If the job repeats across clients or teams, anchor on the most recent full run and use the others as cross-checks. Done when the job has a name of five words or fewer and one anchor run with a date; frequency comes from the evidence.

## 2. Gather the evidence

Build a case file before asking anything else. Check in this order, because each source narrows the next, and stop at about eight useful sources or twelve tool calls:

- **Where the work happens.** The spreadsheet, tracker, folder, or system from step 1, through a connector or the folder they gave you. It usually holds the best evidence: real inputs, real outputs, and real dates.
- **Meetings.** `meeting_search` matches titles and descriptions only, so search by the counterpart, client, or team name, not the job's name. Read up to three summaries with `meeting_details`. Note dates, attendees, and the counterpart's email domain.
- **Their brain.** If Corridor Context is connected and the host expects it, `cold_start_context` once for orientation; it holds rules, not evidence. Then `personal_search` with `path` set to `projects`, `notes`, or `decisions` for the counterpart and the job's key nouns. Search `transcripts` only when you need their exact words.
- **Email and calendar.** Filter by the counterpart's domain and a window around the meeting dates. Find the email that starts the job and the one that ends it; they show the true trigger, inputs, and who else touches it.
- **Their work folder.** If they keep past deliverables, open the ones for the anchor run. File and commit times are the best evidence of how long prep takes. For a large pile, send parallel `researcher` agents if available, one slice each, told to quote what they rely on.

Look across runs, not only the anchor. Count the runs that started and never finished, or stalled for days; they go on the map as their own line, because one clean example hides the stuck ones. Keep a pointer for every fact (meeting and date, email subject, file name). If nothing is connected, ask them to talk it through once by voice, start to finish, messy is fine. When prep files and the meeting record disagree, the meeting record is the as-is; the gap between plan and reality is a finding, so show it. Done when the trigger, the finished state, and each step's tool have a source, and no more than three things remain unknown.

## 3. Show the as-is

Draw it before you ask about it: boxes and arrows, not paragraphs. Use `references/map-template.md`: numbered steps, each with the tool, rough time, and who triggers or receives it, plus a total. In Claude chat or Cowork, draw it as an artifact, up to six steps as a left-to-right flow; past six, or in a terminal, use the text layout in the template. Quote their own words beside the step they came from, from a transcript, an email, or a file they wrote ("you said on the Oct 12 call: ..."); label lines from an AI meeting summary "the summary says". People trust a map built from what they said. Keep client figures and personal details out of quotes.

Mark each gap with "?" and ask about the gaps only: at most three questions per round, each with your best guess so they can answer in a word. Evidence shows when things happened, not what the person was doing, so a map can get a yes and still be wrong. Spend one of the three questions on the biggest step, in their words: "In step 2, what are you actually doing?" Done when they say the map is right, including where it starts, what done looks like, and what happens in the biggest step.

## 4. Question every step

Ask first: which step costs you the most? Their answer leads; a visible symptom like waiting can hide the real cost. Then walk the confirmed as-is with the tests in `references/redesign.md` to catch what they missed: copy and paste, re-explaining context, waiting on someone, re-typing between systems, checking by redoing. For each step ask: would you still do this step if you started from scratch? Then name the outcome one level up: the decision this work drives and who makes it. A to-be that serves that decision beats one that only speeds up the steps. Done when they have named the one or two worst steps and the decision the work feeds.

## 5. Design the to-be

Now ask how it should run. Four to six steps, each with an input, an action, and an output; inputs land in one place; the work runs before they sit down where it can. Show repeats as a loop, not a straight line: review, approval, and drafting work usually goes around until someone says done, and a map that flattens it into one pass skips the re-check and understates the time. Some steps must stay independent so nobody steers them, such as a test of someone else's work or an approval; mark them Human and never automate their setup. Sort every step, using the definitions in `references/redesign.md`:

- **Black and white**: a rule or a check can do it, and prove it is right.
- **Gray**: AI drafts it, they judge it.
- **Human**: only them.

Show the as-is and the to-be side by side, with the sort on each to-be step. Done when every to-be step has an input, an output, and one sort mark, and they agree it is how the work should run.

## 6. Pick what to build

First check what they already have: their installed skills, projects, scheduled tasks, and the tools from step 2. If one already does part of the job, extend it instead of building a second; three versions of the same tool is the failure here. Then choose one container and say why in one sentence (guide in `references/redesign.md`):

- **Skill**: a repeatable how-to they trigger. Hand off to `make-a-skill` if installed.
- **Workspace**: multi-step work with files in and out, run from a folder with its own rules. Hand off to `start` if installed.
- **Scheduled task**: the same work, started by a clock instead of by them.

Containers combine; a scheduled task often runs a skill. If no hand-off skill is installed, the build prompt in step 7 is the hand-off. Name what must tie out for them to trust it (these become checks; `verifier` builds them if installed). Done when the container, the reason, and at least two tie-out checks are named.

## 7. Hand back the map and the first move

Write the one-pager from `references/map-template.md`, including the build prompt (`examples/morning-inbox.md` shows a finished one), and save it where they keep work: the folder they named, or `personal_write` to `notes/workflow-<job-slug>.md` in their brain.

The first move is a prototype that tests one idea, not the whole to-be. Pick the riskiest to-be step, build only that, and run it on a past period whose right answer they already know. A small prototype that works makes the case faster than a plan does.

Done when they hold the one-pager, the build prompt, and one first move they can finish this week. Work stops at the map: building is the next step they choose.
