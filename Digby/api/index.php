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
$db = 'db_Pokemon';
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
	$name = @$_SERVER["HTTP_PKM_NAME"]; 
	$id = @$_SERVER["HTTP_PKM_NUM"];
	if ($id && $name)
	{
		$sql = "INSERT INTO `tb_pokemon`(`pkm_num`, `name`) VALUES (".$id.", '".$name."')";
		$result = $conn->query($sql);
		if ($conn->affected_rows > 0)
		{
			$status = array('status' => 'Success');
			echo json_encode($status);
		}
		else
		{
			$status = array('status' => 'Impossible to create pokemon');
			echo json_encode($status);
		}
	}
	else
	{
		$error = array('error' => 'Please pass an \'ID\' parameter');
		echo json_encode($error);
	}
}
else if ($method == 'GET') // Read 
{
	$sql = "SELECT * FROM tb_pokemon";
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
	$name = @$_SERVER["HTTP_PKM_NAME"]; 
	$id = @$_SERVER["HTTP_PKM_NUM"];
	if ($id && $name)
	{
		$sql = "UPDATE `tb_pokemon` SET `pkm_num`=".$id.",`name`='".$name."' WHERE `pkm_num`=".$id;
		$result = $conn->query($sql);
		if ($conn->affected_rows > 0)
		{
			$status = array('status' => 'Success');
			echo json_encode($status);
		}
		else
		{
			$status = array('status' => 'Impossible to update pokemon');
			echo json_encode($status);
		}
	}
	else
	{
		$error = array('error' => 'Please pass an \'ID\' parameter and \'name\'');
		echo json_encode($error);
	}
}
elseif ($method == 'DELETE') // Delete 
{
	$id = @$_SERVER["HTTP_PKM_NUM"];
	if ($id)
	{
		$sql = "DELETE FROM `tb_pokemon` WHERE pkm_num = ".$id;
		$result = $conn->query($sql);
		if ($conn->affected_rows > 0)
		{
			$status = array('status' => 'Success');
			echo json_encode($status);
		}
		else
		{
			$status = array('status' => 'Impossible to delete pokemon');
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
