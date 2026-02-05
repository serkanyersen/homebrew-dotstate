class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.25/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "101e0d902f082d5026a7e45be961dbd7da083879182bc12fecfc00297778a5d0"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.25/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "8b174b3b63e1c1590fb0e1c4a52a625777bf0072cd5e44fc59f7224526ac3f61"
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
