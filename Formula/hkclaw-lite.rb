class HkclawLite < Formula
  desc "Discord/Telegram/KakaoTalk AI agent runtime with a local web admin"
  homepage "https://github.com/tkfka1/hkclaw-lite"
  url "https://registry.npmjs.org/hkclaw-lite/-/hkclaw-lite-1.0.11.tgz"
  sha256 "545a1800396ff50ea5805af3b2b7e3833d374a8dbd30f99fc601198fa8659959"
  license "MIT"
  version "1.0.11"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "hkclaw-lite", shell_output("#{bin}/hkclaw-lite --help")
  end
end
