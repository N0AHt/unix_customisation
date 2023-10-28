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

	TO_PUSH="1"
	

	if [[ "$*" == *"-p"* ]]
		then
    		echo "YES"
	else
    		echo "NO"
	fi


	git add .
	echo "git add . [adding all files in repo]"

	for arg do
		if ["$arg" -eq "-p"]
			then
			TO_PUSH="1"
		fi

  		shift
  		[ "$arg" = "-p" ] && continue
 		set -- "$@" "$arg"
	done

	if [ -z "$1" ] # Is parameter #1 zero length?
		then
		git commit -m "this is a lazy commit (automated -m)"
		echo "git commit -m 'this is a lazy commit (automated -m)'"
	else
		git commit -m "$*"
		echo "git commit -m '$*'"
	fi

	echo "$TO_PUSH"

	if ["$TO_PUSH" -eq "p"]
		then
		git push
	fi

}

#alias lzg = "lazygit()"


function jupy_instance(){
	cd ~/code/
	conda activate jupy
	jupyter lab --no-browser --ip 0.0.0.0
}


#opens a detatched screen running a hupyter lab instance accessible to the internet in the correct directory and conda env 
function jupy(){
	
	cd ~/code/;
	conda activate jupy
	screen -dmS "jupy_screen" jupyter lab --no-browser --ip 0.0.0.0
	conda deactivate
	cd -;
};
