class HkclawLite < Formula
  desc "Discord/Telegram/KakaoTalk AI agent runtime with a local web admin"
  homepage "https://github.com/tkfka1/hkclaw-lite"
  url "https://registry.npmjs.org/hkclaw-lite/-/hkclaw-lite-1.0.16.tgz"
  sha256 "8517ce85daa1b3ea60c4a59907ba1394e7e1e64ef6c7811b3c521d98bd00eee0"
  license "MIT"
  version "1.0.16"

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
    run [opt_bin/"hkclaw-lite", "--root", var/"hkclaw-lite", "admin", "--host", "0.0.0.0", "--port", "5687", "--foreground"]
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
