class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  url "https://github.com/serkanyersen/dotstate/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "a3c6b94156e607c11c103d6105ec18a0c69217547dcf1452cb7e44ccea729a4d"
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
