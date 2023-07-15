#!/usr/bin/bash

if [ $# -eq 0 ]; then
  echo "Error: debe especificar la cantidad de imágenes a generar como argumento."
  exit 1
fi

cantidad_imagenes=$1

DIR_DESTINO="./descargas"
if [ ! -d "$DIR_DESTINO" ]; then
  mkdir -p "$DIR_DESTINO"
fi

URL="https://source.unsplash.com/random/900%C3%97700/?person"


for ((i = 1; i <= cantidad_imagenes; i++)); do
	NOMBRE=$(shuf nombres.csv | grep '^[A-Z]' | head -n 1 | cut -d ' ' -f '1')
	wget $URL -O "./$DIR_DESTINO/$NOMBRE"
	sleep 1
done
exit 0
