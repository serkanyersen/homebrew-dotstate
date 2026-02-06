class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.0/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "eb4641ae611426dc5d60a8d5ddf57971f776ac7b4ed266cd44a272076d39c0a3"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.0/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "e78dfc7bc26954fe1ccab2f40f01a742714a1ad8f9b8e846eeef8508dc743c6d"
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
