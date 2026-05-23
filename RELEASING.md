# Releasing `appldl`

## 1. Create the GitHub repo

- Recommended repo name: `appldl`
- Push this project to GitHub

## 2. Tag the first release

```bash
git tag v0.1.0
git push origin master --tags
```

## 3. Create a GitHub release

- Create release `v0.1.0`
- Use the source tarball URL:

```text
https://github.com/<owner>/appldl/archive/refs/tags/v0.1.0.tar.gz
```

## 4. Compute the tarball checksum

```bash
curl -L https://github.com/<owner>/appldl/archive/refs/tags/v0.1.0.tar.gz -o appldl-v0.1.0.tar.gz
shasum -a 256 appldl-v0.1.0.tar.gz
```

## 5. Publish the Homebrew formula

- Create a tap repo such as `homebrew-tools` or `homebrew-appldl`
- Copy `Formula/appldl.rb` into that repo
- Replace:
  - `REPLACE_ME/appldl` with your GitHub owner/repo
  - `sha256` with the real checksum

## 6. Install from the tap

```bash
brew tap <owner>/<tap-repo>
brew install appldl
```

## Suggested repos

- App repo: `github.com/<owner>/appldl`
- Brew tap: `github.com/<owner>/homebrew-tools`
