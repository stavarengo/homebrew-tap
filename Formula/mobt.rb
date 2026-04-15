class Mobt < Formula
  include Language::Python::Virtualenv

  desc "Mob session management tool"
  homepage "https://github.com/stavarengo/mob-tool"
  url "https://files.pythonhosted.org/packages/a4/1a/14428bb7de5abf08646b1fa83ab3e7b8ef35d7fe3d8466f9b3858eec772b/mob_tool-2.0.1.tar.gz"
  sha256 "3e7f8209827e1c7cf141080cde8fc15377d87a602928bcf2a172a61ccd2715e3"
  license "MIT"

  depends_on "python@3.11"

  # resources filled in by US-003b

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mobt --help")
    assert_match "Usage:", shell_output("#{bin}/mob-tool --help")
  end
end
