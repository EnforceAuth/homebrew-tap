class Zift < Formula
  desc "Scan codebases for embedded authorization logic and generate Rego policies"
  homepage "https://github.com/EnforceAuth/zift"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-aarch64-apple-darwin.tar.gz"
      sha256 "79cc527a33edf9bdb87d464966ef65ec98b59abb5824c6e2175f6deddce956ae"
    else
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-apple-darwin.tar.gz"
      sha256 "65ceb4aab0983c70b882190d7556abb03a7e7ea682b9be7a1d8e49a9d0467318"
    end
  end

  on_linux do
    url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a896b8141d5104c9e253ff449f20364c8e20ca1b3f01a2132324953b6591902f"
  end

  def install
    bin.install "zift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zift --version")
  end
end
