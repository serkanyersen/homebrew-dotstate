class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.8/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "e94ed02cb413fc09feae0a7cc22c7b83fe63d863e66d01ee6bc48809b1bd282f"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.8/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "b1abf1fd7c2e199698208fbc3507eccab4cded900d5d174638609bc6bed21b8a"
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
