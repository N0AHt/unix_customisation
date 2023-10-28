#!/bin/bash

#custom functions for paninski lab server
# add these lines to .bashrc file to add this file to bash source!
	#noah custom commands
	#source ~/code/github/unix_customisation/noah_bash_commands.sh

#navigate to dev folder
function cddev(){
	cd ~/code/github/

}

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
