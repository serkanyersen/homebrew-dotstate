class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.19/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "3dacfa1f8d3f2a4862ebe59357f7000b2ec8083b1fce6ea3c5f80d24f9f23473"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.19/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "54582bf7b7c4b2667e5bca8256029d6039cd89c891dcf2bb63947dc25dd61019"
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
