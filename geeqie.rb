class Geeqie < Formula
  desc "Lightweight Gtk+ based image viewer"
  homepage "http://www.geeqie.org/"
  url "http://www.geeqie.org/geeqie-1.3.tar.xz"
  sha256 "4b6f566dd1a8badac68c4353c7dd0f4de17f8627b85a7a70d5eb1ae3b540ec3f"

  bottle do
    sha256 "b55ee83bf57382a102ffc88eb0574102e5aee3f90defe9bac204c87345328451" => :sierra
    sha256 "6892e39d1e2def5db7ef11236a57edfeeccd792ba4552fbf37c2f8f17ef8f127" => :el_capitan
    sha256 "318ed16a1fc3376602d782ed43f665dc8394db8a807cbd1c65544a0b202e5447" => :yosemite
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
