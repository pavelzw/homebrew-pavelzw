require "language/node"

class Aicommits < Formula
  desc "Writes your git commit messages for you with AI"
  homepage "https://github.com/Nutlope/aicommits"
  url "https://registry.npmjs.org/aicommits/-/aicommits-1.1.0.tgz"
  sha256 "67fff8d35b76e529d79089ca2e571960a1c85e3d93a6a08f11cd93039f90c5d0"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "The current directory must be a Git repository!", shell_output("#{bin}/aicommits", 1)

    system "git", "init"
    assert_match "No staged changes found. Make sure to stage your changes with `git add`.",
      shell_output("#{bin}/aicommits", 1)
    touch "test.txt"
    system "git", "add", "test.txt"
    assert_match "Please set your OpenAI API key in ~/.aicommits", shell_output("#{bin}/aicommits", 1)
  end
end
