# Set up

Turns how the owner judges a job into a skill for that job. Six steps, in order, one question per message throughout.
The proof happens on the first run after saving, in a fresh chat, so it tests the job skill rather than this conversation's memory.

## 1. Read, then let the owner walk you through it

Before asking anything, read what exists: the files the user shared, any past example, the project instructions, any existing `<job>-checks` skill (if one exists, this setup updates it rather than starting over), any checks the job already runs, such as a test suite, a verify command, or a `verify-<app>` skill, and where the job runs (Claude.ai, Claude Cowork, Claude Code on a laptop or in the cloud) with what is available there: code, a browser, connectors.
Keep what you read to yourself for now. A summary from you first frames the job at the depth you understood it; the owner corrects only that layer, and the steps neither of you named never come up.

1. "Walk me through this job from start to finish, as if you were handing it to someone taking it over. Start from where everything comes from, and end with what happens after it leaves you."
2. "Which step is the one where mistakes usually happen?"
3. Name the differences between their walkthrough and what you read, one per message: something the files show that they didn't mention ("The files also show <X>. Where does that fit?"), or something they mentioned that the files don't show.
4. Read the walkthrough back in their words, with the differences resolved, and ask: "What did I get wrong or leave out?"
5. Find the last finished one: in Claude Cowork or Claude Code, look in the folder first; otherwise ask for it. A period already closed is best, because its right answers are known.

Done when the owner has walked the job end to end, from where its inputs come from to what happens after it leaves them; every difference with the files is resolved; they have corrected the read-back; and you hold a finished example or their reason there isn't one.

## 2. Interview

Read `references/interview.md` and follow it.

Done when its stop bar is met, or the time box ran out and you have told the owner what is still open.

## 3. Propose the plan

Read `references/checks.md` and `references/examples.md`, then build the plan from the owner's answers. Checks the job already runs go in first, marked existing; the rest of the plan covers what they don't.

| Check | Covers | Compares (direction) | Tolerance | Catches | Planted error | Who, when |
|---|---|---|---|---|---|---|

Under the table:

- **Definitions**, in the owner's words, with any derived field in plain English beside its formula.
- **Gates.**
- **People only:** what a person always does. **Never include:** what never appears in the output.
- **Suggested:** checks you proposed for gaps the owner did not see, marked until they accept.
- **Not checked, by choice:** gaps they declined, with their reason and the date.
- **Considered and left out:** checks you weighed and dropped, one line each, so they can pull one back in.
- **Level:** starts at 1. Their step-down number and their back-to-1 triggers, per `references/trust-ladder.md`.

Done when every number or claim the output will contain has a check for each way it could be wrong that the owner cares about, every past miss maps to the check that would have caught it, every uncovered claim is either suggested or not checked by choice, and every automatic check can run where the job runs.

## 4. Confirm

Show the plan and ask: "Which of these are wrong, missing, or overkill? What do you always look at that I left out?"
Fix it and show it again.

Done when the owner says the plan is right, and each question the owner handed to someone else has that person's answer or goes into the job skill under "Open, for <name>".

## 5. Build the job skill

Read `references/job-skill.md` and build `<job>-checks` from the confirmed plan: any scripts and their planted-error tests first, then the SKILL.md. Run the tests; a check that passes its broken copy is rewritten or cut. Put it where that file says for this environment, and tell the user why there, in one line.

Done when every check has a planted error, every scripted check fails its test, the skill sits where the job's next run loads it with its trigger line in place, or the owner has the file and knows to click Save skill.

## 6. Hand off the proof run

The first run proves the job skill on its own, in a context that has never seen this conversation.

- **Claude.ai:** after the user clicks Save skill, tell them: "Open a new chat in this project, attach <the closed period's files>, and say: <the skill's trigger words> for <period>." The job skill finds no "checks proven" line in the log and runs the proof.
- **Claude Cowork or Claude Code:** start a subagent with only the job skill and the closed period's files, and tell it to run the skill. Show the user its report.
- **Plain chat:** the same as Claude.ai.

On the proof run, every check runs, each planted error is shown caught, each past miss is replayed, and any check that fails to catch its planted error goes back to step 3 here.

Done when the proof run has reported, the owner has seen at least one planted error caught, and the log says "checks proven <date>", then "proof passed <date>" once the owner has answered what the checks missed.
