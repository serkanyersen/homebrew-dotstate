class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.24/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "c8e26bec3837755a25d6d89d6f6e08f613073b5704201912302699ad591aca29"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.24/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "d20527989dce0605846657a4d62af980c3a6c75621322e64b3cdd96d54eda60a"
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
