class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.2/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "391c9cd112ecdcd00d41e16d2ce2cbc0e9b0e7900341005f6ff59950a261dc50"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.2/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "dcbf1339633e8729eae49c9fda62693b48a69ddf49d54cf18827904cd12053b7"
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
