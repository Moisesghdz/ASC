<?php

session_start();
if (!isset($_SESSION['usuario_id'])) {
    header("Location: login.html");
    exit();
}

$usuario_id = $_SESSION['usuario_id'];

include "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener datos de la solicitud POST
    $flujo = $_POST['flujo'];
    $usuario_id = $_SESSION['usuario_id'];
    // Insertar datos en la tabla consumo
    $sql = "INSERT INTO consumo (flujo, usuario_id) VALUES ('$flujo', '$usuario_id')";

    if ($conn->query($sql) === TRUE) {
        echo "Nuevo registro creado exitosamente";
    } else {
        echo "Error al insertar registro: " . $conn->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    // Obtener el usuario_id de la solicitud GET
    $usuario_id = $_GET['usuario_id'];

    // Seleccionar el último registro de flujo de agua para el usuario
    $sql = "SELECT flujo, fecha FROM consumo WHERE usuario_id = '$usuario_id' ORDER BY fecha DESC LIMIT 1";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $data = array(
            "flujo" => $row['flujo'],
            "fecha" => $row['fecha']
        );
        echo json_encode($data);
    } else {
        echo json_encode(array("flujo" => "No hay datos", "fecha" => ""));
    }
}

$conn->close();
?>
