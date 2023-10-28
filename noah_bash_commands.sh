#!/bin/bash

#custom functions for paninski lab server

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
