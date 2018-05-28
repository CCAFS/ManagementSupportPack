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


// Get All persons
$app->get('/api/persons', function(Request $request, Response $response){
    $sql = "SELECT * FROM msp_person";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->query($sql);
        $person = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($person);
    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});

// Get Single person by id
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

// Get Single person by email
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

//add person
$app->post('/api/person/add', function(Request $request, Response $response){
    echo "Estoy aqui";
    $first_name = $request->getParam('first_name');
    $last_name = $request->getParam('last_name');
    $email = $request->getParam('email');
    $registered = strlen(new DateTime());
    $sql = "INSERT INTO msp_person (first_name,last_name,registered,email) VALUES
    (:first_name,:last_name,:registered,:email)";

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






