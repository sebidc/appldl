# Releasing `appldl`

## 1. Push the app repo

App repo:

```text
https://github.com/sebidc/appldl
```

Push your code and make sure the default branch is `main`.

## 2. Tag the release

```bash
git tag v0.1.0
git push origin v0.1.0
```

## 3. Create the GitHub release

```bash
gh release create v0.1.0 --title "v0.1.0" --notes "First release of appldl"
```

Release source tarball URL:

```text
https://github.com/sebidc/appldl/archive/refs/tags/v0.1.0.tar.gz
```

## 4. Compute the tarball checksum

```bash
curl -L https://github.com/sebidc/appldl/archive/refs/tags/v0.1.0.tar.gz -o appldl-v0.1.0.tar.gz
shasum -a 256 appldl-v0.1.0.tar.gz
```

Copy the first field from the `shasum` output and place it in `Formula/appldl.rb` as the `sha256` value.

## 5. Publish the Homebrew formula

Tap repo:

```text
https://github.com/sebidc/homebrew-tools
```

Homebrew tap name:

```text
sebidc/tools
```

Place the formula at:

```text
Formula/appldl.rb
```

Then commit and push it to the tap repo.

## 6. Install from the tap

```bash
brew tap sebidc/tools
brew install appldl
```
