class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.1/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "0d47cc39dcbcf6b693ce7aecf758b8e792df422c62b3ebe1853f3337db04d4cd"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.3.1/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "6ee4f81dd6e5ea24f0e01f88a42daba7ec2150bf86c0c810515250497cc06364"
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
