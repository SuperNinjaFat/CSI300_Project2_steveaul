<?php
/**
 * Created by PhpStorm.
 * User: super
 * Date: 4/23/2018
 * Time: 4:34 PM
 */

$settings = array(
    "sql" => array(
        "host" => "",
        "username" => "",
        "password" => "",
        "database" => ""
    )
);
//Convert into the the setting above
include mysqli;
$user = 'SuperNinjaFat';
$password = 'root';
$db = 'inventory';
$host = 'localhost';
$port = 3306;

$link = mysqli_init();
$success = mysqli_real_connect(
    $link,
    $host,
    $user,
    $password,
    $db,
    $port
);

$sql_connection = mysqli_connect(
    $settings['sql']['host'],
    $settings['sql']['username'],
    $settings['sql']['password'],
    $settings['sql']['database']
)

?>