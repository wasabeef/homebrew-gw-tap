class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.5.1/gw-Darwin-aarch64.tar.gz"
      sha256 "6ba83c00bee635d08500750d1048ae7dd6b7064a4037cf1d29b7f50ac9333566"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.5.1/gw-Darwin-x86_64.tar.gz"
      sha256 "adab70f027a796d3371e3a104a41766f5f3ef85071f1349afc11586d4a87b330"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.5.1/gw-Linux-x86_64.tar.gz"
    sha256 "06fce5eb656afa10de3f28ef4ef66113f79cf8f2f076449db4b1b847e1e5662a"
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

# Updated: 2025-07-12T06:47:56Z
