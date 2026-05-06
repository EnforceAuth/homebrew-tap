class Zift < Formula
  desc "Scan codebases for embedded authorization logic and generate Rego policies"
  homepage "https://github.com/EnforceAuth/zift"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-aarch64-apple-darwin.tar.gz"
      sha256 "c83b308b77c5b13b6c1243deca3e0d24b5252cf48986a4ca4c5f48dbbacab059"
    else
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-apple-darwin.tar.gz"
      sha256 "f5439e1807c5148a17ef4129041324fcba8730a96c5c86da95bfbad278a45d3e"
    end
  end

  on_linux do
    url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f257315155448eac922b0b3af059a9f037ff8e4c69c1fca656019cdb1924f9d"
  end

  def install
    bin.install "zift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zift --version")
  end
end
