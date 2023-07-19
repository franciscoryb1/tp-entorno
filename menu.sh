#!/usr/bin/bash
PS3="Eliga la opcion: "

select opt in "Generar imagenes" "Descomprimir imagenes" "Procesar imagenes" "Comprimir imagenes" "Salir" 
do

	case $opt in
			"Generar imagenes")
				read -p "ingrese el numero de imagenes a generar: " numero
				bash generar.sh $numero
				;;

			"Descomprimir imagenes")

				bash descomprimir.sh "imagenes.zip" "suma_verificacion"
				;;
			"Procesar imagenes")

				bash procesar.sh
				;;
			"Comprimir imagenes")

        			bash comprimir.sh "procesadas"
				;;
			"Salir")

				break
				;;
			*)
				echo "no corresponde al menu"
				;;
	esac

done
exit 0
