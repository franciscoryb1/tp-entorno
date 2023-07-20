#!/usr/bin/bash

if [ "$#" != 2 ]; then 
	echo "Error: Debe propocionarse el archivo comprimido y un archivo con la suma de verificacion."
	exit 1
fi 	


if [[ -e "$1" && -e "$2" ]]; then
    ZIP="$1" 
    SUMA=$(<"$2")
    SUMA_VERIF=$(md5sum "$ZIP" | cut -d ' ' -f '1')
else
    echo "Error: Primero debe generar las imagenes."
    exit 1
fi


if [[ "$SUMA" == "$SUMA_VERIF" ]]; then 

	unzip $ZIP -d imagenes
	rm ./"$ZIP"
	rm ./"$2"
    echo "¡Descomprimido con exito!"
	exit 0
	
else 
	echo "Las sumas de verificacion no coinciden."
	exit 1
fi	
