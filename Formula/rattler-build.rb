class RattlerBuild < Formula
  desc "Universal conda package builder for Windows, macOS and Linux"
  homepage "https://github.com/prefix-dev/rattler-build"
  url "https://github.com/prefix-dev/rattler-build/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "833768fb3fb9049b9b9f945be19ea623e9af4f86e608b25e9aff2e2dc543cbb9"
  license "BSD-3-Clause"
  head "https://github.com/prefix-dev/rattler-build.git", branch: "main"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "rattler-build #{version}", shell_output("#{bin}/rattler-build --version").strip
    (testpath/"recipe.yaml").write <<~EOS
      package:
        name: test-package
        version: '0.1.0'

      build:
        noarch: generic
        string: buildstring
        script:
          - mkdir -p $PREFIX/bin
          - echo "echo Hello World!" >> $PREFIX/bin/hello
          - chmod +x $PREFIX/bin/hello

      test:
        commands:
          - test -d ${PREFIX}/bin/hello
          - hello | grep "Hello World!"
    EOS
    system "#{bin}/rattler-build", "build"
    assert_path_exists testpath/"output"/"noarch"/"test-package-0.1.0-buildstring.tar.bz2"
  end
end
