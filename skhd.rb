class Skhd < Formula
  desc "Xieyt CUSTOM  skhd"
  homepage "https://github.com/xieyt/skhd"
  url "https://github.com/Xieyt/skhd/archive/refs/tags/v0.3.tar.gz"
  sha256 "b33d6e40560c1f0ed2e1e8bec36c148865a2fcfd0e9310470a5a5bd6252db758"
  head "https://github.com/Xieyt/skhd.git"

   def install
    ENV.deparallelize
    system "make", "-j1", "install"
    bin.install "#{buildpath}/bin/skhd"
    (pkgshare/"examples").install "#{buildpath}/examples/skhdrc"
  end

  def caveats; <<~EOS
    Copy the example configuration into your home directory:
      cp #{opt_pkgshare}/examples/skhdrc ~/.skhdrc

    If you want skhd to be managed by launchd (start automatically upon login):
      skhd --start-service

    When running as a launchd service logs will be found in:
      /tmp/skhd_<user>.[out|err].log
    EOS
  end

  test do
    assert_match "skhd-v#{version}", shell_output("#{bin}/skhd --version")
  end
end
