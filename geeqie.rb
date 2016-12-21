class Geeqie < Formula
  desc "Lightweight Gtk+ based image viewer"
  homepage "http://www.geeqie.org/"
  url "http://www.geeqie.org/geeqie-1.3.tar.xz"
  sha256 "4b6f566dd1a8badac68c4353c7dd0f4de17f8627b85a7a70d5eb1ae3b540ec3f"

  bottle do
    sha256 "0e66dc0230ed6f10a29e7f9e14a4fe17cb8513ca868e55935783613eadd440ab" => :el_capitan
    sha256 "b5aca2da01efe158d87adbd9c9a31865b9ea8c779d5f469484486ace8f931c51" => :yosemite
    sha256 "25f034fd0ad78011464619acfacb550ca81e1d4ba27362136cab15b108603831" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "intltool" => :build
  depends_on "gettext"
  depends_on "gtk+3"
  depends_on "gdk-pixbuf"
  depends_on "pango"
  depends_on "cairo"
  depends_on "libtiff"
  depends_on "jpeg"
  depends_on "atk"
  depends_on "glib"
  depends_on "imagemagick" => :recommended
  depends_on "exiv2" => :recommended
  depends_on "little-cms2" => :recommended

  def install
    ENV["NOCONFIGURE"] = "yes"
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-glibtest",
                          "--disable-gtktest"
    system "make", "install"
  end

  test do
    system "#{bin}/geeqie", "--version"
  end
end
