class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.12/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "5a7657ac004d221a8aced426c4ca0cb36d144817a04cd80039c3f94ab90903bf"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.12/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "f80340b18d71c1f4059f2f9a2891689782d2cd09d73dc2d5e8f386acefeff945"
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
