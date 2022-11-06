#include <Arduino.h>
#include <Wire.h>
#include <WiFi.h>

void setup()
{
    Serial.begin(115200);
    while (!Serial)
        ;
}

void loop()
{

    int res = WiFi.scanNetworks();
    Serial.print("Available WiFi networks: ");
    Serial.println(res);

    for (int i = 0; i < res; i++)
    {
        auto ssid = WiFi.SSID(i);
        auto rssi = WiFi.RSSI(i);

        Serial.print("SSID: ");
        Serial.println(ssid);
        Serial.print("RSSI: ");
        Serial.println(rssi);
        Serial.println();
    }

    delay(3000);
}