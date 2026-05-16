class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.3/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "bd46e1c989ec92481cf666759998c5171f746eb23665a93057d28275d46145b7"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.3/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "3cc16a040f68f232f3a99f8f3d9ff2cdf0e572ead20eba7153dade0f802f938a"
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
