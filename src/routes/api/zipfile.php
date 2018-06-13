<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


$app->add(function ($req, $res, $next) {
	$response = $next($req, $res);
	return $response
	->withHeader('Access-Control-Allow-Origin', '*')
	->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
	->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

$app->POST("/api/zipfile", function(Request $request, Response $response){
	$files = array();

	$files = $_POST['files'];
	$overwrite = $_POST['overwrite'];

<<<<<<< HEAD
	zipFiles($files, $overwrite);

});

$app->POST("/api/zipfile/getName", function(Request $request, Response $response){
	$files = array();

	$files = $_POST['files'];
	$overwrite = $_POST['overwrite'];
	
	zipFiles($files, $overwrite);
});


function zipFiles($files = array(), $overwrite = true) {
	$date = date("Ymd").date("h-i-s");
	$zipName = 'export/guidelinesDocuments'.$date.'.zip';

	$carpeta = 'export';
	if (!file_exists($carpeta)) {
    	mkdir($carpeta, 0777, true);
	}

=======
	zipFiles($files, $destination, $overwrite);

});

function zipFiles($files = array(),$destination = '',$overwrite = true) {


>>>>>>> 62c6f3bd03f052eeae27f7d395ba2c222af17252
	//if the zip file already exists and overwrite is false, return false
	if(file_exists($zipName) && !$overwrite) { return false; }
	//vars
	$valid_files = array();
	//if files were passed in...
	if(is_array($files)) {
		//cycle through each file
		foreach($files as $file) {
			//make sure the file exists

			//if(file_exists($file)) {
			$valid_files[] = $file;
			//}
		}
	}
	//if we have good files...
	if(count($valid_files)) {

		//create the archive
		$zip = new ZipArchive();

		//if($zip->open($destination,$overwrite ? ZIPARCHIVE::OVERWRITE : ZIPARCHIVE::CREATE) !== true) {
<<<<<<< HEAD
		if($zip->open($zipName, ZIPARCHIVE::CREATE)!==true) {
			
=======
		if($zip->open($destination, ZIPARCHIVE::CREATE)!==true) {

>>>>>>> 62c6f3bd03f052eeae27f7d395ba2c222af17252
			return false;
		}


		for($i=0;$i<count($valid_files); $i++){

			$localfile = basename($valid_files[$i]);
			$zip->addFile("$valid_files[$i]", $localfile);
		}

		$zip->close();

<<<<<<< HEAD
		//Download zip file 
		/*
=======
		//Download zip file
>>>>>>> 62c6f3bd03f052eeae27f7d395ba2c222af17252
		header('Content-type: application/zip');
		header('Content-Disposition: attachment; filename="'.($zipName).'"');
		header("Content-length: " . filesize($zipName));
		header("Pragma: no-cache");
		header("Expires: 0");
*/

		//ob_clean();
		//flush();
		echo $zipName;
		//readfile($zipName);
		//return $zipName;

<<<<<<< HEAD
		//exit;		
=======
		exit;

>>>>>>> 62c6f3bd03f052eeae27f7d395ba2c222af17252
	}
	else
	{
		return false;
	}
}

$app->GET("/api/zipfile/deleteFile", function(Request $request, Response $response){
	try {
		unlink($_GET['file']);
	} catch (Exception $e) {
		echo 'Excepción capturada: ',  $e->getMessage(), "\n";
	}

});
