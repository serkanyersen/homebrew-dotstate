class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.1.14/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "273300bec78e5b192790e0b0f57a0cb43a7eae5eaa8433883238a8bdc19be3a9"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.1.14/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "e6298414c93e23653b6452b2c1b476a6a279ea4fee14af683b71937f372e9a8a"
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
