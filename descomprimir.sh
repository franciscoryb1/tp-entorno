#!/usr/bin/bash

if [ "$#" -ne 2 ]; then 

	echo "No se proporcionarion dos archivos. Genere primero las imagenes"
	exit 1

fi 	

ZIP="$1" 
SUMA=$(<"$2")
SUMA_VERIF=$(md5sum "$ZIP")


if [[ "$SUMA" == "$SUMA_VERIF" ]]; then 

	echo "Las sumas coinciden" 
	exit 0

else 
	echo "Las sumas no coinciden" 
	exit 1

fi 		
