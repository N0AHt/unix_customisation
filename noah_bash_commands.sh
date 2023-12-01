#!/bin/bash

#custom functions for paninski lab server
# add these lines to .bashrc file to add this file to bash source!
	#noah custom commands
	#source ~/code/github/unix_customisation/noah_bash_commands.sh

#navigate to dev folder
function cddev(){
	cd ~/code/github/

}

#very lazy way to keep on top of git commits and pushes
function lazygit(){
#https://superuser.com/questions/186272/check-if-any-of-the-parameters-to-a-bash-script-match-a-string
	if [[ "$*" == *"-p"* ]] #this is bad, can find a -p anywhere, should use case switching...
		then
    		push="yes"
	else
    		push="no"
	fi


	git add .
	echo "git add . [adding all files in repo]"
#https://unix.stackexchange.com/questions/258512/how-to-remove-a-positional-parameter-from
	for arg do

  		shift
  		[ "$arg" = "-p" ] && continue
 		set -- "$@" "$arg"
	done

	if [ -z "$1" ] # Is parameter #1 zero length?
		then
		git commit -m "this lazy commit is from lazy git (automated message)"
		#echo "git commit -m 'this lazy commit is from lazy git (automated message)'"
	else
		git commit -m "$*"
		#echo "git commit -m '$*'"
	fi


	if [ "$push" = "yes" ]; #needs a space around brackets?? I hate bash
		then
		git push
	fi

}

alias lzg="lazygit -p"

#alias rm="rm -i"
alias jpk="jupy_kill"

function jupy_instance(){
	cd ~/code/
	conda activate jupy
	jupyter lab --no-browser --ip 0.0.0.0
}


#opens a detatched screen running a jupyter lab instance accessible to the internet in the correct directory and conda env
function jupy(){

	cd ~/code/;
	conda activate jupy
	screen -dmS "jupy_screen" jupyter lab --no-browser --ip=0.0.0.0 --port=8890 
	conda deactivate
	cd -;
	echo "jupyter lab running on screen 'jupy_screen'"
};

function jupy_kill(){
	#kill jupyter instance and close screen
	screen -S jupy_screen -X stuff $'\003'
	screen -S jupy_screen -X stuff $'\003'
	#https://stackoverflow.com/questions/16001578/sending-ctrl-c-to-specific-screen-session#:~:text=Screen's%20stuff%20command%20also%20supports,used%20to%20send%20CTRL%2DC%20.&text=screen%20%2DS%20session_name%20%2DX%20at%20%22%23%22%20stuff%20%24,quit%20works%20perfect%20for%20me.
	#need to send command twice to confirm killing kernel, cont figure out how to do on one line :/
	echo "Jupyter instance shut down, screen killed"
}
