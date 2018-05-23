<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Render Twig template in route
$app->get('/', function ($request, $response, $args) {


  $regions = array();
  $regions[] = array('value' => 'africa', 'name' => 'Africa');
  $regions[] = array('value' => 'asia',   'name' => 'Asia');
  $regions[] = array('value' => 'oceania', 'name' => 'Australia and Oceania');
  $regions[] = array('value' => 'central_america_caribbean', 'name' => 'Central America and the Caribbean');
  $regions[] = array('value' => 'middle_east_north_africa', 'name' => 'Middle East and North Africa');
  $regions[] = array('value' => 'north_america', 'name' => 'North America');
  $regions[] = array('value' => 'south_america', 'name' => 'South America');
  $regions[] = array('value' => 'europe', 'name' => 'Europe');

  $roles = array();
  $stages = array();
  $categories = array();
  try{
      // Get DB Object
      $db = new db();
      // Connect
      $db = $db->connect();

      // Get Roles
      $stmt = $db->query("SELECT * FROM msp_roles");
      $roles = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Stages
      $stmt = $db->query("SELECT * FROM msp_stages");
      $stages = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Categories
      $stmt = $db->query("SELECT * FROM msp_categories");
      $categories = $stmt->fetchAll(PDO::FETCH_OBJ);

      $db = null;
  } catch(PDOException $e){
      echo '{"error": {"text": '.$e->getMessage().'}';
  }

  return $this->view->render($response, 'index.html', [
    'title' => "",
    'roles' => $roles,
    'stages' => $stages,
    'categories' => $categories,
    'regions' => $regions,
  ]);
})->setName('index');


// Render Twig template in route
$app->get('/guidelines', function ($request, $response, $args) {
  $guidelines = array();
  $roles = array();
  $stages = array();
  $categories = array();
  try{
      // Get DB Object
      $db = new db();
      // Connect
      $db = $db->connect();

      // Get Roles
      $stmt = $db->query("SELECT * FROM msp_roles");
      $roles = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Stages
      $stmt = $db->query("SELECT * FROM msp_stages");
      $stages = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Categories
      $stmt = $db->query("SELECT * FROM msp_categories");
      $categories = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Guidelines
      $stmt = $db->query("SELECT * FROM msp_guidelines ORDER BY code");
      $guidelines = $stmt->fetchAll(PDO::FETCH_OBJ);

      $db = null;
  } catch(PDOException $e){
      echo '{"error": {"text": '.$e->getMessage().'}';
  }
  return $this->view->render($response, 'guidelines.html', [
    'guidelines' => $guidelines,
    'roles' => $roles,
    'stages' => $stages,
    'categories' => $categories
  ]);
})->setName('guidelines');
