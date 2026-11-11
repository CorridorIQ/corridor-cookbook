# Set up

Contents: 1. Read, walkthrough. 2. Interview: how to ask, order, gap probes, when to stop. 3. Plan. 4. Confirm. 5. Build. 6. Proof run.

Six steps, in order; one question per message throughout.
The proof is the first run after saving, in a fresh context that never saw this conversation, so it tests the skill, not this chat's memory.

## 1. Read, then the walkthrough

First read: files shared, any past example, project instructions, any existing `<folder>-<job>-checks` or `<job>-checks` skill for this folder (update it rather than start over), checks the job already runs (test suite, verify command, `verify-<app>` skill), and where the job runs with what is there: code, a browser, connectors.
Keep what you read to yourself until the owner has finished the walkthrough; differences come at item 3. Your summary first frames the job at your depth, and steps neither of you named never come up.

1. "Walk me through this job from start to finish, as if you were handing it to someone taking it over. Start from where everything comes from, and end with what happens after it leaves you."
2. "Which step is the one where mistakes usually happen?"
3. Each difference between their walkthrough and the files, one per message: "The files also show <X>. Where does that fit?", or something they mentioned that the files don't show.
4. Read the walkthrough back in their words, differences resolved: "What did I get wrong or leave out?"
5. Find the last finished one: in the folder first if you can see it, else ask. A closed period is best: its right answers are known.

Done when the owner has walked the job end to end, every difference is resolved, they have corrected the read-back, and you hold a finished example or their reason there isn't one.

## 2. Interview

Anchor every question on a real piece of work, a real failure, or a moment of noticing, never on the rule itself.

### How to ask

- One question per message, one idea per question, then wait. Short turns: "Say more." "What did you look at next?"
- Facts come from the files (column and report names, dates, entities, counts): state them; let the owner correct you. Ask only for decisions and what is in their head.
- Open questions about their standard: "What do you compare it to, if anything?" A question holding its answer ("You tie it to the bank, right?") gets a yes whether or not anyone does it.
- A real fork is a forced choice: "When they disagree, which wins: NetSuite or the bank statement?"
- Read back in their words; ask "What did I get wrong?", not "Is that right?"
- Write every term exactly as they say it, column names included.
- Keep `references/checks.md` out of the conversation until they have described their own checks, or they pick from the menu instead of telling you what they do.
- Can't recall an instance: quote a value from their file that sits apart from the rest, and ask what they would do with it.
- Someone else decides ("that's Jake's call"): write that person down as owner of the answer, put the question on an open list for them, move on.

### Order

Skip any question the files, the example, or an earlier answer settled.

1. **Anchor.** "Do you have the last one like this that you finished? Let's use that." One-off: use the draft in front of you.
2. **Watch them check.** "Check this one the way you normally would, and say out loud what you're looking at. I'll stay quiet." For each thing they looked at: "What were you comparing that to?" Every place their eyes went is a check. If they can't or would rather not: "When you open it, which part do you go to first, and what do you look at there?" Then the same follow-up.
3. **New hire.** "If a careful new hire did this the first time, what would you tell them to check before handing it to you?" Then: "What would they get wrong?"
4. **When it went wrong.** "Think of a time this went out wrong, or almost did. Walk me through it." "Who caught it, and how?" Separately: "Has one ever gotten all the way out before anyone noticed? What would have caught it sooner?" A caught miss names a check that works; an escaped one names a gap. Every miss becomes a planted error replayed on the proof run.
5. **Source of truth and definitions.** A forced choice on each fork between sources: "When they disagree, which wins: <the bank statement or NetSuite; the signed contract or the email thread; the spec or the ticket>?" For each term the output depends on: "When you say '<term>', what counts and what doesn't?" "Give me a borderline one." (Is a trade-in a sale? Does "confirmed" mean they said yes, or they signed? Does "done" mean merged, or live?)
6. **Current.** "What here has to be the latest version, and how do you know it is?" The latest thread and attachment for an email, the right branch and environment for a code change, the right extract for numbers. For data: "Which date should everything be pulled as of?"
7. **The machine.** "Has a system, a report, or an AI tool ever told you something you knew was wrong? How did you know?"
8. **Stakes**, one per message, before the gap probes:
   - "Who acts on this, and what do they do with it?"
   - "If it went out wrong, what's the worst thing that realistically happens? Who notices first?"
   - One-off: "Once it goes out, can you take it back?" Recurring: "Before the next one corrects it, what could someone already have done with a wrong one?"
   - "Everything here should be right. Which parts matter most to get right, the ones you'd check first if you only had five minutes?" Sets which checks run first and get a person's eyes, not the ceiling (`references/trust-ladder.md`). Every check stays exact by default; the owner loosens one only on purpose, when correcting the plan.
   - "How often has it been wrong in the last year, that you know of? Is anything new this time: a system, a report, a person?"
9. **Gap probes**, below.
10. **People only.** From the walkthrough, list the job's own steps that act on the world (sending the workbook, pushing to the repo, adding a comp): "Of these steps, which should a person always do, never Claude?" Asked in the abstract, this question reads as unclear. None: offer send, post, approve, pay, merge or deploy, move or delete. Only when the output leaves the team or could carry private data: "Is there anything that must never appear in it, like <card numbers, another client's figures>?"
11. **The ladder**, recurring work only. "You'll approve every run to start. After how many clean runs would you want to see only the exceptions?" Say honestly what that number proves (`references/trust-ladder.md`). "How often should we look at these checks again?"
12. **Close.** "What should I have asked you that I didn't?"

### Gap probes

Sort the owner's checks against the seven claims in `references/checks.md`, without showing the list. Each claim nothing covers, costliest miss first, one per message:

1. Ask how a problem would be noticed, never whether they are careful:
   - Nothing missing: "How would you know if something never made it in?" (an ask, an attachment, a row, a person to copy)
   - Real: "How would you know if something in here isn't true, is already done, or got counted twice?"
   - Current: "How would you know if something is out of date, or two parts came from different days or versions?"
   - Right place: "How would you know if something is in the wrong place, going to the wrong person, or an opinion written up as a fact?"
   - Ours to use: "Is there anything in here that isn't ours to share or to count?"
   - Labeled right: "Would the person reading this take it the way you mean it?"
   - All empty: "Imagine it's three months from now, this went out wrong, and nobody caught it. What most likely happened?"
2. A check they name goes in the plan. A later catch ("the bank would bounce it"): ask how late that is and what it costs by then.
3. Not seen: hand it back as a short finding in their own words, then propose: "One thing your checks don't cover yet: <what>. You said <their standard>. If it slipped, you said <their consequence>. Right now nothing would catch it until <the later catch, or nobody>. I'd suggest <check>. Add it, or leave it and note that it isn't checked?"
4. It stays "suggested" until accepted. Declined: "Not checked, by choice" with their reason and the date; not raised again unless a related miss happens.

At most three proposals in one sitting.

### When to stop

Stop when every number or claim has a check for each way it could be wrong, the last two gap probes turned up nothing new, and the owner has said what a person always does. Otherwise stop at about fifteen minutes, say what is still open, and let the proof run surface the rest.
On a phone, stop sooner; ask six, short: walk me through the last one; what do you look at first; what would a new person get wrong; when did one go wrong, and how did you find out; how would you know if something never made it onto the list; what do you always do yourself.

Done when the stop bar is met, or time ran out and the owner knows what is open.

## 3. Propose the plan

Read `references/checks.md` and `references/examples.md`; build the plan from the owner's answers, not the examples. Checks the job already runs go in first, marked existing; the rest covers what they don't.

Lay it out as the template's "The standard" (`references/job-skill.md`): definitions, the check table, People only (what a person always does), Never include (what never appears in the output), Not checked by choice, Considered and left out. Add **Gates**, **Suggested** (until accepted), and **Level**: starts at 1, with their step-down number and back-to-1 triggers.

Done when every number or claim the output will contain has a check for each way it could be wrong that the owner cares about, every past miss maps to the check that would have caught it, every uncovered claim is suggested or not checked by choice, and every automatic check can run where the job runs.

## 4. Confirm

Show the plan: "Which of these are wrong, missing, or overkill? What do you always look at that I left out?" Fix it; show it again.

Done when the owner says the plan is right, and each question handed to someone else has their answer or sits under "Open, for <name>".

## 5. Build

Follow `references/job-skill.md`: build `<folder>-<job>-checks` from the confirmed plan only, scripts and planted-error tests first, then SKILL.md.

Done when every check has a planted error, every scripted check fails its test, and the skill is installed where the job's next run loads it with its trigger line in place, or the owner has the zip and knows how to upload it.

## 6. Hand off the proof run

- **Where you can start a subagent** (Claude Code; Cowork once the zip is uploaded): give it only the job skill and the closed period's files, have it run the skill, show the user its report.
- **Otherwise** (claude.ai, ChatGPT, a plain chat), once uploaded: "Open a new chat in this project, attach <the closed period's files>, and say: <trigger words> for <period>."

On the proof run every check runs, each planted error is shown caught, and each past miss is replayed. A check that misses its planted error goes back to step 3.

Done when the proof run has reported, the owner has seen at least one planted error caught, and the log says "checks proven <date>", then "proof passed <date>" once the owner has said what the checks missed.
