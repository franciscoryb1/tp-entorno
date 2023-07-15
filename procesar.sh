#!/bin/bash

dir_entrada="./descargas/"
dir_salida="./procesadas"
if [ ! -d "$dir_salida" ]; then
	mkdir -p "$dir_salida"
fi
for file in "$dir_entrada"/*; do
  if [ -f "$file" ]; then
    nombre=$(basename "$file")
    convert "$file" -resize 512x512! "$dir_salida/$nombre"
    echo "Imagen redimensionada: $nombre"
  fi
done
