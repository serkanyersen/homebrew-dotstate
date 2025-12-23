class Dotstate < Formula
  desc "A modern, secure, and user-friendly dotfile manager built with Rust"
  homepage "https://github.com/serkanyersen/dotstate"
  url "https://github.com/serkanyersen/dotstate/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "03b6eea0033bad2c689f27de88946314e6ea453b94007fb4cf037513c92433eb"
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
