# stavarengo/homebrew-tap

Homebrew tap for [mob-tool](https://github.com/stavarengo/mob-tool) (`mobt`), a mob session management CLI.

This tap exists so macOS users in the Homebrew ecosystem can install `mobt` without layering a Python toolchain. The formula is kept current automatically: every PyPI release of `mob-tool` triggers an auto-bump PR against this repo via [`dawidd6/action-homebrew-bump-formula`](https://github.com/dawidd6/action-homebrew-bump-formula), refreshing the `url`, `sha256`, and every `resource` block.

## Install

```shell
brew tap stavarengo/tap
brew install stavarengo/tap/mobt
```

Or, equivalently, the single-line form that implicitly taps:

```shell
brew install stavarengo/tap/mobt
```

Both commands install two CLI aliases — `mobt` (short form) and `mob-tool` — pointing at the same entry point. Verify with `mobt --help` or `mob-tool --help`.

## Maintenance

Auto-bump PRs are opened by a workflow in [`stavarengo/mob-tool`](https://github.com/stavarengo/mob-tool) that authenticates to this repo using a Personal Access Token stored as a repo secret.

- **Secret name:** `HOMEBREW_TAP_TOKEN` (stored in `stavarengo/mob-tool` → Settings → Secrets and variables → Actions).
- **Required scopes:**
  - **Fine-grained PAT (preferred):** `contents:write` + `pull_requests:write` on `stavarengo/homebrew-tap`.
  - **Classic PAT (fallback):** `public_repo` + `workflow`.
- **Rotation cadence:** 1-year expiry. Set a calendar reminder 30 days before expiry to generate a replacement token and update the secret. If the token lapses, the auto-bump PR simply stops opening — there is no user-visible error until the next PyPI release is published without a corresponding tap PR appearing.

## What lives here

- `Formula/mobt.rb` — the `mobt` formula (added in a follow-up story; not present at bootstrap time).
- `Formula/` — the tap's formula directory. Homebrew discovers formulae from this path.
- `LICENSE` — MIT, matching the upstream `mob-tool` project.
- `.github/workflows/ci.yml` — tap-side CI that audits and build-from-source installs the formula on macOS and Linux for every PR, push to `main`, and weekly (added in a follow-up story).
