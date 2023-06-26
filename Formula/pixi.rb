class Pixi < Formula
  desc "Package management made easy"
  homepage "https://github.com/prefix-dev/pixi"
  url "https://github.com/prefix-dev/pixi/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "71454f08bc464b814979442e874610c332958f4e425da3bb6bfed54571c2dfea"
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
