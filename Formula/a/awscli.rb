class Awscli < Formula
  include Language::Python::Virtualenv

  desc "Official Amazon AWS command-line interface"
  homepage "https://aws.amazon.com/cli/"
  url "https://github.com/aws/aws-cli/archive/refs/tags/2.22.8.tar.gz"
  sha256 "8c517a1c283d1c1a86e61c5dc9c25a082fcf6c9249c714686938f05baa4cd151"
  license "Apache-2.0"
  head "https://github.com/aws/aws-cli.git", branch: "v2"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1b53baff99f8a74196cd290d2e915faf5adaa045371f79864cd95c99e6560b77"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3a6dd7b9b0c608410fa2155a2e0d88b17b899d3cda686e170f4d6f51cae1af13"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "fe5a5067db92b84f957d363303d4e760f8d617a28f6e3728baf6b9b284a73dad"
    sha256 cellar: :any_skip_relocation, sonoma:        "5c28736499b220735607776f6faa958fcf1cafab7d5ccd5d38e8fb56e8eba30c"
    sha256 cellar: :any_skip_relocation, ventura:       "de075d62d13fc1c1687cd8b28e2827ffb348a192889155f3308ffeea7765c7d3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "23f70f091b8c17dfc56d984a48c79b1d0ba0d675a22705fcfced1f3531bf16e5"
  end

  depends_on "cmake" => :build
  depends_on "cryptography"
  depends_on "python@3.12"

  uses_from_macos "libffi"
  uses_from_macos "mandoc"

  on_linux do
    depends_on "openssl@3"
  end

  resource "awscrt" do
    url "https://files.pythonhosted.org/packages/e2/e5/82646e045902c237df1e59c2430ed392377d4dff0755eb30f9ea2c47d15f/awscrt-0.22.0.tar.gz"
    sha256 "4ca2b0b49328f03f5a3dde2d565132df8ad74cba27352612ecd9fe2505e1d770"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/4b/89/eaa3a3587ebf8bed93e45aa79be8c2af77d50790d15b53f6dfc85b57f398/distro-1.8.0.tar.gz"
    sha256 "02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/6b/5c/330ea8d383eb2ce973df34d1239b3b21e91cd8c865d21ff82902d952f91f/docutils-0.19.tar.gz"
    sha256 "33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6"
  end

  resource "flit-core" do
    url "https://files.pythonhosted.org/packages/c4/e6/c1ac50fe3eebb38a155155711e6e864e254ce4b6e17fe2429b4c4d5b9e80/flit_core-3.9.0.tar.gz"
    sha256 "72ad266176c4a3fcfab5f2930d76896059851240570ce9a98733b658cb786eba"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6/jmespath-1.0.1.tar.gz"
    sha256 "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/4b/bb/75cdcd356f57d17b295aba121494c2333d26bfff1a837e6199b8b83c415a/prompt_toolkit-3.0.38.tar.gz"
    sha256 "23ac5d50538a9a38c8bde05fecb47d0b403ecd0662857a86f886f798563d5b9b"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/d9/77/bd458a2e387e98f71de86dcc2ca2cab64489736004c80bc12b70da8b5488/python-dateutil-2.9.0.tar.gz"
    sha256 "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
  end

  resource "ruamel-yaml" do
    url "https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c/ruamel.yaml-0.17.21.tar.gz"
    sha256 "8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af"
  end

  resource "ruamel-yaml-clib" do
    url "https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b/ruamel.yaml.clib-0.2.8.tar.gz"
    sha256 "beb2e0404003de9a4cab9753a8805a8fe9320ee6673136ed7f04255fe60bb512"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e4/e8/6ff5e6bc22095cfc59b6ea711b687e2b7ed4bdb373f7eeec370a97d7392f/urllib3-1.26.20.tar.gz"
    sha256 "40c2dc0c681e47eb8f90e7e27bf6ff7df2e677421fd46756da1161c39ca70d32"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  def python3
    which("python3.12")
  end

  def install
    ENV["AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO"] = "1"

    # Work around ruamel.yaml.clib not building on Xcode 15.3, remove after a new release
    # has resolved: https://sourceforge.net/p/ruamel-yaml-clib/tickets/32/
    ENV.append_to_cflags "-Wno-incompatible-function-pointer-types" if DevelopmentTools.clang_build_version >= 1500

    venv = virtualenv_create(libexec, python3, system_site_packages: false)
    venv.pip_install resources
    venv.pip_install_and_link buildpath, build_isolation: false

    pkgshare.install "awscli/examples"

    rm bin.glob("{aws.cmd,aws_bash_completer,aws_zsh_completer.sh}")
    bash_completion.install "bin/aws_bash_completer"
    zsh_completion.install "bin/aws_zsh_completer.sh"
    (zsh_completion/"_aws").write <<~EOS
      #compdef aws
      _aws () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/aws_zsh_completer.sh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end

  def caveats
    <<~EOS
      The "examples" directory has been installed to:
        #{HOMEBREW_PREFIX}/share/awscli/examples
    EOS
  end

  test do
    assert_match "topics", shell_output("#{bin}/aws help")
    site_packages = libexec/Language::Python.site_packages(python3)
    assert_includes site_packages.glob("awscli/data/*"), site_packages/"awscli/data/ac.index"
  end
end
