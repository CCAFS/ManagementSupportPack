<?php

$context = isset($_POST["context"]) ? $_POST["context"] : null;

if (!is_null($context)) {
    switch ($context) {
        case "user-info":
            getUserInfo();
            break;
        case "submit-user":
            createZip();
            break;
    }
}

function createZip(){
	 echo "Estoy aqui zipArchive";
   $filespath = isset($_POST["file"]) ? $_POST["file"] : null;
   $zipName = isset($_POST["zipName"]) ? $_POST["zipName"] : null;

	
	// Creamos un instancia de la clase ZipArchive
	 $zip = new ZipArchive();
	// Creamos y abrimos un archivo zip temporal
	 $zip->open("$zipName",ZipArchive::CREATE);
	 // Añadimos un directorio
	 $dir = 'zipFolder';
	 $zip->addEmptyDir($dir);

	 foreach($filesPath as $filepath){

	 // Añadimos un archivo en la raid del zip.
	 	$zip->addFile($filePath,$filePath);
	 }
	 //Añadimos un archivo dentro del directorio que hemos creado
	 //$zip->addFile("imagen2.jpg",$dir."/mi_imagen2.jpg");
	 // Una vez añadido los archivos deseados cerramos el zip.
	 $zip->close();
	 // Creamos las cabezeras que forzaran la descarga del archivo como archivo zip.
	 header("Content-type: application/octet-stream");
	 header("Content-disposition: attachment; filename=miarchivo.zip");
	 // leemos el archivo creado
	 readfile('$zipName');
	 // Por último eliminamos el archivo temporal creado
	 unlink('$zipName');//Destruye el archivo temporal
}




