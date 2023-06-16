class Pixi < Formula
  desc "Package management made easy"
  homepage "https://github.com/prefix-dev/pixi"
  url "https://github.com/prefix-dev/pixi/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "88a66323282d2fd1bab7a3257b08b21c2f4f9256e9c72bcdb0c2672332d6e874"
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
    # https://github.com/prefix-dev/pixi/issues/92
    # assert_equal version, shell_output("#{bin}/pixi --version").strip
    system "#{bin}/pixi", "init"
    assert_path_exists testpath/"pixi.toml"
  end
end
