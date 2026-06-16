# frozen_string_literal: true

# Formula for macli — macOS system tools CLI.
# Source: https://github.com/ljh-sh/macli
# Uses universal binary (arm64 + x86_64 in single Mach-O) so one tarball
# serves both Apple Silicon and Intel Macs.
class Macli < Formula
  desc "macOS system tools CLI — only what shell/python can't do"
  homepage "https://github.com/ljh-sh/macli"
  url "https://github.com/ljh-sh/macli/releases/download/v0.0.0/macli-darwin-universal.tar.xz"
  version "0.0.0"
  sha256 "1161d2f373d24163fb4318c4d474cc4d286ba07a5416252aa45d642e7c1e4ba0"
  license "MIT"

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
    system_command "xattr", args:         ["-dr", "com.apple.quarantine", target],
                            must_succeed: false
  end

  test do
    assert_match "macOS system tools CLI", shell_output("#{bin}/macli --help")
  end
end
