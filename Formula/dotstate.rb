class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.4/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "73a43b0d334398f203f7e2eb90ceaa4c2f798d517a6eb78edc6adec21b29d7db"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.4/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "1e49d558357c3e38b13ccc9ef0c06a401f51566f482503ca544af827b4cc9000"
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
