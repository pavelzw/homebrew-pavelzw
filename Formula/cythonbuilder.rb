class Cythonbuilder < Formula
  include Language::Python::Virtualenv

  desc "Automated compilation of Cython code"
  homepage "https://github.com/mike-huls/cythonbuilder"
  url "https://files.pythonhosted.org/packages/ee/56/6f45e104165ba0f43223d6607195dd41645c6c1760c3fb1b5d3638c5db73/cythonbuilder-0.1.13.tar.gz"
  sha256 "7c8751d9b82aa2754a05ba3eb7e19b48672db2bc7ff4e6f6307c1db55d3bf6f1"
  license "MIT"

  depends_on "python@3.11"

  resource "coloredlogs" do
    url "https://files.pythonhosted.org/packages/cc/c7/eed8f27100517e8c0e6b923d5f0845d0cb99763da6fdee00478f91db7325/coloredlogs-15.0.1.tar.gz"
    sha256 "7c991aa71a4577af2f82600d8f8f3a89f936baeaf9b50a9c197da014e5bf16b0"
  end

  resource "Cython" do
    url "https://files.pythonhosted.org/packages/dc/f6/e8e302f9942cbebede88b1a0c33d0be3a738c3ac37abae87254d58ffc51c/Cython-0.29.33.tar.gz"
    sha256 "5040764c4a4d2ce964a395da24f0d1ae58144995dab92c6b96f44c3f4d72286a"
  end

  resource "humanfriendly" do
    url "https://files.pythonhosted.org/packages/cc/3f/2c29224acb2e2df4d2046e4c73ee2662023c58ff5b113c4c1adac0886c43/humanfriendly-10.0.tar.gz"
    sha256 "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2288ddc"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    phrase = "You are using Homebrew"

    (testpath/"cythonfile.pyx").write <<~EOS
      def cythonfunction():
        print('#{phrase}')
    EOS
    (testpath/"test.py").write <<~EOS
      from cythonfile import cythonfunction
      cythonfunction()
    EOS

    system bin/"cybuilder", "build", "-y"

    assert_path_exists "#{testpath}/ext/annotations/cythonfile.html"
    assert_match phrase, shell_output("#{libexec}/bin/python test.py")
  end
end
