class ArmagetronadAT028 < Formula
  desc "Armagetron is a multiplayer game in 3d that attempts to emulate and expand on the lightcycle sequence from the movie Tron. It's an old school arcade game slung into the 21st century. Highlights include a customizable playing arena, HUD, unique graphics, and AI bots. For the more advanced player there are new game modes and a wide variety of physics settings to tweak as well."
  homepage "http://www.armagetronad.org/"
  license "GPL-2.0-only"
  #url "https://gitlab.com/armagetronad/armagetronad/-/archive/v0.2.8.3.6/armagetronad-v0.2.8.3.6.tar.bz2"
  #sha256 "e95183f93f8da5b4459417085815a260d03aa03748003221ff507c3e469de915"
  head "https://gitlab.com/armagetronad/armagetronad.git", :branch => "release_0.2.8.3"
  revision 2

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "freetype"
  depends_on "ftgl"
  depends_on "glew"
  depends_on "libpng"
  depends_on "libxml2"
  depends_on "protobuf"
  depends_on "sdl"
  depends_on "sdl_image"
  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_mixer"

  uses_from_macos "python"

  def install
    ENV["progname"] = "armagetronad-0.2.8"
    ENV["progtitle"] = "Armagetron Advanced 0.2.8"
    system "./bootstrap.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--disable-zthreadtest",
                          "--disable-sysinstall",
                          "--disable-uninstall",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  def caveats
    <<~EOS
      You need to run Armagtron Advanced from the Terminal as 'armagetronad-0.2.8'.
      There is currently no shortcut in the Applications directory.
      Neither is a cask available.
    EOS
  end

  test do
    system "#{bin}/armagetronad", "-v"
  end
end
