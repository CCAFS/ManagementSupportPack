<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
//$app = new \Slim\App;

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
            //->withHeader('Content-Type', 'application/json');
});
$app->POST("/api/zipfile", function(Request $request, Response $response){
  	$files = array();
 
  //$guidelines=json_decode($_POST['files']);


	$files = $_POST['files'];
	$destination = $_POST['destination'];
	$overwrite = $_POST['overwrite'];
	
	//zipFiles($params['files'], $params['destination'], $params['overwrite']);
	zipFiles($files, $destination, $overwrite);
	
});
/*
$test = $request -> getParseBody()['destination'];
	echo $test;

$app->GET("/api/zipfile", function(Request $request, Response $response){
	echo "im here POST";
	$params = $request.getParsedBody();
	zipFiles($params['files'], $params['destination'], $params['overwrite']);
});
*/
//function zipFiles($files = array(),$destination = '',$overwrite = false) {
	function zipFiles($files = array(),$destination,$overwrite) {

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

		if($zip->open($destination,$overwrite ? ZIPARCHIVE::OVERWRITE : ZIPARCHIVE::CREATE) !== true) {
			return false;
		}
		//add the files

		foreach($valid_files as $file) {
			echo $file;
			$zip->addFile($file,$file);
		}
	
		//debug
		echo 'The zip archive contains ',$zip->numFiles,' files with a status of ',$zip->status;
		
		//close the zip -- done!
		$zip->close();
		
		//check to make sure the file exists
		return file_exists($destination);
	}
	else
	{
		return false;
	}
}

