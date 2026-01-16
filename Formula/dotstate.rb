class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.5/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "f2db2bfbbdc5ebb4c4a208826c79916254696d13c1576d3558fd362f485fcc27"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.5/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "59f25655c4136f59b21584d6944ead938b00cde7553507e291cd195f2e6b4fa6"
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
