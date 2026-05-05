class Zift < Formula
  desc "Scan codebases for embedded authorization logic and generate Rego policies"
  homepage "https://github.com/EnforceAuth/zift"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-aarch64-apple-darwin.tar.gz"
      sha256 "9b7fa505cac97d173591380d5d4f03c633bb73d6494b267284e95fd9c4efcb26"
    else
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-apple-darwin.tar.gz"
      sha256 "06b320f4f936a4ceec163a9fbea789fac475cac74292abb71aa64ecbecb252a3"
    end
  end

  on_linux do
    url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b306513f4c21a6cf0022ccf2d7d245267a7d2d3fba6dd6519697f0cc0ab4df1e"
  end

  def install
    bin.install "zift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zift --version")
  end
end
