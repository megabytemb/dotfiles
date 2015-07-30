alias dotmate='mate $ZSH'
alias dotcd='cd $ZSH'

alias dotupdate='cd $ZSH && git pull origin master && ./bootstrap && cd -'

alias tetris='emacs -q --no-splash -f tetris'

alias ping='ping -c 5' 

alias reload!='. ~/.zshrc'

if [[ $platform == 'osx' ]]; then
	export PATH="$PATH":~/Code/depot_tools
	export GYP_GENERATORS=ninja
	# This shows remaining/total build files.
	export NINJA_STATUS="[%u/%t] "

	alias make_chromium="cd ~/Code/chromium/;time caffeinate ninja -C src/out/Release chrome"
	alias go_chromium="~/Code/chromium/src/out/Release/Chromium.app/Contents/MacOS/Chromium --no-default-browser-check --disable-hang-monitor"
	alias tests="time caffeinate ninja -C ~/Code/chromium/src/out/Release unit_tests browser_tests"
fi

alias megabot-status='ssh -L 8080:127.0.0.1:9001 server.megabytemb.com -N -f && open http://127.0.0.1:8080' 