class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.3.0/gw-Darwin-aarch64.tar.gz"
      sha256 "1131f76276003c95da9555898b64ba178623412b67a898a9013e2398bf8bb8bf"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.3.0/gw-Darwin-x86_64.tar.gz"
      sha256 "e6fae89b7157bb3ddc9be30f8b945dea088e6af17929bb1987baa094c62474e3"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.3.0/gw-Linux-x86_64.tar.gz"
    sha256 "26a184401c64cf461ccf6d456a306e15ddc864ada3587f0afab4997e8da94dee"
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

# Updated: 2025-06-25T13:55:46Z
