#!/usr/bin/bash



if [ -e "$1" ]; then
	ls "$1" > nombres
	ls "$1" | grep -oE '^[A-Z][a-z]+$' > nombres_validos
	ls "$1" | grep -c '^[A-Z][a-z]*a$'> nombres_finalizados_con_a
else
    	echo "Error: No existe la carpeta."
	./menu.sh
	exit 1
fi

mv nombres "$1"
mv nombres_validos "$1"
mv nombres_finalizados_con_a "$1"
cd "$1"

zip -r ../salida.zip *
cd ..

md5sum salida.zip | cut -d ' ' -f '1'>suma_verificacion_salida
rm -r "$1"
echo "Se comprimieron las imagenes."
./menu.sh
exit 0
