#!/usr/bin/bash

if [ $# -eq 0 ]; then
  echo "Error: debe especificar la cantidad de imágenes a generar como argumento."
  exit 1
fi
echo "Generando sus imagenes..."
cantidad_imagenes=$1

DIR_DESTINO="./imagenes"
if [ ! -d "$DIR_DESTINO" ]; then
  mkdir -p "$DIR_DESTINO"
  
fi

URL="https://thispersondoesnotexist.com/"

cd $DIR_DESTINO
for ((i = 1; i <= cantidad_imagenes; i++)); do
	NOMBRE=$(sort -R ../nombres.csv | grep '^[A-Z]' | head -n 1 | cut -d ' ' -f '1' | cut -d "," -f "1")
	wget $URL -O "./$NOMBRE"
	sleep 1
done

zip -r ../imagenes.zip *
cd ../
echo $(md5sum imagenes.zip | cut -d ' ' -f '1')>suma_verificacion
rm -r imagenes
echo "Imagenes generadas con exito!"
exit 0
