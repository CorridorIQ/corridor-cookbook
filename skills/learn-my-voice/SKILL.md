---
name: learn-my-voice
description: Study the user's own sent emails and save a style profile of how they write into their brain. Use when the user says "learn my voice", "learn how I write", "study my writing style", when a draft does not sound like them, or when write-in-my-voice finds no style file.
---

# learn-my-voice

Run this once, then again whenever drafts stop sounding right. It produces one file in the user's brain, `notes/my-email-voice.md`, that every future email draft reads first.

Every rule in that file comes from something the user actually wrote. You are not choosing a tone for them, you are describing the one they already have.

1. **Read who they are.** Call `cold_start_context`, then `personal_list` and `personal_search` for their main people and projects. You need to know which of their emails go to a client, a boss, or a teammate, because their voice is not the same in all three.

2. **Gather samples.** From a connected mail account (Microsoft 365 or Gmail), pull 10 to 15 recent messages the user wrote themselves. Sent items only. Drop forwards, one-line scheduling replies, and anything they did not write, such as pasted-in text. Spread the sample across audiences: some to clients, some internal, some to a manager or a peer. If no mail account is connected, ask them to paste 5 emails they are happy with and say who each one went to. Five real emails beat any description of a tone, so do not ask them what their style is.

3. **Derive the profile from the samples.** Read all of them before writing a single rule. Then, for each item below, state what they actually do and quote one real line as proof:

   - How they greet, per audience, and when they skip the greeting
   - How they sign off, and whether the sign-off changes with the recipient
   - Typical sentence length and paragraph length, in real numbers
   - Formality, and where it moves
   - How they open: the ask in line one, or context first
   - Words and phrases they reach for repeatedly
   - Words they never use
   - Punctuation and formatting habits: bullets or prose, dashes, exclamation points, capitalization
   - How they ask for something, and how they close

   A rule you cannot back with a quote is a guess. Leave it out.

4. **Build the avoid-list from the gap.** List the phrases AI reaches for by default that do not appear anywhere in their samples. Common ones: "I hope this email finds you well", "I wanted to reach out", "just circling back", "please don't hesitate", "let me know if you have any questions", em dashes. Keep only the ones genuinely absent from their writing, and add anything specific to them, for example a greeting they never use.

5. **Read it back and get corrections.** Show the profile as a short list, one line per rule with its quote. Ask which ones are wrong, and whether there is anything they do on purpose that the samples missed. Fix what they correct before saving. This step is what stops a bad inference from being baked in for months.

6. **Save it to the brain.** Write `notes/my-email-voice.md` with `personal_write`: YAML frontmatter, the rules grouped by the headings above, the avoid-list under its own heading, the sample size and date it was built, and a `## Related` section linking their identity and key people files. On a re-run, read the existing file first and use `personal_update` to change only the rules that moved, so earlier corrections survive.

7. **Point them at the next skill.** Tell them to use `write-in-my-voice` from here on, and to re-run this skill after any stretch where drafts felt off.

Done when the file exists in their brain, every rule in it is backed by a line they wrote, and they have confirmed the read-back.
