class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.23/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "db3847d6747e93988324381426abc84b0625685a6c9c5e88f842bf6ea3187567"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.23/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "2dfbe0eea922740c9b6a9fb4613698288adaa5a0f3e63b5c528c87f1ef5ef589"
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
