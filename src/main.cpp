#include <Arduino.h>

void setup()
{
    Serial.begin(115200);
    pinMode(24, OUTPUT);
}

void loop()
{
    Serial.println("run");
    digitalWrite(24, HIGH);
    delay(100);
    digitalWrite(24, LOW);
    delay(100);
}