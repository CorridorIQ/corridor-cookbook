---
name: learn-my-voice
description: Study the user's own sent emails and build a style profile of how they write. Use when the user says "learn my voice", "learn how I write", "study my writing style", when a draft does not sound like them, or when write-in-my-voice finds no style file.
---

# learn-my-voice

Run this once, then again whenever drafts stop sounding right. With a connected Individual Brain, save the approved profile to `notes/my-email-voice.md` so `write-in-my-voice` can read it before drafting.

Every rule in that file comes from a line the user actually wrote. You are describing the voice they already have, not choosing one for them.

1. **Read who they are.** Call `cold_start_context`, then `personal_list` and `personal_search` for their main people and projects. Their voice moves by audience, so you need to know which emails go to a client, a manager, or a teammate. If no personal brain connector is present, say so in one line and skip to gathering samples from mail alone.

2. **Gather samples.** From the connected mail account, pull 10 to 15 recent messages the user wrote themselves, sent items only, spread across audiences. Drop forwards, one-line scheduling replies, and pasted-in text. With no mail connected, ask them to paste 5 emails they are happy with and say who each went to. 

3. **Derive the profile.** Read every sample before writing a single rule. Work through the checklist in `references/voice-profile.md`, and for each item state what they do and quote one real line as proof. A rule you cannot back with a quote is a guess, so leave it out.

4. **Read it back.** Show the profile as one line per rule with its quote. Ask which rules are wrong, and what they do on purpose that the samples missed. Fix their corrections before saving. This is what stops a bad inference from being baked in for months.

5. **Save or hand back the profile.** With a connected Individual Brain, call `personal_write` on `notes/my-email-voice.md`: YAML frontmatter, the rules under the checklist headings, the avoid-list, the sample size and build date, and a `## Related` section linking their identity and key people files. On a re-run, read the existing file first and use `personal_update` so earlier corrections survive. Without the connector, return the approved profile in chat and say it wasn't saved.

6. **If the profile was saved, point them at `write-in-my-voice`** for drafting. Tell them to re-run this skill after any stretch where drafts felt off.

Done when they've confirmed the read-back, every rule is backed by a line they wrote, and you've saved or returned the profile.
