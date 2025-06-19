class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.1.0/gw-Darwin-aarch64.tar.gz"
      sha256 "eac41b2e2dec1633867c01b9bf4889541fe27d513ac6e523599a2fef76686116"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.1.0/gw-Darwin-x86_64.tar.gz"
      sha256 "9f9d5825046497c2ff65859670d62b048638ea2a38d48d7d530a981d3219b5f5"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.1.0/gw-Linux-x86_64.tar.gz"
    sha256 "69e43c149e3643790e2f039f9cd2861c184147d19d9d42b1ca4c20b7298cebc6"
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

# Updated: 2025-06-19T12:18:56Z
