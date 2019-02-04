if [[ "$OSTYPE" == "darwin"* ]]; then
  rmdsstore() { sudo find / -depth -xdev -name ".DS_Store" -delete -print }

  clear-history() {
    rm -rf ~/.*history ;
    rm -rf ~/.zcompdump* ;
    rm -rr ~/.oracle_jre_usage ;
  }

  hidden-on() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
  hidden-off() { defaults write com.apple.Finder AppleShowAllFiles NO ; }

  mkcdir () { mkdir -p -- "$1" && cd -P -- "$1" }

  bye() {
    puts "Bye!";

    puts "Removing .DS_Store...";
    rmdsstore;

    if hash brew-checkup 2>/dev/null; then
      puts "Doing brew checkup...";
       brew-checkup;
    fi

    puts "Clear all history files..";
    clear-history;

    puts "Restarting Finder, Dock, SystemUIServer...";
    killall Finder Dock SystemUIServer;

    if hash upgrade_oh_my_zsh 2>/dev/null; then
      puts "Upgrading oh my zsh...";
      upgrade_oh_my_zsh;
    fi

    puts "Exiting...";
    exit;
  }
fi
