require "formula"

class GitPrompt < Formula
  homepage "https://github.com/motine/gitprompt"
  url "https://github.com/motine/gitprompt/archive/master.zip"
  version "0.3"
  sha1 "5047147d42f7c539a114e5d82e10fd575eb9b2e9"

  def install
    bin.install ["current-git-branch", "pwd-last-two"]
    
    inreplace File.expand_path("~/.bash_profile") do |s|
      s << "\n"
      s << "\n"
      s << 'PS1="\$(pwd-last-two)\\[\033[0;37m\]\$(current-git-branch)\[\033[0m\]\\$ "'
      s << "\n"
    end
  end

  def caveats
    <<-EOS.undent

    For fully uninstalling please remove the line starting with "PS1" in ~/.bash_profile
    EOS
  end
end
