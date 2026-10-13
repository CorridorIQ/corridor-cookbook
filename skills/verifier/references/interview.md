# The interview

Draws out the owner's standard: the checks they run on purpose, the ones they run without noticing, and the gaps they don't know they have.
Experts know more than they can say, so every question anchors on a real piece of work, a real failure, or a moment of noticing, rather than asking for the rule directly.

## How to ask

- One question per message, one idea per question, then wait. A list of eight questions gets eight short answers.
- Facts come from the files: column names, report names, dates, entity lists, the number of stores. State what you read and let the owner correct it. Ask only for decisions and for what is in their head.
- Ask about their standard with open questions: "What do you compare it to, if anything?" A question that holds its own answer ("You tie it to the bank, right?") gets a yes whether or not anyone does it.
- Give a real fork as a forced choice: "When they disagree, which wins: NetSuite or the bank statement?"
- Read back in their words and ask "What did I get wrong?" A yes/no "Is that right?" gets a reflexive yes.
- Write every term exactly as they say it, column names included.
- Keep `references/checks.md` out of the conversation until they have described their own checks. Shown early, people pick from the menu instead of telling you what they actually do.
- Keep your turns short. Follow-ups that keep them talking: "Say more." "What did you look at next?"
- When they can't recall an instance, quote one from their own file: a value that sits apart from the rest. "In this workbook, Margot's cheapest 2-bed is $1.46 a square foot, and the others run $1.73 to $1.80. What would you do with that one?" A real number gets an answer where "the last time" gets "I don't remember".
- When they say someone else decides ("that's Jake's call"), write that person down as the owner of the answer, put the question on an open list for them, and move on.

## Order

Skip any question the files, the example, or an earlier answer already settled.

1. **Anchor.** "Do you have the last one like this that you finished? Let's use that." A past email, a closed month, a merged change, last week's list. For one-off work with no past example, use the draft in front of you.
2. **Watch them check.** "Check this one the way you normally would, and say out loud what you're looking at. I'll stay quiet." Then, for each thing they looked at: "What were you comparing that to?" Every place their eyes went is a check. If they don't have it open, or would rather not think aloud: "When you open it, which part do you go to first, and what do you look at there?" Then the same follow-up.
3. **The new hire.** "If a careful new hire did this the first time, what would you tell them to check before handing it to you?" Then: "What would they get wrong?" The first draws the checks they know; the second draws the traps.
4. **When it went wrong.** "Think of a time this went out wrong, or almost did. Walk me through it." Then: "Who caught it, and how?" Then, separately: "Has one ever gotten all the way out before anyone noticed? What would have caught it sooner?" A caught miss names a check that works; an escaped one names a gap. Every miss becomes a planted error on the proof run.
5. **Source of truth and definitions.** A forced choice on each fork between sources: "When they disagree, which wins: <the bank statement or NetSuite; the signed contract or the email thread; the spec or the ticket>?" Then, for each term the output depends on: "When you say '<term>', what counts and what doesn't?" and "Give me a borderline one." (Is a trade-in a sale? Does "confirmed" mean they said yes, or they signed? Does "done" mean merged, or live?)
6. **What has to be current.** "What here has to be the latest version, and how do you know it is?" The latest thread and attachment for an email, the right branch and environment for a code change, the right extract for numbers. For work built from data, follow with: "Which date should everything be pulled as of?"
7. **The machine.** "Has a system, a report, or an AI tool ever told you something you knew was wrong? How did you know?"
8. **Stakes**, one per message. They come before the gap probes, because a finding cites the owner's own consequence and the probes go in order of what a miss would cost.
   - "Who acts on this, and what do they do with it?"
   - "If it went out wrong, what's the worst thing that realistically happens? Who notices first?"
   - One-offs: "Once it goes out, can you take it back?" Recurring work: "Before the next one corrects it, what could someone already have done with a wrong one?"
   - "Everything here should be right. Which parts matter most to get right, the ones you'd check first if you only had five minutes?" Their answer sets which checks run first and which get a person's eyes. Every check defaults to exact; the owner loosens one only on purpose, when correcting the plan.
   - "How often has it been wrong in the last year, that you know of? Is anything new this time: a system, a report, a person?"
9. **Gap probes**, below.
10. **People only.** List the job's own steps that act on the world, taken from the walkthrough, and ask: "Of these steps, which should a person always do, never Claude?" For example: sending the workbook, pushing to the repo, adding a comp. Asked in the abstract, this question reads as unclear. If the job has no such steps of its own, offer: send, post, approve, pay, merge or deploy, move or delete. Then, only when the output leaves the team or could carry private data: "Is there anything that must never appear in it, like <examples for its shape: card numbers, another client's figures, internal pricing in something going outside>?"
11. **The ladder.** Recurring work only. "You'll approve every run to start. After how many clean runs would you want to see only the exceptions?" Tell them honestly what that number proves, per `references/trust-ladder.md`. Then: "How often should we look at these checks again?"
12. **Close.** "What should I have asked you that I didn't?"

## Gap probes: probe, then propose

Sort each check the owner has named against the claims in `references/checks.md` without showing them the list.
For each claim the output makes that nothing covers:

1. Ask about how a problem would be noticed, never about whether they are careful. One claim per message:
   - Nothing missing: "How would you know if something never made it in?" (an ask, an attachment, a row, an edge case, a person who should be copied)
   - Real: "How would you know if something in here isn't true, is already done, or got counted twice?"
   - Current: "How would you know if something in here is out of date, or two parts came from different days or versions?"
   - Right place: "How would you know if something is in the wrong place, is going to the wrong person, or is an opinion written up as a fact?"
   - Not ours: "Is there anything in here that isn't ours to share or to count?"
   - Labeled right: "Would the person reading this take it the way you mean it?"
   - When the probes come up empty: "Imagine it's three months from now, this went out wrong, and nobody caught it. What most likely happened?"
2. If they name a check, it goes in the plan. If they name a later catch ("the bank would bounce it"), ask how late that is and what it costs by then.
3. If they don't see it, hand it back as a short finding in their own words, then propose:
   "One thing your checks don't cover yet: <what>. You said <their standard>. If it slipped, you said <their consequence>. Right now nothing would catch it until <the later catch, or nobody>. I'd suggest <check>. Add it, or leave it and note that it isn't checked?"
4. The check stays marked "suggested" in the plan until they accept it. A declined one goes under "Not checked, by choice" with their reason and the date. That record is honest, and it is what an auditor would want to see.

Probe the uncovered claims in order of what a miss would cost the owner, and make at most three proposals in one sitting, so the interview stays about their work rather than an audit of them. A gap they declined is not raised again unless a related miss happens. The first real run brings the rest out (see the proof run in SKILL.md).

## When to stop

Stop when all three hold: every number or claim the output will contain has a check for each way it could be wrong; the last two gap probes turned up nothing new; the owner has said what a person always does.
Otherwise stop at about fifteen minutes, sooner on a phone, say what is still open, and let the proof run surface the rest.

## On a phone

Six questions, short lines, for people who work from their phone:

1. "Walk me through the last one."
2. "What do you look at first?"
3. "What would a new person get wrong?"
4. "When did one go wrong, and how did you find out?"
5. "How would you know if something never made it onto the list?"
6. "What do you always do yourself?"
