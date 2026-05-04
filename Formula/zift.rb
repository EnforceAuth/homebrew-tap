class Zift < Formula
  desc "Scan codebases for embedded authorization logic and generate Rego policies"
  homepage "https://github.com/EnforceAuth/zift"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-aarch64-apple-darwin.tar.gz"
      sha256 "b8bb482c896d2b9c7dba99feaf34a4045a9a8b6fb8bcdb1f73f82a73644e127b"
    else
      url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-apple-darwin.tar.gz"
      sha256 "df63a6cbe41d1649f3246d7b457941285b7a260d8e4684145d6ca6fe76545eba"
    end
  end

  on_linux do
    url "https://github.com/EnforceAuth/zift/releases/download/v#{version}/zift-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b196d3a94129f50f4083d0372111a2f011562786d226361073bed08624e7bd9f"
  end

  def install
    bin.install "zift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zift --version")
  end
end
