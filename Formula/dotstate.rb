class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.7/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "b665798a64ac4efc6c14e6ac102aa8bb92ebe268a303d462d38caee07ca7945b"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.7/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "31c424cedb8cac4233680e9c49eacc58a9cf11b01ae4204b864f6f0221549df3"
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
