#!/usr/bin/bash

dir_entrada="./imagenes/"
if [ ! -d "$dir_entrada" ]; then
	echo Error: No hay imagenes para procesar, primero debe generarlas y descomprimirlas.
    exit 1
fi
echo "Procesando sus imagenes"
mkdir -p procesadas
dir_salida="./procesadas/"
cd $dir_entrada
for FILE in *; do
    if [[ "$FILE" =~ ^[A-Z][a-z]+$ ]]; then
        convert "$FILE" -gravity center -resize 512x512+0+0 \-extent 512x512 "../$dir_salida/$FILE"
        echo "Imagen redimensionada: $FILE"
    fi
done
cd ../
rm -r imagenes
echo "Listo! Sus imagenes han sido redimensionadas."
exit 0




