class Cythonbuilder < Formula
  include Language::Python::Virtualenv

  desc "Automated compilation of Cython code"
  homepage "https://github.com/mike-huls/cythonbuilder"
  url "https://files.pythonhosted.org/packages/1b/b0/53440f4ba09b77473abb4205aaeab2777008afb3d9f922c9ba25a6e471fb/cythonbuilder-0.1.22.tar.gz"
  sha256 "5121abc6643746c62bf256f5068b378b0f29301343a5ce9fedd74f1cd8f6724e"
  license "MIT"

  depends_on "python@3.11"

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "cython" do
    url "https://files.pythonhosted.org/packages/2a/97/8cc3fe7c6de4796921236a64d00ca8a95565772e57f0d3caae68d880b592/Cython-0.29.37.tar.gz"
    sha256 "f813d4a6dd94adee5d4ff266191d1d95bf6d4164a4facc535422c021b2504cfb"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/e1/45/bcbc581f87c8d8f2a56b513eb994d07ea4546322818d95dc6a3caf2c928b/typer-0.7.0.tar.gz"
    sha256 "ff797846578a9f2a201b53442aedeb543319466870fbe1c701eab66dd7681165"
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
