class Dvisvgm < Formula
  desc "A fast DVI, EPS, and PDF to SVG converter"
  homepage "https://dvisvgm.de"
  url "https://github.com/mgieseki/dvisvgm/archive/refs/tags/3.0.4.tar.gz"
  sha256 "41ff6f5bb975a0f00a50f48a382be12a11a9c515d8cb160ec5950c5f0e71b82e"
  license "GPL-3.0"

  depends_on "cmake" => :build
  depends_on "autoconf-archive" => :build
  depends_on "pkg-config" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "freetype"
  depends_on "brotli"
  depends_on "potrace"
  depends_on "ghostscript"
  depends_on "woff2"
  depends_on "xxhash"
  depends_on "texlive"
  uses_from_macos "zlib"

  def install
    # ./configure \
    #   CPPFLAGS="-I/opt/homebrew/Cellar/texlive/20220321_4/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/Cellar/freetype/2.13.0_1/include" \
    #   LDFLAGS="-L/opt/homebrew/Cellar/texlive/20220321_4/lib -L/opt/homebrew/Cellar/freetype/2.13.0_1/lib -L/opt/homebrew/Cellar/zlib/1.2.13/lib" \
    #   PKG_CONFIG_PATH=/opt/homebrew/Cellar/zlib/1.2.13/lib/pkgconfig \
    #   --with-zlib=/opt/homebrew/opt/zlib \
    #   --enable-bundled-libs
    system "autoreconf", "-if"
    system "./configure", "--prefix=#{prefix}", "--with-kpathsea=/opt/homebrew/opt/texlive" "--enable-bundled-libs"

    system "make", "install"
  end

  test do
    testpath/"test.tex".write <<~EOS
      \\documentclass{article}
      \\begin{document}
      Hello World!
      \\end{document}
    EOS
    system "latex", "test.tex"
    system "dvisvgm", "test.dvi"
  end
end
