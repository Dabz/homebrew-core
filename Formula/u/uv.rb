class Uv < Formula
  desc "Extremely fast Python package installer and resolver, written in Rust"
  homepage "https://github.com/astral-sh/uv"
  url "https://github.com/astral-sh/uv/archive/refs/tags/0.5.5.tar.gz"
  sha256 "48108de0a14dd91acf4ce73e1b28abb24f54969a3a477389b81e362ec2c098e5"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/astral-sh/uv.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "eb006c9725bfb6180a34126e94fb224514578c12df58a4ac4895ab97fad25c13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ad38db9bde3e70ec52b9f03c00f0b79af481e7d0c7059e526379ddff319078d5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9e9b8d27f2ca033e52b03100aaf4361e20b1f20ed068ab9adad17e5193cc26e1"
    sha256 cellar: :any_skip_relocation, sonoma:        "5c34a49b7f66ab86965ec2a59cc1d9d9d8c78c5d8d4cd797b7a3bd329b27dc18"
    sha256 cellar: :any_skip_relocation, ventura:       "ea47ccb9a5abdd235064e4000471505cc025ef782236199c5965e056a1cf0e7e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d549226aa8b1e7e077292338b3c96fc656ef4dfb2afb6df5c2532bc317fc97ce"
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  uses_from_macos "python" => :test
  uses_from_macos "bzip2"
  uses_from_macos "xz"

  def install
    ENV["UV_COMMIT_HASH"] = ENV["UV_COMMIT_SHORT_HASH"] = tap.user
    ENV["UV_COMMIT_DATE"] = time.strftime("%F")
    system "cargo", "install", "--no-default-features", *std_cargo_args(path: "crates/uv")
    generate_completions_from_executable(bin/"uv", "generate-shell-completion")
    generate_completions_from_executable(bin/"uvx", "--generate-shell-completion", base_name: "uvx")
  end

  test do
    (testpath/"requirements.in").write <<~REQUIREMENTS
      requests
    REQUIREMENTS

    compiled = shell_output("#{bin}/uv pip compile -q requirements.in")
    assert_match "This file was autogenerated by uv", compiled
    assert_match "# via requests", compiled

    assert_match "ruff 0.5.1", shell_output("#{bin}/uvx -q ruff@0.5.1 --version")
  end
end
