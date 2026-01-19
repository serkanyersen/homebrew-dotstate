class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.10/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "dea07c364e1379e7fc8965e2df336b353b604f728a2fd4072d6f4debee358d73"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.10/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "acdc830fa2f5572bcbe29df110ad982972d6b061dcc7164b95405f9fb768b471"
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
