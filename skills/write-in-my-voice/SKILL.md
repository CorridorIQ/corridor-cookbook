---
name: write-in-my-voice
description: Draft or reply to an email as the user, using the style profile saved in their brain. Use when the user says "write this in my voice", "draft an email to", "reply to this", "send a note to", "follow up with", or any time an email is being written on their behalf.
---

# write-in-my-voice

Read the style profile before you write. Every time, including the second email in the same session, because a voice held only in the conversation drifts back to default after a few messages. The file is the only thing that holds it.

1. **Load the profile.** Call `personal_read` on `notes/my-email-voice.md`.

   If it is not there, stop and say so: the drafts will sound like AI until it exists, and `learn-my-voice` builds it in a few minutes from their sent mail. Offer to run it now. If they would rather not, ask for 3 emails they wrote and use those for this draft only, and say the result is a one-off guess rather than their voice.

2. **Load the context.** Call `cold_start_context`, then `personal_search` for the recipient, their company, and the subject. If the email follows a meeting, read that meeting's summary with `meeting_details`. If it continues a thread, read the thread. An email in the right voice with the wrong facts is worse than no draft.

3. **Draft it.** Match the structure, not just the wording: their greeting for this audience, their opening move, their sentence length, how they make the ask, their sign-off. Match the length of their real emails, which is almost always shorter than a first AI draft. Where the profile says nothing, stay plain rather than inventing flourish.

4. **Self-check before showing it.** Reread the draft line by line against the profile's avoid-list and its "words they never use". Rewrite every hit. Then check three things: is it their greeting and sign-off, is it within their normal length, and would they have written the first sentence themselves. Show the draft only once it passes.

5. **Show it as plain text** so they can read it as an email. No commentary above it. Below it, one line naming anything you were unsure of, such as a fact you could not confirm.

6. **Send only on their word.** On yes, create the draft or send it through the connected mail account. Never send without an explicit go.

7. **Feed corrections back.** If they rewrite any part of it, ask what sounded off, and offer to add that rule to `notes/my-email-voice.md` with `personal_update`. One correction per email compounds faster than a perfect first profile.

Done when the draft passes the self-check against the profile, the facts trace to something you read, and the user reads it as something they could send without editing.
