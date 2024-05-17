#include <ESP8266WiFi.h> // Si usas ESP8266
//#include <WiFi.h> // Si usas ESP32

// Configuración WiFi
const char* ssid = "INFINITUMF9F9_2.4";
const char* password = "c8HcDENs7U";

// Configuración del servidor web
const char* serverName = "http://localhost/AquaSmart_Control/guardar_datos.php";
const char* controlUrl = "http://localhost/AquaSmart_Control/nivel.txt";

// Pin del sensor de flujo y válvula
const int sensorPin = 2;
const int valvePin = 9;

// Variables para medir el flujo
volatile int pulseCount = 0;
float flowRate = 0;
unsigned long oldTime = 0;

// Nivel de control de flujo
int flowLevel = 255; // Nivel máximo por defecto

void IRAM_ATTR pulseCounter() {
  pulseCount++;
}

void setup() {
  // Configuración del pin del sensor
  pinMode(sensorPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(sensorPin), pulseCounter, FALLING);

  // Configuración del pin de la válvula
  pinMode(valvePin, OUTPUT);
  analogWrite(valvePin, flowLevel); // Configurar nivel inicial

  // Iniciar comunicación serie
  Serial.begin(115200);

  // Conectar a WiFi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Conectando a WiFi...");
  }
  Serial.println("Conectado a WiFi");
}

void loop() {
  if ((millis() - oldTime) > 1000) {
    detachInterrupt(sensorPin);

    // Calcular el flujo de agua en litros/minuto
    flowRate = ((1000.0 / (millis() - oldTime)) * pulseCount) / 7.5;
    oldTime = millis();
    pulseCount = 0;

    // Imprimir flujo de agua
    Serial.print("Flujo de agua: ");
    Serial.print(flowRate);
    Serial.println(" L/min");

    // Enviar datos al servidor
    if (WiFi.status() == WL_CONNECTED) {
      WiFiClient client;
      if (client.connect(serverName, 80)) {
        String postData = "flujo=" + String(flowRate) + "&usuario_id=1"; // Ajusta el usuario_id según el inicio de sesión
        client.println("POST /guardar_datos.php HTTP/1.1");
        client.println("Host: localhost");
        client.println("Content-Type: application/x-www-form-urlencoded");
        client.println("Content-Length: " + String(postData.length()));
        client.println();
        client.println(postData);
      }
      client.stop();

      // Leer el nivel de control de flujo
      if (client.connect(controlUrl, 80)) {
        client.println("GET /nivel.txt HTTP/1.1");
        client.println("Host: localhost");
        client.println("Connection: close");
        client.println();
        
        while (client.available() == 0) {
          delay(1000);
        }
        
        while (client.available()) {
          String line = client.readStringUntil('\r');
          flowLevel = line.toInt();
          analogWrite(valvePin, flowLevel);
        }
      }
      client.stop();
    }

    attachInterrupt(digitalPinToInterrupt(sensorPin), pulseCounter, FALLING);
  }
}
