class HkclawLite < Formula
  desc "Discord/Telegram/KakaoTalk AI agent runtime with a local web admin"
  homepage "https://github.com/tkfka1/hkclaw-lite"
  url "https://registry.npmjs.org/hkclaw-lite/-/hkclaw-lite-1.0.13.tgz"
  sha256 "d4bc89d997467a4b02b593ef344044ce2678d64056ce6a7b079acf6b74a6fd58"
  license "MIT"
  version "1.0.13"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "hkclaw-lite", shell_output("#{bin}/hkclaw-lite --help")
  end
end
