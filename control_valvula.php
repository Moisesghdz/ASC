<?php
session_start();
if (!isset($_SESSION['usuario_id'])) {
    header("Location: login.html");
    exit();
}

$id = $_SESSION['usuario_id'];

include "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['nivel'])) {
        $nivel = intval($_POST['nivel']); // Convertir el nivel a entero

        // Determinar la descripción del nivel
        $nivelDescripcion = "";
        if ($nivel == 255) {
            $nivelDescripcion = "Alto";
        } elseif ($nivel == 128) {
            $nivelDescripcion = "Medio";
        } elseif ($nivel == 64) {
            $nivelDescripcion = "Bajo";
        } else {
            $nivelDescripcion = "Desconocido";
        }

        // Verificar si el usuario existe en la tabla
        $sql_check = "SELECT id FROM nivel_control WHERE id = $id";
        $result_check = $conn->query($sql_check);
        
        if ($result_check->num_rows > 0) {
            // Actualizar el nivel en la base de datos
            $sql = "UPDATE nivel_control SET nivel = '$nivel' WHERE id = $id";
            if ($conn->query($sql) === TRUE) {
                echo "Nivel de control cambiado a: " . $nivelDescripcion;
            } else {
                echo "Error al actualizar el nivel: " . $conn->error;
            }
        } else {
            // Insertar un nuevo registro en la base de datos
            $sql = "INSERT INTO nivel_control (id, nivel) VALUES ($id, '$nivel')";
            if ($conn->query($sql) === TRUE) {
                echo "Nivel de control establecido a: " . $nivelDescripcion;
            } else {
                echo "Error al insertar el nivel: " . $conn->error;
            }
        }
    } else {
        echo "No se ha recibido el nivel de control";
    }
} else {
    echo "Método no permitido";
}

$conn->close();
?>
