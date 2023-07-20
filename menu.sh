#!/bin/bash


while true; do
    echo "Selecciona una opción:"
    select opt in Generar Descomprimir Procesar Comprimir Salir; do
        case $opt in
            Generar)
                read -p "Ingrese la cantidad de imagenes a generar: " cantidad
                bash generar.sh $cantidad
                break
                ;;
            Descomprimir)
                bash descomprimir.sh "imagenes.zip" "suma_verificacion"
                break
                ;;
            Procesar)
                bash procesar.sh
                break
                ;;
            Comprimir)
                bash comprimir.sh "procesadas"
                break
                ;;
            Salir)
            	cd resultado && rm gitkeep
                echo Hasta luego!
                exit 0
                ;;
            *)
                echo "Opcion no valida."
                ;;
        esac
    done
done
