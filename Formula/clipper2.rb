class Clipper2 < Formula
  desc "Polygon Clipping and Offsetting"
  homepage "http://www.angusj.com/clipper2/Docs/Overview.htm"
  url "https://github.com/AngusJohnson/Clipper2/archive/refs/tags/Clipper2_1.2.0.tar.gz"
  sha256 "8daa5321400a94a47e722098d505b38f74419c554ce7d77f90fb4f1b77c87fbd"
  license "BSL-1.0"

  livecheck do
    url :stable
    regex(/^Clipper2_(\d+(?:\.\d+)+)$/i)
  end

  depends_on "cmake" => :build

  def install
    args = ["-DCLIPPER2_TESTS=OFF"]

    chdir "CPP" do
      # ENV.deparallelize  # if your formula fails when building in parallel
      system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
      system "cmake", "--build", "build"
      system "cmake", "--install", "build"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test Clipper2`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
