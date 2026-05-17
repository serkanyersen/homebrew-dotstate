class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.4/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "bd79c5b108091ff6a16ed53684eb3bc77d2f78fcd91363bd491f986833b24593"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.4/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "735bac87d2f46f2e10e481d202e58ca863ef1faa078e1d5505b72466633c65f1"
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
