# SKILL.md template

Copy the block below into `skills/<your-skill-name>/SKILL.md` in the work folder and fill each part. That copy is the master; install it with `install.md`. Delete the bracketed guidance as you go. Keep the whole file under 120 lines; anything longer moves to `references/`.

```
---
name: <your-skill-name>
description: <One trigger condition, a little pushy. When should this fire, and in the words the user would actually say? Not a summary.>
---

# <your-skill-name>

<One or two sentences: what this job is and when it runs. Lead with the answer.>

## Steps

1. <First action, in order. End each step on a check the agent can see: done when X.>
2. <...>

## Judgment that stays human

<The calls only the user makes. The skill flags these and stops; it does not decide them.>

## Checks before done

<How the user knows the output is right before it goes out. Numbers where there are numbers.>

## Worked example

<One finished output in the real format, or a pointer to examples/<job>/. Show the shape, do not describe it.>

## Known traps and their fixes

- <A real way this job goes wrong, and the fix.>
```

## Where the folders go

- `references/` holds anything read only sometimes: long rules, a format spec, a checklist, a stable config the skill looks up. The main file names them so Claude loads them when the step needs them.
- `examples/` holds one complete run: a sample input and the finished output it should produce. This is the worked example rule 8 asks for.
- `assets/` holds files the skill copies out, like a template document or a starter spreadsheet.

Keep the main file to the steps and the judgment. Everything a reader consults rather than follows goes in `references/`.
