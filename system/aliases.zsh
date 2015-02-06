# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi


# implement pbcopy/pbpaste on linux - http://jetpackweb.com/blog/2009/09/23/pbcopy-in-ubuntu-command-line-clipboard/
if [ `uname` = "Linux" ]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# implement open(osx) start(win) cli functionality
if [ `uname` = "Linux" ]; then
    alias ]='gnome-open'
fi

# dispatch snakes via the airlock
function s() { 
    if [ $# -eq 0 ]; then
      python -m SimpleHTTPServer 8000 || python -m SimpleHTTPServer 8001
    else
      python -m SimpleHTTPServer $*
    fi
}

# rip cd
alias ripcd="abcde -a cddb,read,encode,tag,move,playlist,clean -d /dev/cdrom -o m4a -V -x"

# youtube-dl
alias youtube='youtube-dl  -o "%(title)s-%(id)s.%(ext)s" $*'