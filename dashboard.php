<?php
session_start();
if (!isset($_SESSION['usuario_id'])) {
    header("Location: login.html");
    exit();
}
$usuario_id = $_SESSION['usuario_id'];
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard - Medidor de Agua</title>
</head>
<body>
  <h1>Consumo de Agua</h1>
  <div id="datos-consumo"></div>
  <h2>Control de Válvula</h2>
  <div id="nivel-actual"></div>
  <br>
  <button onclick="cambiarNivel(255)">Alta</button>
  <button onclick="cambiarNivel(128)">Media</button>
  <button onclick="cambiarNivel(64)">Baja</button>
  <br>  <br>
  <div id="mensaje"></div>
  <!-- Se recarga cada 10 min -->
 <meta http-equiv="refresh" content="10; url='dashboard.php'">
  <script>
    async function obtenerDatos() {
      const response = await fetch('http://localhost/AquaSmart_Control/guardar_datos.php?usuario_id=<?php echo $usuario_id; ?>');
      if (response.ok) {
        const data = await response.json();
        document.getElementById('datos-consumo').innerText = `Flujo de agua: ${data.flujo} L/min, Fecha: ${data.fecha}`;
      } else {
        console.error("Error al obtener los datos:", response.statusText);
        document.getElementById('datos-consumo').innerText = "Error al obtener los datos";
      }
    }

    async function obtenerNivel() {
      const response = await fetch('http://localhost/AquaSmart_Control/obtener_nivel.php');
      if (response.ok) {
        const data = await response.json();
        if (data.nivel !== undefined) {
          document.getElementById('nivel-actual').innerText = `Nivel actual: ${data.descripcion}`;
        } else {
          console.error("Error al obtener el nivel:", data.error);
          document.getElementById('nivel-actual').innerText = "Error al obtener el nivel";
        }
      } else {
        console.error("Error al obtener el nivel:", response.statusText);
        document.getElementById('nivel-actual').innerText = "Error al obtener el nivel";
      }
    }

    async function cambiarNivel(nivel) {
      try {
        const response = await fetch('http://localhost/AquaSmart_Control/control_valvula.php', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: `nivel=${nivel}`
        });

        if (response.ok) {
          const result = await response.text();
          document.getElementById('mensaje').innerText = result;
          obtenerNivel(); // Actualizar el nivel actual después de cambiarlo
        } else {
          console.error("Error al cambiar el nivel:", response.statusText);
          document.getElementById('mensaje').innerText = "Error al cambiar el nivel";
        }
      } catch (error) {
        console.error("Error al cambiar el nivel:", error);
        document.getElementById('mensaje').innerText = "Error al cambiar el nivel";
      }
    }

    setInterval(obtenerDatos, 9000); // Actualizar cada 9 segundos
    setInterval(obtenerNivel, 9000); // Actualizar cada 9 segundos
  </script>
</body>
</html>
