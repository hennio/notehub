#!/bin/bash

if [ -z $1 ] 
then
		echo "Missing parameters (notes or journal)"
fi


case $1 in
		journal )
		echo 'Journal selected';;
		notes ) 
		echo 'Notes selected';;
		-h )
		echo 'Help: ';;
esac
