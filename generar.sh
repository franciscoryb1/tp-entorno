#!/bin/bash

if [ $# -eq 0 ]; then
 	 echo "Error: debe especificar la cantidad de imágenes a generar como argumento."
 	 exit 1
fi
cantidad_imagenes=$1
directorio_destino="./descargas"
if [ ! -d "$directorio_destino" ]; then
 	 mkdir -p "$directorio_destino"
fi

for ((i = 1; i <= cantidad_imagenes; i++)); do
  	nombre_archivo="imagen_$i.jpg"
	url="https://source.unsplash.com/random/900%C3%97700/?person"
	redirect_url=$(curl -s -o /dev/null -w "%{redirect_url}" "$url")
	curl -o "$directorio_destino/$nombre_archivo" "$redirect_url"
	echo "Imagen descargada: $nombre_archivo"
  	sleep 1
done

