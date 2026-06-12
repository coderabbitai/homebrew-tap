class GitGtr < Formula
  desc "Git worktree manager with editor and AI tool integration"
  homepage "https://github.com/coderabbitai/git-worktree-runner"
  url "https://github.com/coderabbitai/git-worktree-runner/archive/refs/tags/v2.8.0.tar.gz"
  sha256 "e8f2f3fa669a1c9e6d3ef6fd54d08a76f693f6828cdc19110160f69f8d7d9fd6"
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
