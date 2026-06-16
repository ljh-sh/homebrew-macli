# frozen_string_literal: true

# Formula for macli — macOS system tools CLI.
# Source: https://github.com/ljh-sh/macli
# Uses universal binary (arm64 + x86_64 in single Mach-O) so one tarball
# serves both Apple Silicon and Intel Macs.
class Macli < Formula
  desc "macOS system tools CLI — only what shell/python can't do"
  homepage "https://github.com/ljh-sh/macli"
  url "https://github.com/ljh-sh/macli/releases/download/v0.0.1/macli-darwin-universal.tar.xz"
  sha256 "915a87aa905bc35ff27ccb006ecbfd54dccc9eb68170a32cce2d2511c645f93f"
  license "Apache-2.0"

  def install
    # Tarball internal layout: bin/macli
    # Homebrew 6 auto-extracts into buildpath which points at bin/ subdir
    # (likely because our tarball top-level dir is "bin")
    bin.install "macli"
  end

  def post_install
    # macli ships with ad-hoc signature (not Apple Developer ID).
    # Remove quarantine attr so Gatekeeper doesn't prompt on first run.
    target = "#{HOMEBREW_PREFIX}/bin/macli"
    system "xattr", "-dr", "com.apple.quarantine", target
  rescue BuildError
    # The attribute may not exist or may be protected; ignore the failure.
  end

  test do
    assert_match "macOS system tools CLI", shell_output("#{bin}/macli --help")
  end
end
