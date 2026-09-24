# Repository guidance

## Project

Treatment planner is a phoenix application 

## Environment and commands

- `mise.toml` records the local toolchain. Use `mise exec --` for project commands.
- Local secrets belong in ignored `.envrc`/`.env` files. Never print, commit, or
  overwrite them. Do not assume a shell has loaded them or that direnv is installed.
- `mix setup` installs dependencies, sets up Ash/Postgres, builds assets, and seeds
  data. Inspect the environment before running setup or database-changing commands.
- Start the application with `mix phx.server` or `iex -S mix phx.server`.
- Tests use a local PostgreSQL database configured in `config/test.exs`.
- AppSignal is disabled in tests and requires no test key. Development and
  production require `APPSIGNAL_PUSH_API_KEY` at runtime, not during compilation.

## Documentation and tools

- When available, Serena tools are prioritized for symbol navigation and whole-symbol edits.
  Use targeted text search, direct reads, or native patches when simpler.
- For dependency APIs, consult available Context7. Read dependency source only when documentation leaves the question unresolved.
- Keep this file the single maintained repository instruction source. Put extended
  architecture and operational explanations in `docs/`, with links when needed.
  Avoid copying generic framework tutorials or historical session notes here.

## UI

- Follow existing layouts and components in `lib/treatment_planner_web/components/`.
  Prefer the provided input, button, and icon components.
- Preserve the existing Tailwind setup and use theme-aware styles. Verify changed
  UI in both light and dark modes, including relevant mobile widths.
- Use Gettext for new user-visible text and maintain translation files.
- Keep browser JavaScript in the asset bundle, not inline template scripts.

## Verification

- Test changed behavior at its owning boundary, including negative authorization
  cases when access rules change. Prefer domain interfaces for fixtures and tests.
- During iteration, run focused tests with `mix test path/to/test.exs`.
- Before completing application code changes, run `mix precommit`: it compiles,
  unlocks unused dependencies, formats, and runs tests. Inspect resulting edits.
- For dependency changes, run available dependency/security audits and check
  outdated packages. Verify task availability before prescribing audit commands.
- For documentation-only changes, check links/paths, factual command descriptions,
  and `git diff --check`; application tests are unnecessary.
- Fix failures caused by the change. Identify unrelated failures separately rather
  than expanding scope silently or weakening checks to obtain a passing result.
