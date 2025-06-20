class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.2.0/gw-Darwin-aarch64.tar.gz"
      sha256 "267957ad0a5ccc67c3d6d3b546fb8463775f71d10da2d327d049995ccee14424"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.2.0/gw-Darwin-x86_64.tar.gz"
      sha256 "84d1eaccf7122d9803316f69f4cb7e2f27a5301eef5c55dd2d7f95572de7948e"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.2.0/gw-Linux-x86_64.tar.gz"
    sha256 "049064367675858164b6418c19622a737a9f82af08d2ba919a8b63c93502b0ac"
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

# Updated: 2025-06-20T17:11:09Z
