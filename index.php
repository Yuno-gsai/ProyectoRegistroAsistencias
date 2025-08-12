<?php
require_once 'DataBase/DatabaseConnection.php';

try{
    $db = new DatabaseConnection();
    $conn = $db->getConnection();
    if($conn){
        echo "Conectado a la base de datos";
    }
}
catch(Exception $e){
    echo "Error: " . $e->getMessage();
}
?>
