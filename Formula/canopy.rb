# Until the first tagged release this formula only supports --HEAD.
# The release workflow in shankar-sachin/canopy replaces this file with a
# versioned formula on every `v*` tag.
class Canopy < Formula
  desc "Beautiful, powerful git dashboard for your terminal"
  homepage "https://github.com/shankar-sachin/canopy"
  license "MIT"
  head "https://github.com/shankar-sachin/canopy.git", branch: "main"

  depends_on "rust" => :build
  depends_on "git"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/canopy")
  end

  test do
    assert_match "canopy", shell_output("#{bin}/canopy --version")
  end
end
