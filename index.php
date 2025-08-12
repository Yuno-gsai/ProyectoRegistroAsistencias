<?php
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
<h1>hola mundo</h1>