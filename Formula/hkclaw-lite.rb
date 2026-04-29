class HkclawLite < Formula
  desc "Discord/Telegram/KakaoTalk AI agent runtime with a local web admin"
  homepage "https://github.com/tkfka1/hkclaw-lite"
  url "https://registry.npmjs.org/hkclaw-lite/-/hkclaw-lite-1.0.14.tgz"
  sha256 "ea4c9709a3c8a51bfc327236e3ebf3834af54ee6ac990d070886301a75fe5b6a"
  license "MIT"
  version "1.0.14"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def post_install
    (var/"hkclaw-lite").mkpath
    (var/"log").mkpath
  end

  service do
    run [opt_bin/"hkclaw-lite", "--root", var/"hkclaw-lite", "admin", "--host", "0.0.0.0", "--port", "5687"]
    working_dir var/"hkclaw-lite"
    keep_alive true
    log_path var/"log/hkclaw-lite.log"
    error_log_path var/"log/hkclaw-lite.err.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_match "hkclaw-lite", shell_output("#{bin}/hkclaw-lite --help")
  end
end
