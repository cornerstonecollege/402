<?php

//header('Content-Type:application/json; charset=UTF-8');

/*$array = 
[
	['id' => 1, 'name' => 'Bulbasaur'],
	['id' => 2, 'name' => 'Ivysaur'],
	['id' => 3, 'name' => 'Venusaur'],
	['id' => 4, 'name' => 'Charmander'],
	['id' => 5, 'name' => 'Charmeleon'],
	['id' => 6, 'name' => 'Charizard'],
	['id' => 7, 'name' => 'Squirtle'],
	['id' => 8, 'name' => 'Wartortle'],
	['id' => 9, 'name' => 'Blastoise']
];

$json = json_encode($array);
echo $json;*/

$user = 'root';
$password = 'root';
$db = 'db_pokemon';
$host = 'localhost';
$port = 3306;

// Create connection
$conn = new mysqli($host, $user, $password, $db);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM tb_pokemon";
$result = $conn->query($sql);

$array = array();

while($row = $result->fetch_assoc()) 
{
	$array[] = $row;
}


echo json_encode($array);

$conn->close();

?>