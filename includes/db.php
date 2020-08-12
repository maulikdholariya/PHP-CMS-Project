<?php ob_start();
$db_host = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "cms";

$connection = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if (!$connection) {
    die("connection Failed");
} 
?>