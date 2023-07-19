#!/usr/bin/bash
PS3="Eliga la opcion: "

select opt in "generar imagenes" "descomprimir imagenes" "procesar imagenes" "comprimir imagenes" "salir" 
do

	case $opt in
			"generar imagenes")
				read -p "ingrese el numero de imagenes a generar: " numero
				bash generar.sh $numero
				;;

			"descomprimir imagenes")
				read -p "Ingrese los archivos: " num
				bash descomprimir.sh $num
				;;
			"procesar imagenes")

				bash procesar.sh
				;;
			"comprimir imagenes")

        			bash comprimir.sh
				;;
			"salir")

				break
				;;
			*)
				echo "no corresponde al menu"
				;;
	esac

done
exit 0
