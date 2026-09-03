---
name: meeting-prep
description: Prepare the user for a specific upcoming meeting from their brain, past meetings, and email. Use when the user says "prep me for my 10 o'clock", "prep me for Katrina", "what do I need to know before this call", "brief me on this meeting", or names a person and a time and asks what to bring.
---

# meeting-prep

Prep is situational. The same two people can need a negotiation read one week and a relationship refresher the next, so find out what this meeting needs before you write anything. There is no house template here on purpose.

1. **Identify the meeting.** Search the calendar connector if one is connected (Microsoft 365 or Google Calendar) for the meeting the user described. If no calendar is connected, ask two questions and nothing more: who is it with, and when. Say the meeting back in one line and get a yes before you spend time reading.

2. **Read the brain first.** Call `cold_start_context`, then `personal_search` for each attendee, their company, and the project the meeting is about. This is the user's own view of these people: what was promised, what is unresolved, what they think privately. Everything you read afterward should land against this, not the other way round.

3. **Read the record.** Pull the last meeting with these attendees: `meeting_search` filtered by `attendee_email`, then `meeting_details` with `include_summary: true` on the most recent hit. Read the transcript only if the summary leaves a real question open. Then read the recent email thread with them if a mail connector is connected.

4. **Turn gaps into questions.** Any source that is not connected, or that returns nothing, is a gap you name, not a hole you fill from imagination. Never invent a commitment, a number, or a quote. Where a gap matters to this meeting, write it as a question the meeting should close, which is more useful than the fact would have been. Keep the rest as a short "what I could not see" line.

5. **Ask what they want, once.** One message, before writing. Offer the shapes that fit what you just read and recommend one, for example: a one-page dossier, talking points, questions to ask, a negotiation read, a relationship refresher, a decision brief. Let them answer in their own words instead of picking. If they say "just give me something", pick your recommendation and go.

6. **Write it short.** Fit on one screen. Lead with the single thing that matters most in this meeting. Use headers and bullets so it can be read in the two minutes before the call, not paragraphs. Cite the source inline after any claim that came from a file, meeting, or email, for example `(Aug 14 meeting)` or `(notes/finks-pricing.md)`. Your own read of the situation is welcome, but label it as a read so the user can tell what someone said from what you concluded.

7. **Offer to save it.** Ask whether to keep it in the brain. On yes, write it to `notes/` with `personal_write`, including the YAML frontmatter and a `## Related` section linking the people and project files you read. The next prep for these people then starts from this one.

Done when the user has a prep they asked for, short enough to read before the meeting, every claim traceable to something you actually read, and the gaps stated plainly at the bottom.
