<?php

/*header('Content-Type:application/json; charset=UTF-8');

$user = 'root';
$password = 'root';
$db = 'db_cornerstone';
$host = 'localhost';
$port = 3306;

// Create connection
$conn = new mysqli($host, $user, $password, $db);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM tb_user";
$result = $conn->query($sql);

$array = array();

while($row = $result->fetch_assoc()) 
{
	$array[] = $row;
}


echo json_encode($array);

$conn->close();*/

/*$user = 'root';
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

$conn->close();*/

header('Content-Type:application/json; charset=UTF-8');
$method = $_SERVER['REQUEST_METHOD'];

$user = 'root';
$password = 'root';
$db = 'db_cornerstone';
$host = 'localhost';
$port = 3306;

// Create connection
$conn = new mysqli($host, $user, $password, $db);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($method == 'PUT') // Create
{
	echo $method;
}
else if ($method == 'GET') // Read 
{
	$sql = "SELECT * FROM tb_user";
	$result = $conn->query($sql);
	$array = array();
	while($row = $result->fetch_assoc()) 
	{
		$array[] = $row;
	}
	echo json_encode($array);
}
else if ($method == 'PATCH') // Update 
{
	echo $method;
}
elseif ($method == 'DELETE') // Delete 
{
	$id = @$_SERVER["HTTP_ID"];
	if ($id)
	{
		$sql = "DELETE FROM `tb_user` WHERE id = ".$id;
		$result = $conn->query($sql);
		if ($conn->affected_rows > 0)
		{
			$status = array('status' => 'Success');
			echo json_encode($status);
		}
		else
		{
			$status = array('status' => 'Impossible to delete user');
			echo json_encode($status);
		}
	}
	else
	{
		$error = array('error' => 'Please pass an \'ID\' parameter');
		echo json_encode($error);
	}
}
else
{
	$error = array('error' => 'Method ' .$method. ' not found');
	echo json_encode($error);
}

$conn->close();

?>
