class Pixi < Formula
  desc "Package management made easy"
  homepage "https://github.com/prefix-dev/pixi"
  url "https://github.com/prefix-dev/pixi/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "6ac7271458ed0da6c43a1cb59de68052064dd62f216a954f99aa412428d3f7d0"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  on_linux do
    depends_on "pkg-config" => :build
    depends_on "openssl@3"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      To complete the pixi installation, add this to your .bashrc / .zshrc:
        export PATH=$HOME/.pixi/bin:$PATH
        eval "$(pixi completion)"
    EOS
  end

  test do
    assert_equal "pixi #{version}", shell_output("#{bin}/pixi --version").strip
    system "#{bin}/pixi", "init"
    assert_path_exists testpath/"pixi.toml"
  end
end
