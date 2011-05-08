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

# todo.sh: https://github.com/ginatrapani/todo.txt-cli
function t() {
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}


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

# ./vmconvert.doit?now=thankyou
alias rvmc="nohup rdesktop -xl -P -z -0 -g1024x600 -u Administrator vmconverter >/dev/null 2>&1 &"
