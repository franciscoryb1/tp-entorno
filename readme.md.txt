
Dentro de la carpeta "resultado" dejamos un archivo llamado "gitkeep" con el proposito de poder subir la carpeta a github y que no esté vacia porque sino github no la sube. Al correr el programa este archivo se elimina y queda unicamente el resultado esperado.
Una vez aclarado eso, para correr el programa es muy sencillo:

Una vez clonado el repositorio en una carpeta de su computadora:


    1   Abra una terminal en esa misma carpeta haciendo click derecho en un espacio en blanco y click izquierdo en "Abrir en una terminal".
    
    2   Utilizando el siguiente comando se creara la imagen de Docker:
             sudo docker build -t tp_entornos .
             
    3 	Utilice el siguiente comando en la terminal para desplegar el contenedor:
             sudo docker run -it -v "$(pwd)/resultado":/home/programa/resultado tp_entornos
	Esto correra el contenedor de forma interactiva y con volumenes.
	
    4 	La salida del programa la podra encontrar dentro de la carpeta "resultado".
    
    5	Si quiere volver a correr el programa, ejecute nuevamente el comando del paso 3.
    
    6 	Listo!!
    
