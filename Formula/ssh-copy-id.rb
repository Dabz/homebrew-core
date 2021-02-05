class SshCopyId < Formula
  desc "Add a public key to a remote machine's authorized_keys file"
  homepage "https://www.openssh.com/"
  url "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.4p1.tar.gz"
  mirror "https://mirror.vdms.io/pub/OpenBSD/OpenSSH/portable/openssh-8.4p1.tar.gz"
  version "8.4p1"
  sha256 "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
  license "SSH-OpenSSH"
  revision 1
  head "https://github.com/openssh/openssh-portable.git"

  bottle :unneeded

  keg_only :provided_by_macos

  # Fixes an invalid heredoc within a multiline `$()` block.
  # Fixed upstream; will be in the next release.
  # https://github.com/openssh/openssh-portable/pull/206
  patch do
    url "https://github.com/openssh/openssh-portable/commit/d9e727dcc04a52caaac87543ea1d230e9e6b5604.patch?full_index=1"
    sha256 "fbca48deeaf0e51ddf220fa18088142ade2d406ad06bb03720389313df282651"
  end

  def install
    bin.install "contrib/ssh-copy-id"
    man1.install "contrib/ssh-copy-id.1"
  end

  test do
    output = shell_output("#{bin}/ssh-copy-id -h 2>&1", 1)
    assert_match "identity_file", output
  end
end
