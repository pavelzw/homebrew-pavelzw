class Dvisvgm < Formula
  desc "Fast DVI, EPS, and PDF to SVG converter"
  homepage "https://dvisvgm.de"
  url "https://github.com/mgieseki/dvisvgm/archive/refs/tags/3.0.4.tar.gz"
  sha256 "41ff6f5bb975a0f00a50f48a382be12a11a9c515d8cb160ec5950c5f0e71b82e"
  license "GPL-3.0"

  depends_on "autoconf" => :build
  depends_on "autoconf-archive" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on "brotli"
  depends_on "freetype"
  depends_on "ghostscript"
  depends_on "potrace"
  depends_on "texlive"
  depends_on "woff2"
  depends_on "xxhash"
  uses_from_macos "zlib"

  def install
    system "autoreconf", "-if"
    system "./configure", "--prefix=#{prefix}", "--with-kpathsea=/opt/homebrew/opt/texlive", "--enable-bundled-libs"

    system "make", "install"
  end

  test do
    (testpath/"test.tex").write <<~EOS
      \\documentclass{article}
      \\begin{document}
      Hello World!
      \\end{document}
    EOS
    system "latex", "test.tex"
    system "dvisvgm", "test.dvi"
  end
end
