class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.17/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "51f0194731078724e5e50b8196d04953860a4198e46f6f23798e6388bf9c5db1"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.17/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "334f31f7eed87b92e759a75c3d4f73ea00084c99073231cc0db859e28a45f63b"
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
