class Zift < Formula
  desc "Scan codebases for embedded authorization logic and generate Rego policies"
  homepage "https://github.com/EnforceAuth/zift"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-aarch64-apple-darwin.tar.gz"
      sha256 "4dfb66b9971c65a461beedb2fcdc521552ea29b12d32b10d2b1cc97282ccfc4b"
    else
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-apple-darwin.tar.gz"
      sha256 "a49f013a997ab3f9db339b197d822d77b534e85032ad243cd481db190f484f03"
    end
  end

  on_linux do
    url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "79253935f01e6bc6661f09004bd61d3a0828ef3d611700d4cde253bbf17906e6"
  end

  def install
    bin.install "zift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zift --version")
  end
end
