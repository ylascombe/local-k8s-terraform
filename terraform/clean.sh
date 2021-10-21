#!/bin/bash

kind delete cluster --name demo
for f in $(ls)
do 
	if [ -d "$f" ];
	then
		echo "Cleaning $f..."
		cd $f
		rm -fr .terraform terraform.tfstate
		cd ..
	fi
done
