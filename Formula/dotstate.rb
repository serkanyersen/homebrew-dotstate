class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.1.10/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "5810c1dfd218b38c43fd7f3c2128c18990d736bc1cbd8bd06adb3983a5e62906"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.1.10/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "ae4da986880ea6b013800a601c626f361f4f0bb144fc8b139f6530f96d02e72f"
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
