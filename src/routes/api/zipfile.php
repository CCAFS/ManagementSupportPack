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
	try {
		zipFiles($files, $overwrite);
	} catch (Exception $e) {
		echo 'Exception: ',  $e->getMessage(), "\n";
	}
});

$app->GET("/api/zipfile/deleteFile", function(Request $request, Response $response){
	try {
		unlink($_GET['file']);
	} catch (Exception $e) {
		echo 'Excepción capturada: ',  $e->getMessage(), "\n";
	}
});


/*******************  Functions *************************************/

function zipFiles($files = array(), $overwrite = true) {
	$date = date("Ymd").date("_His");
	$zipName = 'export/guidelinesDocuments_'.$date.'.zip';

	$carpeta = 'export';
	if (!file_exists($carpeta)) {
    	mkdir($carpeta, 0777, true);
	}

	//vars
	$valid_files = array();
	// If files were passed in...
	if(is_array($files)) {
		//cycle through each file
		foreach($files as $file) {
			//make sure the file exists
			//if(file_exists($file)) {
			$valid_files[] = $file;
			//}
		}
	}
	// If we have good files...
	if(count($valid_files)) {
		//create the archive
		$zip = new ZipArchive();
		//if($zip->open($destination,$overwrite ? ZIPARCHIVE::OVERWRITE : ZIPARCHIVE::CREATE) !== true) {
		if($zip->open($zipName, ZIPARCHIVE::CREATE)!==true) {
			return false;
		}

		for($i=0;$i<count($valid_files); $i++){
			$localfile = basename($valid_files[$i]);
			$zip->addFile("$valid_files[$i]", $localfile);
		}
		$zip->close();

		echo $zipName;

	}else{
		return false;
	}
}
