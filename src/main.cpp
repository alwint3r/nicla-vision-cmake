#include <Arduino.h>
#include <WiFi.h>

void setup()
{
    Serial.begin(115200);
    while (!Serial);

    pinMode(24, OUTPUT);

    auto res = WiFi.scanNetworks();
    Serial.print("Scan result: ");
    Serial.println(res);
}

void loop()
{
    Serial.println("run");
    digitalWrite(24, HIGH);
    delay(100);
    digitalWrite(24, LOW);
    delay(100);
}