class GitGtr < Formula
  desc "Git worktree manager with editor and AI tool integration"
  homepage "https://github.com/coderabbitai/git-worktree-runner"
  url "https://github.com/coderabbitai/git-worktree-runner/archive/refs/tags/v2.11.1.tar.gz"
  sha256 "605e819332e741b4b04bd2ee01ef92c8c223cfa2ee188262d008d9bd81e3dcae"
  license "Apache-2.0"

  depends_on "git"

  def install
    bin.install "bin/git-gtr"
    bin.install "bin/gtr"
    prefix.install "lib"
    prefix.install "adapters"

    # Install completions natively
    bash_completion.install "completions/gtr.bash" => "git-gtr"
    zsh_completion.install "completions/_git-gtr"
    fish_completion.install "completions/git-gtr.fish"
  end

  test do
    assert_match "gtr version", shell_output("#{bin}/git-gtr version")
  end
end
