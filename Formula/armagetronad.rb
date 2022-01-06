class Armagetronad < Formula
  desc "Armagetron is a multiplayer game in 3d that attempts to emulate and expand on the lightcycle sequence from the movie Tron. It's an old school arcade game slung into the 21st century. Highlights include a customizable playing arena, HUD, unique graphics, and AI bots. For the more advanced player there are new game modes and a wide variety of physics settings to tweak as well."
  homepage "http://www.armagetronad.org/"
  license "GPL-2.0-only"
  #url "https://gitlab.com/armagetronad/armagetronad/-/archive/v0.4.0.0.0/armagetronad-v0.4.0.0.0.tar.bz2"
  #sha256 "09df905124667ea2bda7c85c4696b88684e18af1d31d6569e537d84a6166088b"
  head "https://gitlab.com/armagetronad/armagetronad.git", :branch => "trunk"
  revision 3

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "protobuf" => :build
  depends_on "protobuf-c" => :build
  depends_on "create-dmg" => :build
  depends_on "dylibbundler" => :build
  depends_on "pkg-config" => :build
  depends_on "python3" => :build
  depends_on "wget" => :build
  depends_on "glew"
  depends_on "ftgl"
  depends_on "libpng"
  depends_on "sdl2"
  depends_on "sdl2_mixer"
  depends_on "sdl2_image"
  depends_on "libxml2"

  uses_from_macos "python"

  def install
    system "./bootstrap.sh"
    system "./configure", "--enable-automakedefaults",
                          "--disable-restoreold",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-initscripts",
                          "--disable-silent-rules",
                          "--disable-sysinstall",
                          "--disable-uninstall",
                          "--disable-useradd",
                          "--disable-zthreadtest",
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
