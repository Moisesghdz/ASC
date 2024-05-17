<?php

include "conexion.php";

// Obtener usuario_id de la solicitud GET
$usuario_id = $_GET['usuario_id'];

// Obtener datos de la tabla consumo
$sql = "SELECT flujo, fecha FROM consumo WHERE usuario_id = '$usuario_id' ORDER BY fecha DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode($row);
} else {
    echo json_encode(["flujo" => 0, "fecha" => ""]);
}

$conn->close();
?>


