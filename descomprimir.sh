#!/usr/bin/bash

if [ "$#" != 2 ]; then 
	echo "Error: Deben propocionarse el archivo comprimido y un archivo con la suma de verificacion."
	exit 1
fi 	


if [[ -e "$1" && -e "$2" ]]; then
    ZIP="$1" 
    SUMA=$(<"$2")
    SUMA_VERIF=$(md5sum "$ZIP" | cut -d ' ' -f '1')
else
    echo "Error: Alguno de los archivos pasados no existe."
    exit 1
fi


if [[ "$SUMA" == "$SUMA_VERIF" ]]; then 

	unzip $ZIP -d imagenes
	rm ./"$ZIP"
	rm ./"$2"
	#./menu.sh
    echo "¡Descomprimido con exito!"
	exit 0
	
else 
	echo "Las sumas de verificacion no coinciden"
	#./menu.sh
	exit 1
fi	
