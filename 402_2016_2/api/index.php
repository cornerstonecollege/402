<?php
header('Content-Type:application/json; charset=UTF-8');

class Shape
{
	public $color;
	public $type;

	public function __construct($type, $color) {
		$this->color = $color;
		$this->type = $type;
	}
}

class ObjectModel
{
	public $name;
	public $shape;
}

$circle1 = new Shape("circle", "#FF0000");
$circle2 = new Shape("circle", "#008000");
$circle3 = new Shape("circle", "#00FFFF");
$circle4 = new Shape("circle", "#3498DB");
$circle5 = new Shape("circle", "#008080");

$square1 = new Shape("square", "#5D6D7E");
$square2 = new Shape("square", "#6E2C00");
$square3 = new Shape("square", "#EBDEF0");
$square4 = new Shape("square", "#FFA07A");
$square5 = new Shape("square", "#00FF00");

$triangle1 = new Shape("triangle", "#663399");
$triangle2 = new Shape("triangle", "#7B68EE");
$triangle3 = new Shape("triangle", "#87CEEB");
$triangle4 = new Shape("triangle", "#A0522D");
$triangle5 = new Shape("triangle", "#FAEBD7");

$star1 = new Shape("star", "#FFFF00");
$star2 = new Shape("star", "#FFE4E1");
$star3 = new Shape("star", "#000000");
$star4 = new Shape("star", "#0000FF");
$star5 = new Shape("star", "#800080");

$arr = array(array("name" => "Lonely Circle", "objects" => array($circle1)),
			 array("name" => "SpongeBob	SquarePants", "objects" => array($square1)),
			 array("name" => "Triple angle", "objects" => array($triangle1)),
			 array("name" => "Staryu", "objects" => array($star1)),
			 array("name" => "Set of Objects", "objects" => array($triangle2, $circle3, $star5)),
			 array("name" => "Set of Stars", "objects" => array($star1, $star2, $star3, $star4, $star5)),
			 array("name" => "Circles and Squares", "objects" => array($circle2, $circle3, $square2, $square3)),
			 array("name" => "A Triangle is half star", "objects" => array($triangle4, $star4, $star3))
);

echo json_encode($arr);

?>
