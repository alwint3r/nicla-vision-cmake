#include <Arduino.h>
#include <Wire.h>

void setup()
{
    Serial.begin(115200);
    while (!Serial);

    Wire.begin();

    pinMode(24, OUTPUT);
}

void loop()
{
    Serial.println("run");
    digitalWrite(24, HIGH);
    delay(100);
    digitalWrite(24, LOW);
    delay(100);

   
    for(int i = 1; i < 127; i++)
    {
        Wire.beginTransmission(i);
        if (Wire.endTransmission(i) == 0)
        {
            Serial.print("Found device at address: ");
            Serial.println(i, HEX);
        }
    }

     delay(1000);
}