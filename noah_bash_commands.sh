#!/bin/bash

function cddev(){
	cd ~/code/github/

}

function jupy_instance(){
	cd ~/code/
	conda activate jupy
	jupyter lab --no-browser --ip 0.0.0.0
}

function jupy(){
	
	cd ~/code/
	conda activate jupy
	screen -dmS "jupy_screen" jupyter lab --no-browser --ip 0.0.0.0
	conda deactivate
	cd -;
};
