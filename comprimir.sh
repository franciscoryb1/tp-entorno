#!/usr/bin/bash

if [ "$#" != 1 ]; then 
	echo "Error: Debe propocionarse un archivo para comprimir."
	exit 1
fi

if [ -e "$1" ]; then
	ls "$1" > nombres
	ls "$1" | grep -oE '^[A-Z][a-z]+$' > nombres_validos
	ls "$1" | grep -c '^[A-Z][a-z]*a$'> nombres_finalizados_con_a
else
    echo "Error: No hay archivos para comprimir."
exit 1
fi

mv nombres "$1"
mv nombres_validos "$1"
mv nombres_finalizados_con_a "$1"
cd resultado && rm *
cd "../$1/"
zip -r ../resultado/imagenes_redim.zip *
cd ../resultado/
md5sum salida.zip | cut -d ' ' -f '1'>suma_verificacion_redim
cd ..
rm -r "$1"
echo "Se comprimieron las imagenes."
exit 0



