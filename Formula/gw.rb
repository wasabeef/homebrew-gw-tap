class Gw < Formula
  desc "Interactive Git worktree manager"
  homepage "https://github.com/wasabeef/git-workers"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wasabeef/git-workers/releases/download/v0.2.1/gw-Darwin-aarch64.tar.gz"
      sha256 "78f94b46c2979e22ac91af93bf018c79600254a2862c1b113e14c9fdcefe7431"
    else
      url "https://github.com/wasabeef/git-workers/releases/download/v0.2.1/gw-Darwin-x86_64.tar.gz"
      sha256 "b845bc88cd32152fce7f3f4ff9dbba4a1d07a028b9b9a8a9b6927589c7db225f"
    end
  end

  on_linux do
    url "https://github.com/wasabeef/git-workers/releases/download/v0.2.1/gw-Linux-x86_64.tar.gz"
    sha256 "23e81cf1a3ec5f2b4dac57349f60ca6cced4fda5e65c00ee1ea08d476bb070e6"
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

# Updated: 2025-06-24T08:35:21Z
