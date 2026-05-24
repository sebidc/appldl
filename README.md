# appldl

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Release](https://img.shields.io/github/v/release/sebidc/check-installs-tui?display_name=tag)](https://github.com/sebidc/appldl/releases)
[![Platform](https://img.shields.io/badge/platform-macOS%20Terminal-111827)](https://github.com/sebidc/appldl)
[![Homebrew Tap](https://img.shields.io/badge/homebrew-sebidc%2Ftap-fbbf24)](https://github.com/sebidc/homebrew-tap)

`appldl` is a macOS CLI that searches Apple's public music catalog or reads a local Music.app playlist, then downloads matching audio through `spotdl`.

## What it does

- Search Apple's public catalog for songs, albums, and artists
- Export tracks from a local Music.app playlist
- Hand selected tracks off to `spotdl`
- Work with normal terminal prompts and simple flags

## Requirements

- macOS
- `ffmpeg`
- `python3`
- `spotdl`
- `osascript` access to Music.app for `--playlist` mode

## Install with Homebrew

```bash
brew tap sebidc/tap
brew install appldl
```

This installs the `appldl` command. `ffmpeg` is handled by the formula.

## Install manually

If you do not want to use Homebrew:

```bash
pipx install spotdl
brew install ffmpeg
install -m 755 appldl ~/.local/bin/appldl
pipx ensurepath
source ~/.zshrc
```

## Usage

Search the public Apple catalog:

```bash
appldl "michael jackson"
appldl search "thriller" --type albums
appldl "daft punk" --type artists --storefront PH
```

Export from a local Music playlist:

```bash
appldl --playlist "Favorites"
appldl --playlist "Road Trip" --export-only
```

Change the download folder:

```bash
appldl "michael jackson" --output-dir "$HOME/Music/AppleMusic"
```

Show help:

```bash
appldl --help
```

## How it works

`appldl` does not download directly from Apple Music. It uses Apple's public search API to find catalog metadata, then passes track queries like `Artist - Title` to `spotdl`, which fetches matching audio from its configured providers.

## Homebrew repo layout

- App repo: [sebidc/appldl](https://github.com/sebidc/appldl)
- Tap repo: `sebidc/homebrew-tap`
- Formula path inside tap: `Formula/appldl.rb`

## Notes

- `--playlist` mode reads your local Music.app library, not the online Apple Music catalog.
- Public search results depend on the selected storefront.
- First playlist export may trigger a macOS permission prompt for Terminal access to Music.app.

## License

MIT
