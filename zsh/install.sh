if test ! $(which zsh)
then
	echo "Installing zsh"
	if [ "$(uname -s)" == "Darwin" ]
	then
		brew install zsh
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		sudo apt-get install zsh
	fi
fi

chsh -s /bin/zsh

exit 0