require "language/node"

class Aicommits < Formula
  desc "Writes your git commit messages for you with AI"
  homepage "https://github.com/Nutlope/aicommits"
  url "https://registry.npmjs.org/aicommits/-/aicommits-1.5.0.tgz"
  sha256 "17557de70d7e7627d5ebb08192b79d30453652ce9f76e8965f8156a1f6c94bad"
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
