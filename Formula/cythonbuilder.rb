class Cythonbuilder < Formula
  include Language::Python::Virtualenv

  desc "Automated compilation of Cython code"
  homepage "https://github.com/mike-huls/cythonbuilder"
  url "https://files.pythonhosted.org/packages/4b/c7/7c6008741b5c4bf498f5648a232fffaa2d2b7fdd0d0679d936c2a6adaf7f/cythonbuilder-0.1.20.tar.gz"
  sha256 "159a96b2cb3e5a16ab646b19e5c55021e506911b26761080f9a0c97bf2bdc50a"
  license "MIT"

  depends_on "python@3.11"

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "coloredlogs" do
    url "https://files.pythonhosted.org/packages/cc/c7/eed8f27100517e8c0e6b923d5f0845d0cb99763da6fdee00478f91db7325/coloredlogs-15.0.1.tar.gz"
    sha256 "7c991aa71a4577af2f82600d8f8f3a89f936baeaf9b50a9c197da014e5bf16b0"
  end

  resource "Cython" do
    url "https://files.pythonhosted.org/packages/da/a0/298340fb8412574a0b00a0d9856aa27e7038da429b9e31d6825173d1e6bd/Cython-0.29.35.tar.gz"
    sha256 "6e381fa0bf08b3c26ec2f616b19ae852c06f5750f4290118bf986b6f85c8c527"
  end

  resource "humanfriendly" do
    url "https://files.pythonhosted.org/packages/cc/3f/2c29224acb2e2df4d2046e4c73ee2662023c58ff5b113c4c1adac0886c43/humanfriendly-10.0.tar.gz"
    sha256 "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2288ddc"
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
