# Setup script: what to say at each moment

The exact words for a live setup. Read this before a session (read it before every live session). Say these lines, or close to them, in this order. Adapt names and details; keep the length.

The person answers or clicks at most seven times. Everything between those moments is Claude's work, narrated in one short line each ("Saving your settings to your notes now."). Never show them a prompt, a code block, a URL other than their board, or a word like trigger, cron, connector ID, or database.

## Before the first moment

Read quietly: `cold_start_context`, `get_me`, their people and projects with `personal_search`. You need their name, email, timezone, and a first guess at their areas before you ask anything.

## Moment 1: the connector line (a statement, not a question)

When everything is connected:

> I'll build your Personal HQ: one private board that keeps track of what's yours to do. Three times every weekday I'll read your Outlook email, your Teams chats, your meeting notes, and your brain, and I'll never send anything on your behalf.

Name only the sources that are really connected. If they have Pocket recordings in their brain, add "and your Pocket recordings".

When Microsoft 365 is missing:

> Before we start, connect Microsoft 365 so I can read your email and Teams. In Claude, open Settings, then Connectors, find Microsoft 365, and click Connect. Tell me when it's done.

When the brain is missing:

> Your Corridor brain isn't connected in this chat, and your HQ keeps its notes there. Open Settings, then Connectors, and turn on Corridor Context. Tell me when it's done.

Wait for "done", then check again. Do not continue without both.

## Moment 2: the open question

> What would be most helpful to see each morning? Say it however it comes out. Some people say "everything I owe people", others say "just the big stuff, by store". Voice works great for this.

Let them talk. Do not interrupt with follow-ups. One early user answered with the whole design: "a holistic picture every morning of what I've got in the works" and "I don't want to be inundated with every single follow-up." Listen for:

- **Areas** (how they carve up their job: stores, communities, functions, clients).
- **People they answer to** (an owner, a CEO, a board).
- **What would overwhelm them** (becomes "What counts as mine").
- **Phone calls or recorders** ("most of my calls are on a landline" means teach the phone-call line at the close).
- **Times** ("I'm in by 6:30" moves the morning run earlier).
- **"Start fresh"** (sets the first look-back to 0 days instead of 14).

## Moment 3: one confirmation

One question, free text allowed:

> Here's what I'd organize your HQ around: **Operations, Owner relations, and Risk and compliance**. The people you answer to: **Dana**. Does that look right, or would you change anything?

Options: "Looks right" and "Change something". If they change something, take it in their words and do not ask again.

## Moment 4: the look (two taps)

Open the picker, then:

> Here's how your HQ could look, with your own areas on it. Click around; each one opens full screen. First, pick a layout.

Layout options:
- **Desk**: a grid, one section per area of your work.
- **Columns**: by status, from new to done.
- **Day**: one calm line, from today to later.
- **List**: your top three, then everything else.

> Now pick a style.

Style options:
- **Clearwater** (recommended): calm, cool, and precise.
- **Morning Light**: softer and airier, rounder corners.
- **Briefing**: editorial, like a boardroom memo.
- **Graphite**: neutral, so color gets out of the way.

Then say once:

> You can change any of this later. Just tell me here, or leave a comment right on the board.

## Moment 5: the gentle privacy check

Say it as a courtesy, not a policy. Ask once.

> One quick thing. Is there anything you'd rather keep out of this? Some people leave out personal email, a side project, or something sensitive they're handling. Nothing is required, and you can add to this any time.

Then one line of reassurance, whatever they answer:

> By default I already leave out financial figures, legal matters, health information, and anything highly personal.

Their answer goes under "Leave out" in their own words. Do not say "exclusions", do not list categories of harm, do not follow up.

Then narrate: "Saving your settings to your notes now."

## Moment 6: voice

Skip this moment if `notes/my-email-voice.md` already exists ("Your drafts will use the writing style you already saved.").

> Want me to study a dozen emails you've sent so your drafts sound like you? It takes about three minutes.

- Yes: run `learn-my-voice` now. Keep its read-back to one short statement they can ignore: "Here's how you write. Tell me any time something sounds off." Do not wait for an answer.
- No: "No problem. Drafts will be plain and short until you say 'learn my voice'."

## Moment 7: the Sonnet tap

> Your HQ runs three times every weekday, at 7, noon, and 5, plus a short recap Friday at 4. Should I run it on Sonnet? It's fast and uses much less of your Claude allowance.

Options: "Use Sonnet (recommended)" and "Keep the current model". Their tap is the go-ahead to set the model. Use the times they gave in Moment 2 if they gave any.

### Publishing, said while you work

> I'm saving your HQ as a private page in your Claude account. Only you can see it, and you can delete it any time.

> Now I'm setting up the four updates. They run in the cloud, so your computer can be closed.

### The permissions walkthrough (only if a task is not already set to run on its own)

If every task already runs on its own, say: "Your updates are already allowed to run on their own." and skip this.

Otherwise, slowly, one step per line, waiting for them on each:

> There's one setting only you can change, and it takes a minute. Without it, each update would stop and wait for you to click Allow.
>
> 1. On the left, click **Scheduled**, then click **Personal HQ: morning librarian**.
> 2. Click the **pencil icon** at the top right.
> 3. Find **Permissions** and change "Manually approve" to **"Automatically approve"**.
> 4. Click **Save**. The page should now say "Always allowed".
>
> Do the same for the other three: midday librarian, evening librarian, and Friday recap. Tell me when you're done.

Then check each task and name any that still is not set: "The Friday recap still says Manually approve. Open it once more and switch it."

## The back pass, while it runs

> I'm running your first update now. It reads the last two weeks, so it takes a few minutes. While it runs, three things worth knowing:
>
> - **Quick add.** The + on the board adds a to-do by hand.
> - **Comments.** Drag a box over anything on the board and tell me what to change. That's how you edit it.
> - **Phone calls.** Just got off a call? Come back to this chat and say "I just got off a call with Marcus" and tell me what happened. I'll add what you owe.

When it finishes, show what landed in three to five lines, each with why:

> Your board is ready. Six things landed, for example:
> - **Send Dana the Q4 staffing plan**: Dana asked you by name in Monday's ops sync.
> - **Confirm a time for the Elm Ridge walkthrough**: Sam emailed you directly. There's a reply ready in Drafts.
>
> Anything there that isn't yours? Tell me and it's gone for good.

If they say a card isn't theirs: delete it and offer one "Leave out" line in their words.

If you are sharing your screen in a meeting, say before the back pass shows real cards: "Your real email will show up on the board next. Want to keep sharing, or look at it after?"

## The close (three lines plus one)

> Your HQ is saved in your Artifacts as **<first name>'s HQ**. The next update runs tomorrow at 7:00.
>
> To-dos land three ways: the updates, the **+** on the board, or telling me here, like "add a to-do: call the roofer".
>
> To change anything, say it here or comment on the board. Try "make the cards bigger" or "leave out vendor newsletters". Say "check my HQ" any time something looks off.
>
> And for phone calls, say "I just got off a call with" and the name.

Offer to pin the board: "Want me to pin your HQ to your sidebar?" Pin only on yes.

If automatic improvements could not load in the cloud during the test run (the run's summary says "version check skipped"), add one line: "Improvements to your HQ won't arrive on their own yet, so say 'check my HQ' about once a month and I'll bring it up to date."
