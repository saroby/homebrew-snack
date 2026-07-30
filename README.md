# Snack — Homebrew tap

Homebrew tap for **Snack**, a session-scoped repo cockpit for macOS.

> Remote is the source of truth, local is a cache. Open a session and the repo clones itself;
> close the last session and the local copy goes away. Disk usage converges on what you are
> actually working on.

## Install

```bash
brew install --cask saroby/snack/snack
```

That one command adds this tap and installs the app. Homebrew asks you to approve the tap
the first time — it does not load casks from non-official taps until you do. To approve it
up front instead:

```bash
brew trust --cask saroby/snack/snack
```

Afterwards it behaves like any other cask:

```bash
brew upgrade --cask snack     # update
brew uninstall --cask snack   # remove
brew uninstall --zap --cask snack   # remove, including app data
```

## Requirements

- macOS 14 Sonoma or later
- Apple silicon or Intel

## What lives here

| Path | Purpose |
|------|---------|
| `Casks/snack.rb` | The cask. `version` + `sha256` are rewritten by the release pipeline |
| Releases | The notarized `.dmg` the cask downloads |

The application source lives in a private repository. This repo holds only the distribution
manifest and the released binaries.

## Updates

Snack does not replace itself. It checks GitHub Releases and shows a banner when a newer
version exists; the actual upgrade is `brew upgrade --cask snack`. That keeps Homebrew's
view of the installed version and the app on disk from drifting apart.

## License

The cask manifest in this repository is available under the [MIT License](LICENSE).
Snack itself is distributed under its own terms.
