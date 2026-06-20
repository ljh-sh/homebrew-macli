# frozen_string_literal: true

# Formula for maclisten — private, lightweight macOS ASR CLI.
# Source: https://github.com/ljh-sh/maclisten
# Uses universal binary (arm64 + x86_64 in single Mach-O) so one tarball
# serves both Apple Silicon and Intel Macs.
class Maclisten < Formula
  desc "Private, lightweight macOS ASR CLI"
  homepage "https://github.com/ljh-sh/maclisten"
  url "https://github.com/ljh-sh/maclisten/releases/download/v0.2.0/maclisten-darwin-universal.tar.xz"
  sha256 "26a78dd25126b74903af6b30710972b0ece328778a703270ffaa5bae77095d36"
  license "Apache-2.0"

  def install
    # Tarball internal layout: bin/maclisten
    bin.install "maclisten"
  end

  def post_install
    # maclisten ships with an ad-hoc signature (not Apple Developer ID).
    # Remove quarantine attr so Gatekeeper doesn't prompt on first run.
    target = "#{HOMEBREW_PREFIX}/bin/maclisten"
    system "xattr", "-dr", "com.apple.quarantine", target
  rescue BuildError
    # The attribute may not exist or may be protected; ignore the failure.
  end

  test do
    assert_match "macOS speech-to-text", shell_output("#{bin}/maclisten --help")
  end
end
