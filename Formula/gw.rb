class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.2.2/gw-Darwin-aarch64.tar.gz"
      sha256 "64eb338f232ad8bc3ca1ecd8e752c8a500c180406a364816d06f8c3dfae193fc"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.2.2/gw-Darwin-x86_64.tar.gz"
      sha256 "7a32d34b0b47bf845e9589138e4238eda797cb39f7853d4a7fa67781620cc822"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.2.2/gw-Linux-x86_64.tar.gz"
    sha256 "6dd8b47755124f8fd4a0a044e3984032707a948fcea0024efc20fd2a6c23030e"
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

# Updated: 2025-06-24T10:47:03Z
