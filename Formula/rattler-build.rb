class RattlerBuild < Formula
  desc "Universal conda package builder"
  homepage "https://github.com/prefix-dev/rattler-build"
  url "https://github.com/prefix-dev/rattler-build/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "19749281c4686bb520d87615ec8217119ad8ed756c59056ba423ad6ca4135890"
  license "BSD-3-Clause"
  head "https://github.com/prefix-dev/rattler-build.git", branch: "main"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"rattler-build", "completion", "--shell")
  end

  test do
    assert_equal "rattler-build #{version}", shell_output("#{bin}/rattler-build --version").strip
    (testpath/"recipe"/"recipe.yaml").write <<~EOS
      package:
        name: test-package
        version: '0.1.0'

      build:
        noarch: generic
        string: buildstring
        script:
          - mkdir -p "$PREFIX/bin"
          - echo "echo Hello World!" >> "$PREFIX/bin/hello"
          - chmod +x "$PREFIX/bin/hello"

      requirements:
        run:
          - python

      tests:
        - script:
          - test -f "$PREFIX/bin/hello"
          - hello | grep "Hello World!"
    EOS
    system "#{bin}/rattler-build", "build", "--recipe", "recipe/recipe.yaml"
    assert_path_exists testpath/"output"/"noarch"/"test-package-0.1.0-buildstring.tar.bz2"
  end
end
