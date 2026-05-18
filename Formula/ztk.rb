class Ztk < Formula
  desc "CLI proxy that reduces LLM token consumption by 78%+. Zero dependencies."
  homepage "https://github.com/codejunkie99/ztk"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/codejunkie99/ztk/releases/download/v0.3.0/ztk-aarch64-macos.tar.gz"
      sha256 "8844864ae3e2d0b60d162bece07101121c749278f811c743abb1adbd910168c3"
    end

    on_intel do
      url "https://github.com/codejunkie99/ztk/releases/download/v0.3.0/ztk-x86_64-macos.tar.gz"
      sha256 "fa81ab536a18d34dd4fe88fd415f2905e5689f2c8767927e76d4db114b14851d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/codejunkie99/ztk/releases/download/v0.3.0/ztk-aarch64-linux-musl.tar.gz"
      sha256 "63fcf250c01c9f1b331d11dcf91ee5a9710d4e323df3dc1d9b61f28f244a4650"
    end

    on_intel do
      url "https://github.com/codejunkie99/ztk/releases/download/v0.3.0/ztk-x86_64-linux-musl.tar.gz"
      sha256 "af724f1fcd05b16a2726e6e9d04a42ecd9e61e8064880ce9b4a8dcffe20fdec4"
    end
  end

  def install
    bin.install "ztk"
  end

  test do
    assert_match "ztk 0.3.0", shell_output("#{bin}/ztk --version")
  end
end
