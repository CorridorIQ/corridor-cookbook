---
name: improve
description: Turn the workflow's promoted learnings into proposed skill edits, one per skill, in an inbox the user reviews. Run it when the user says "improve", "work the inbox", "what should I change", or on a weekly cadence. The learnings pile up on their own; this is how they turn into sharper skills.
---

# improve

improve reads the learnings the workflow earned and turns them into proposed edits, one per skill. It never touches a skill itself. You write the proposal; the user makes the call. The skill is the team's judgment written down, and only the user rewrites it.

## Steps

1. Read learnings.md at the workspace root. Use the Learnings section only. Ignore Observed once; those are candidates that have not earned a change yet.
2. Group the promoted entries by the skill or file each one touches. Several learnings often point at the same skill.
3. For each group, write one proposal: the change to make, the reason it earns its place, and the entries as evidence with their dates.
4. Append every proposal to improvements.md at the workspace root, each one dated. Create the file if it is missing. Do not edit any skill.

`references/proposal-template.md` shows the shape.

## Why an inbox, not an edit

A proposal is a suggestion with evidence. The user decides whether it is right. Batching proposals into one file means the user reviews changes together, on their own cadence, instead of one at a time in the middle of other work.

Tell the user two things when you finish: the inbox is ready, and a weekly pass through improvements.md keeps their skills sharp. A skill that never gets its inbox worked drifts out of date the same way an unread inbox does.

## Done

Done when every promoted learning is grouped and appears as a dated proposal in improvements.md, no skill file was edited, and you have told the user the inbox is ready.
