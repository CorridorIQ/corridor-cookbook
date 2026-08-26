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

## Skills

| Skill | What it does |
|---|---|
| `setup-workspace` | Turns a folder into a working environment: CLAUDE.md, README, index, and an interview so every future session starts already knowing the job. |
| `make-a-plan` | Interviews you until a loose idea becomes a plan you can commit to, then writes it to `plans/`. |
| `fresh-start` | Wraps the session into a short handoff so you can clear context or switch between Cowork and Code without losing anything. |
| `model-guide` | Tells you which model fits the task and how to delegate to agents without burning your usage limits. Default answer: Sonnet. |

## Agents

Two agents ship with the plugin, both pinned to Sonnet so delegated work always lands on the right model:

- **researcher** reads files and sources and returns a tight synthesis. It never edits anything.
- **indexer** catalogs what lives where in your folder and keeps `index.md` current.

## The learnings loop

Every workspace this cookbook sets up includes a `learnings.md`. When your agent notices you asking for the same thing repeatedly or hitting the same friction twice, it writes the pattern down. Those notes are the raw material for your next skill. The work teaches the cookbook.

## Try it

`examples/monthly-report-assembly/` is a hands-on exercise with fictional data: point Claude at it and ask for the August report. The interesting findings are in the numbers.

## Go deeper

The official Claude Code docs are worth your time, in this order:

1. [Common workflows](https://code.claude.com/docs/en/common-workflows). The best starting point; it even covers working in notes and non-code folders, which is exactly what this cookbook does.
2. [Best practices](https://code.claude.com/docs/en/best-practices). Why short CLAUDE.md files win, when to delegate to agents, and how to have Claude show evidence instead of asserting success.
3. [Prompt library](https://code.claude.com/docs/en/prompt-library). Ready-made prompts; the interview-to-spec and match-my-voice patterns transfer straight to knowledge work.

## Credits

`make-a-plan` is directly inspired by Matt Pocock's [grilling skill](https://github.com/mattpocock/skills). Thanks, Matt.

MIT license. Built by [Corridor Context](https://corridorcontext.com).
