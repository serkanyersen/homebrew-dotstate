class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.2/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "d05b7ae981f59c38ab980ed80678019df5c6735d4ab0cf0da4ed64cd5aaecfba"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.2/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "10bdcea8ddbcd15941c999e6cd10cc4ccadd4eefb57501e3384a296621845bd5"
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
