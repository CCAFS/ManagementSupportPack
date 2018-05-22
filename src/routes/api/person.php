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





