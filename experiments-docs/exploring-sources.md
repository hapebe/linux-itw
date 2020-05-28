# Trying to inspect source code: BSD Games

_on Ubuntu 17.04__

* First, enable source repository/ies: software-properties-gtk
* `sudo apt-get source bsdgames` fails, tell me to install dpkg-dev
* `sudo apt-get install dkpg-dev` unfortunately also fails: E: Unable to locate package dkpg-dev
  * but another `apt-get update` apparently fixes the problem, install now works
  * among others, dpkg-dev seems to depend on build-essential !
* Now the source installations works. But the messages contain these lines (among others):

```
NOTICE: 'bsdgames' packaging is maintained in the 'Git' version control system at:
https://anonscm.debian.org/git/pkg-games/bsdgames.git
Please use:
git clone https://anonscm.debian.org/git/pkg-games/bsdgames.git
to retrieve the latest (possibly unreleased) updates to the package.
```

* I.e. for my original intent, I could / should use git instead of the package management tools...
* Can't seem to find the source code in /usr/src or /usr/local/src
* Okay, `find / -type d -name "bsdgames-2.17" 2>/dev/null` reveals a hilarious surprise: The sources have been unpacked to `/home/hapebe/bsdgames-2.17` !
* Now I can inspect the sources of my favorite game "hangman" in `~/bsdgames-2.17/hangman` - hooray!

## Geany
* Now I want to explore the C sources with some basic code assistance - trying Geany
* sudo apt-get install geany
