require "formula"

class GitPrompt < Formula
  homepage "https://github.com/motine/gitprompt"
  url "https://github.com/motine/gitprompt/archive/master.zip"
  version "0.3"
  sha1 "044a9b8d54a9bdc3a330c511bb13c64cdcafb4f5"

  def install
    bin.install ["current-git-branch", "pwd-last-two"]
    
    inreplace File.expand_path("~/.bash_profile") do |s|
      s << 'PS1="\$(pwd-last-two)\\[\033[0;37m\]\$(current-git-branch)\[\033[0m\]\\$ "'
    end
  end

  def caveats
    <<-EOS.undent

    For fully uninstalling please remove the line starting with "PS1" in ~/.bash_profile
    EOS
  end
end
