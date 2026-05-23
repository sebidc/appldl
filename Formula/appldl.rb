class Appldl < Formula
  desc "Search Apple's public music catalog and download matches through spotdl"
  homepage "https://github.com/sebidc/appldl"
  url "https://github.com/sebidc/appldl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc718cd5f1e11c9533659cec39c34c87f7bda804600749ec363bb050476254bb"
  license "MIT"

  depends_on :macos
  depends_on "ffmpeg"
  depends_on "python@3.14"

  def install
    bin.install "appldl"
  end

  test do
    assert_match "appldl", shell_output("#{bin}/appldl --help")
  end
end
