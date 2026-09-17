# Corridor Cookbook

![Documents flowing through a gate and coming out as organized streams](assets/cover.jpg)

Skills & Agents to bring frontier intelligence into all areas of knowledge work. Provided and maintained by Corridor Context. 

AI model capability is already strong, what's missing is getting them into the hands of people doing real work. The analyst who owns the monthly report, the asset manager chasing comps, anyone staring down five Excel files and a deadline. Corridor Context helps companies become AI-native.

Our belief is as models keep getting better, your edge is the **context** you capture and how you put **agents to work**. 

This cookbook is the "SOP" layer of that work. Each skill is a recipe: a repeatable process you invoke by name, distilled from deployment sessions with real teams. No code required. Everything here works in Claude Code and Claude Cowork. 

## Install

```
/plugin marketplace add CorridorIQ/corridor-cookbook
/plugin install corridor-cookbook
```

## The chain

Seven skills that run in order, from a vague idea to a finished output that improves the next run. Start with `start` and follow where it leads, or call any one on its own.

| Skill | What it does |
|---|---|
| `start` | Brainstorms the idea, then grills the shape of the work until the job fits in one paragraph. Writes nothing; hands the paragraph to scaffold. |
| `scaffold` | Turns a folder into a working environment: CLAUDE.md, README, index, and folders for plans, inputs, outputs, and reference. Captures a project record in your brain and draws the folder tree. |
| `plan` | Turns the start answers into a one-page plan in `plans/`, plain English, six fields of front matter. Stops for your approval before anything runs. |
| `build` | Runs the approved plan. Independent steps go to Sonnet agents in parallel, harder ones to Opus. Outputs land in `outputs/` with the date. Ends by running learn. |
| `learn` | Writes a rule only when it can name one that changes the next run, and the evidence for it. Promotes on a second sighting, and mirrors promoted rules to your brain. |
| `improve` | Reads the learnings, groups them by the skill they touch, and writes one proposal per skill into an `improvements.md` inbox. Never edits a skill itself. |
| `make-a-skill` | Helps you find which parts of your own work deserve a skill, then shapes that skill around your workflow and tests it on the way you would actually ask for it. |

## Also in the box

Five standalone skills that do not change:

| Skill | What it does |
|---|---|
| `fresh-start` | Wraps the session into a short handoff so you can clear context or switch between Cowork and Code without losing anything. |
| `model-guide` | Tells you which model fits the task and how to delegate to agents without burning your usage limits. Default answer: Sonnet. |
| `meeting-prep` | Preps you for one meeting from your brain, the last meeting, and the email thread. Asks what kind of prep you want before writing it. |
| `learn-my-voice` | Reads emails you actually sent and saves a style profile of how you write into your brain. Run it once, then re-run when drafts stop sounding right. |
| `write-in-my-voice` | Drafts and replies to email in that voice, checking every draft against the profile before showing it. Never sends without your go. |

`setup-workspace` and `make-a-plan` are gone. `scaffold` and `plan` replace them.

## Agents

Three agents ship with the plugin, all pinned to Sonnet so delegated work always lands on the right model:

- **researcher** reads files and sources and returns a tight synthesis. It never edits anything.
- **designer** drafts and shapes a build step's output in the real format it needs to land in.
- **indexer** catalogs what lives where in your folder and keeps `index.md` current.

## The learnings loop

Every workspace this cookbook sets up includes a `learnings.md`. The `learn` skill writes a rule there only when it can name one that changes the next run. The `improve` skill turns those rules into proposals for your skills. Those notes are the raw material for your next skill. The work teaches the cookbook.

## Try it

`examples/monthly-report-assembly/` is a hands-on exercise with fictional data: point Claude at it and ask for the August report. The interesting findings are in the numbers.

## Go deeper

The official Claude Code docs are worth your time, in this order:

1. [Common workflows](https://code.claude.com/docs/en/common-workflows). The best starting point; it even covers working in notes and non-code folders, which is exactly what this cookbook does.
2. [Best practices](https://code.claude.com/docs/en/best-practices). Why short CLAUDE.md files win, when to delegate to agents, and how to have Claude show evidence instead of asserting success.
3. [Prompt library](https://code.claude.com/docs/en/prompt-library). Ready-made prompts; the interview-to-spec and match-my-voice patterns transfer straight to knowledge work.

## Credits

The grilling in `start` is directly inspired by Matt Pocock's [grilling skill](https://github.com/mattpocock/skills). Thanks, Matt.

MIT license. Built by [Corridor Context](https://corridorcontext.com).
