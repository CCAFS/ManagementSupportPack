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
	$destination = $_POST['destination'];
	$overwrite = $_POST['overwrite'];
	
	zipFiles($files, $destination, $overwrite);
	
});

function zipFiles($files = array(),$destination = '',$overwrite = false) {

	
	//if the zip file already exists and overwrite is false, return false
	if(file_exists($destination) && !$overwrite) { return false; }
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
		if($zip->open($destination, ZIPARCHIVE::CREATE)!==true) {
			
			return false;
		}


		for($i=0;$i<count($valid_files); $i++){
			
			$localfile = basename($valid_files[$i]);
			$zip->addFile("$valid_files[$i]", $localfile);
		}
		
		$zip->close();

		//Download zip file 
		header('Content-type: application/zip');
		header('Content-Disposition: attachment; filename="'.($destination).'"');
		header("Content-length: " . filesize($destination));
		header("Pragma: no-cache");
		header("Expires: 0");

		ob_clean();
		flush();

		readfile($destination);

		exit;
		
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



