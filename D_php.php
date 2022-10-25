<?php

$path = $_GET['path'];

$servername = "localhost";
$username = "repuffsite";
$password = "A951966000a";
$dbname = "repuffsite";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);


$sql = $path;
$result = mysqli_query($conn, $sql);


if($result){
    echo "don";
}else{
    echo 'not Don';
}



?>