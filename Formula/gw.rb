class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.5.0/gw-Darwin-aarch64.tar.gz"
      sha256 "2930c66803f89bef33ea7ff4f4f4790753833733a01a85632202c01306a3e259"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.5.0/gw-Darwin-x86_64.tar.gz"
      sha256 "d4fbee79554294f8b7e014ad882403b1d66bb5b8ba3ba70e1bfbd2ed186c11d1"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.5.0/gw-Linux-x86_64.tar.gz"
    sha256 "f07af29ace4acd2212d28a52a5ba0e2b3832e87bc91820db0d5078f5130198f6"
  end

  def install
    bin.install "gw"
    (share/"gw").install "shell"
  end

  def caveats
    <<~EOS
      To enable shell integration for automatic directory switching:

      For bash (~/.bashrc):
        source #{share}/gw/shell/gw.sh

      For zsh (~/.zshrc):
        source #{share}/gw/shell/gw.sh
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gw --version")
  end
end

# Updated: 2025-07-02T15:00:37Z
