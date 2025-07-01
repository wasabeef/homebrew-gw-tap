class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.4.0/gw-Darwin-aarch64.tar.gz"
      sha256 "dfd63cf97b50d9d743165a886bfdf158975e80de2342c4b8149779c92bbe648b"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.4.0/gw-Darwin-x86_64.tar.gz"
      sha256 "731f7b0d6b1879aae100c3b23ff1f5c24b7a497c8f371a0ab1d011857da8d575"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.4.0/gw-Linux-x86_64.tar.gz"
    sha256 "6ae7a753e02c3c8e95baee9d695704c6738326d319163433cbb4ee737ecd841a"
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

# Updated: 2025-07-01T02:21:03Z
