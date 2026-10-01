---
name: learn-my-voice
description: Study the user's own sent emails and save a style profile of how they write into their brain. Use when the user says "learn my voice", "learn how I write", "study my writing style", when a draft does not sound like them, or when write-in-my-voice finds no style file.
---

# learn-my-voice

Run this once, then again whenever drafts stop sounding right. It writes one file to the user's brain, `notes/my-email-voice.md`, which `write-in-my-voice` and the personal HQ librarians read before every draft.

Every rule in that file comes from a line the user actually wrote. You are describing the voice they already have, not choosing one for them.

1. **Read who they are.** Call `cold_start_context`, then `personal_list` and `personal_search` for their main people and projects. Their voice moves by audience, so you need to know which emails go to a client, a manager, or a teammate. If no personal brain connector is present, say so in one line and skip to gathering samples from mail alone.

2. **Gather samples, mostly replies.** Pull 10 to 15 recent messages from Sent Items (with Outlook, `outlook_email_search` on the sent folder), spread across the audiences from step 1. At least 8 must be replies, because most drafts will be replies. Keep short replies; a two-line "got it" teaches the acknowledge move. Drop forwards, auto-replies, and pasted-in text, and cut the quoted thread under each reply so only their own words remain. With no mail connected, ask them to paste 5 emails they are happy with, at least 3 of them replies, and say who each went to. Five real emails beat any description of their style.

3. **Derive the profile.** Read every sample before writing a single rule. Work through `references/voice-profile.md`: Quick rules, the checklist, Reply moves, and the avoid-list. For each rule, state what they do and quote one real line as proof. A rule you cannot back with a quote is a guess, so leave it out.

4. **Read it back.** Show one line per rule with its quote. Ask which rules are wrong, and what they do on purpose that the samples missed. Tag each rule they correct `(you said, YYYY-MM-DD)` and set `last_correction`. This is what stops a bad inference from being baked in for months.

5. **Save it to the brain.** First run: `personal_write` on `notes/my-email-voice.md` in the file shape from the reference, Quick rules at the top, `version` set to today. Re-run: read the existing file, keep its `## Learned from edits` section and every `(you said ...)` rule exactly as written, then save with `personal_update`. Those lines are the user's own corrections, and losing them makes drafts repeat fixed mistakes.

6. **Point them at `write-in-my-voice`** for drafting from here on, and tell them to re-run this skill after any stretch where drafts felt off.

Done when the file is in their brain with Quick rules on top, at least 8 of its samples were replies, every rule is backed by a line they wrote, earlier corrections survived, and they have confirmed the read-back.
