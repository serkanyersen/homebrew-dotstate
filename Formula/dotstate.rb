class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  # Determine the correct binary asset based on architecture
  # URLs and SHA256s are automatically updated by GitHub Actions on release
  if Hardware::CPU.intel?
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.0/dotstate-x86_64-apple-darwin.tar.gz"
    sha256 "96ff2a2d851453d4f604bd992ad06f12343ca6de130bb8cead96eb4ef2d27517"
  else
    url "https://github.com/serkanyersen/dotstate/releases/download/v0.2.0/dotstate-aarch64-apple-darwin.tar.gz"
    sha256 "a04d86d27caf19a3d39822f6dcfaa2817e880a70daa30fd3ec0081dadc3ae506"
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
