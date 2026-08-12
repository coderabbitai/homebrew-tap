class GitGtr < Formula
  desc "Git worktree manager with editor and AI tool integration"
  homepage "https://github.com/coderabbitai/git-worktree-runner"
  url "https://github.com/coderabbitai/git-worktree-runner/archive/refs/tags/v2.9.0.tar.gz"
  sha256 "9f5a7c6d237a7337945b7ef6a356b63a2b60f144fb384c4d3ff197167a5dcee9"
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
