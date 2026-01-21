class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.14/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "fbf9d2a076591b6f653ddb2eea40305d08bdab92dd0b05fb2535da2206085530"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.14/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "35984dc841e65a9a359df7eeaede12a11f8a6181210cc4d6c5c6dcfcc7320bcc"
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
