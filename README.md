# appldl

`appldl` is a tiny macOS CLI that searches Apple's public music catalog or reads a local Music.app playlist, then downloads matching audio through `spotdl`.

## What it does

- Search Apple's public catalog for songs, albums, and artists
- Export tracks from a local Music.app playlist
- Hand selected tracks off to `spotdl`
- Work with normal terminal prompts and simple flags

## Requirements

- macOS
- `spotdl`
- `ffmpeg`
- `python3`
- `osascript` access to Music.app for `--playlist` mode

## Install locally

```bash
pipx install spotdl
brew install ffmpeg
install -m 755 appldl ~/.local/bin/appldl
```

If `~/.local/bin` is not on your `PATH`:

```bash
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

## Homebrew

A tap-ready formula template is included at [Formula/appldl.rb](/Users/sebi/Documents/New%20project%202/Formula/appldl.rb).

After creating a GitHub release tarball, update the `url` and `sha256`, then publish it in your tap repo.

## Notes

- `--playlist` mode reads your local Music.app library, not the online Apple Music catalog.
- Public search results depend on the selected storefront.
- First playlist export may trigger a macOS permission prompt for Terminal access to Music.app.

## License

MIT
