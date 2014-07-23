/*
  IR_remote_detector sketch
  An IR remote receiver is connected to pin 2.
  The LED on pin 13 toggles each time a button on the remote is pressed.
 */

//#import <TinyDebugSerial.h>
#include <IRremote.h>                    //adds the library code to the sketch

const int irReceiverPin = 11;             //pin the receiver is connected to
const int ledPin = 13;

IRrecv irrecv(irReceiverPin);            //create an IRrecv object
decode_results decodedSignal;            //stores results from IR detector

//TinyDebugSerial mySerial = TinyDebugSerial();


void setup()
{
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  irrecv.enableIRIn();     // Start the receiver object
}

boolean lightState = false;              //keep track of whether the LED is on
unsigned long last = millis();           //remember when we last received an IR


void loop()
{
  if (irrecv.decode(&decodedSignal) == true) //this is true if a message has
  {
    if (millis() - last > 250) {       //has it been 1/4 sec since last message
      lightState = !lightState;              //toggle the LED
      digitalWrite(ledPin, lightState);
//      char *val;
//      itoa(decodedSignal.value, val, 10);
      Serial.println("TEST");
      Serial.println(decodedSignal.value);

    }
    last = millis();
    irrecv.resume();                         // watch out for another message
  }
}
