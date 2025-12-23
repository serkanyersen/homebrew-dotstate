class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  url "https://github.com/serkanyersen/dotstate/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "916f984db3bd7c096958dad26e4f6dea5db756388c2bb2cccb2db186e21be2ac"
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
