---
name: meeting-prep
description: Prepare the user for one upcoming meeting from their brain, past meetings, and email. Use when the user says "prep me for my 10 o'clock", "brief me on this meeting", "what do I need to know before this call", or names a person and a time and asks what to bring.
---

# meeting-prep

Prep is situational. The same two people can need a negotiation read one week and a relationship refresher the next, so find out what this meeting needs before writing anything.

1. **Identify the meeting.** Search the connected calendar for the meeting the user described. With no calendar connected, ask who it is with and when, nothing more. Say the meeting back in one line and get a yes before spending time reading.

2. **Read the brain first.** Call `cold_start_context`, then `personal_search` for each attendee, their company, and the subject. This is the user's own view: what was promised, what is unresolved, what they think privately. Everything you read afterward lands against it.

3. **Read the record.** Call `meeting_search` filtered by `attendee_email`, then `meeting_details` with `include_summary: true` on the most recent hit. Open the transcript only if the summary leaves a real question. Then read the recent email thread if a mail connector is connected.

4. **Ask what they want, once.** One message, before writing. Recommend a shape from `references/prep-shapes.md` and let them answer in their own words. If they say "just give me something", go with your recommendation.

5. **Write it short.** One screen, headers and bullets, readable in the two minutes before the call. Lead with the single thing that matters most. Cite the source inline after any claim from a file, meeting, or email, for example `(Aug 14 meeting)`. Label your own read as a read, so the user can tell it from what someone actually said.

6. **Name the gaps.** A source that is not connected, or returns nothing, is a gap you state, never a fact you fill in. Where a gap matters, write it as a question the meeting should close. Put the rest in a "what I could not see" line at the bottom.

7. **Offer to save it.** On yes, `personal_write` it to `notes/` with YAML frontmatter and a `## Related` section linking the people and project files you read. The next prep for these people starts from this one.

Done when the prep is the shape they asked for, short enough to read before the meeting, every claim traceable to something you actually read, and the gaps stated plainly.
