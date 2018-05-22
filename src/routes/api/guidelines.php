<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

//$app = new \Slim\App;

$app->options('/{routes:.+}', function ($request, $response, $args) {
    return $response;
});

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
    ->withHeader('Access-Control-Allow-Origin', '*')
    ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
    ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
            //->withHeader('Content-Type', 'application/json');
});

// Get All Customers
$app->get('/api/guidelinesLevels/{role}/{stage}/{category}', function(Request $request, Response $response){
    $r = $request->getAttribute('role');
    $s= $request->getAttribute('stage');
    $c= $request->getAttribute('category');
    $sql = "SELECT g.id,g.code,g.name,g.type,g.source, il.importance_level
    FROM msp_importance_levels il
    INNER JOIN msp_categories c ON il.category_id = c.id
    INNER JOIN msp_stages s ON il.stage_id = s.id
    INNER JOIN msp_roles r ON il.role_id = r.id
    INNER JOIN msp_guidelines g ON il.guideline_id = g.id
    WHERE il.role_id = ".$r." and il.stage_id= ".$s." and il.category_id=".$c."
    ORDER BY g.code";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->query($sql);
        $customers = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($customers);
    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});

$app->post("/api/guidelinesLevels/download", function(Request $request, Response $response){
  
    //return "{'item':'value'}";
    $params = $request->getParsedBody();
    zipFiles($params['files'], $params['destination'], $params['overwrite']);

});

$app->get("/api/guidelinesLevels/download", function(Request $request, Response $response){
    echo "im here POST";
    
    return "{'item':'value'}";

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
            if(file_exists($file)) {
                $valid_files[] = $file;
            }
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
            $zip->addFile($file,$file);
        }
        //debug
        //echo 'The zip archive contains ',$zip->numFiles,' files with a status of ',$zip->status;
        
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


// Get Single person
$app->get('/api/personId/{id}', function(Request $request, Response $response){
    $id = $request->getAttribute('id');

    $sql = "SELECT * FROM msp_person WHERE id = $id";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->query($sql);
        $person = $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($person);
    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});

// Get Single person
$app->get('/api/personMail/{email}', function(Request $request, Response $response){
    $id = $request->getAttribute('mail');

    $sql = "SELECT * FROM msp_person WHERE email = $email";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->query($sql);
        $person = $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($person);
    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});

// Add person
$app->post('/api/person/add', function(Request $request, Response $response){
    $first_name = $request->getParam('first_name');
    $last_name = $request->getParam('last_name');
    $phone = $request->getParam('phone');
    $email = $request->getParam('email');
    $address = $request->getParam('address');
    $city = $request->getParam('city');
    $state = $request->getParam('state');

    $sql = "INSERT INTO customers (first_name,last_name,phone,email,address,city,state) VALUES
    (:first_name,:last_name,:phone,:email,:address,:city,:state)";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->prepare($sql);

        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name',  $last_name);
        $stmt->bindParam(':registered', $registered);
        $stmt->bindParam(':email',      $email);
     

        $stmt->execute();

        echo '{"notice": {"text": "Person Added"}';

    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});
