class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  url "https://github.com/serkanyersen/dotstate/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "519b4c9cd8926321d50f23a35ad04ce602c3783479c12be3200773d174162e81"
  license "MIT"
  head "https://github.com/serkanyersen/dotstate.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "dotstate", shell_output("#{bin}/dotstate --version")
  end
end
