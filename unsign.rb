class Unsign < Formula
  desc "A command line tool to unsign Xcode"
  homepage "https://github.com/phynet/unsign-xcode"
  url "https://github.com/janopoq/homebrew-unsign-xcode/raw/master/unsign-1.0.0.high_sierra.bottle.tar.gz"
  sha256 "cf2a09c848b608f970fbed56863d7155bd50800a06a4379330e641eaa38efd4c" 
  version "1.0.0"
  needs :cxx11
  depends_on :xcode => :build
  bottle do
      cellar :any
      sha256 "6677ae0354d2ab5ec304034655ccb2db6bda98b6b2da2b257ebe14f4aa88f366" => :high_sierra
      sha256 "cafebabe" => :sierra
      sha256 "cafebabe" => :el_capitan
    end
  def install
    bin.write_exec_script (libexec/"unsign-xcode.sh")
    system "make"
    bin.install "unsign"
  end
  test do
    output = shell_output("#{bin}/unsign-xcode")
    assert_match "This command", output
  end
end
