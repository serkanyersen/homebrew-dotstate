class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.1/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "acfde13b593c2b92928e9bdc581ed8a65421e2d5e20b119d1b4b03eaa161e4d2"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.1/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "58c4a901898185089bde342df0a2cabe1b93c6fa3c3e84470a56916ccadee786"
  end

  # No build dependencies needed - we're using pre-built binaries
  # Removed: depends_on "rust" => :build

  def install
    # Extract the binary from the tar.gz archive
    # The archive contains just the binary at the root
    bin.install "dotstate"
  end

  test do
    assert_match "dotstate", shell_output("#{bin}/dotstate --version")
  end
end
