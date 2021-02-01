# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ArmagetronadAT029 < Formula
  desc "Armagetron is a multiplayer game in 3d that attempts to emulate and expand on the lightcycle sequence from the movie Tron. It's an old school arcade game slung into the 21st century. Highlights include a customizable playing arena, HUD, unique graphics, and AI bots. For the more advanced player there are new game modes and a wide variety of physics settings to tweak as well."
  homepage "http://www.armagetronad.org/"
  license "GPL Version 2"
  head "https://gitlab.com/armagetronad/armagetronad.git", :branch => "legacy_0.2.9"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "boost"
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

  def install
    system "./bootstrap.sh"
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test armagetronad@0.2.9`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
