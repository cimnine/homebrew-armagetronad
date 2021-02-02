class Armagetronad < Formula
  desc "Armagetron is a multiplayer game in 3d that attempts to emulate and expand on the lightcycle sequence from the movie Tron. It's an old school arcade game slung into the 21st century. Highlights include a customizable playing arena, HUD, unique graphics, and AI bots. For the more advanced player there are new game modes and a wide variety of physics settings to tweak as well."
  homepage "http://www.armagetronad.org/"
  license "GPL-2.0-only"
  #url "https://gitlab.com/armagetronad/armagetronad/-/archive/v0.4.0.0.0/armagetronad-v0.4.0.0.0.tar.bz2"
  #sha256 "09df905124667ea2bda7c85c4696b88684e18af1d31d6569e537d84a6166088b"
  head "https://gitlab.com/armagetronad/armagetronad.git", :branch => "trunk"
  revision 1

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "ftgl"
  depends_on "libpng"
  depends_on "protobuf"
  depends_on "sdl2"

  uses_from_macos "python"

  def install
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
      You need to run Armagtron Advanced from the Terminal as 'armagetronad'.
      There is currently no shortcut in the Applications directory.
      Neither is a cask available.
    EOS
  end

  test do
    system "#{bin}/armagetronad", "-v"
  end
end
