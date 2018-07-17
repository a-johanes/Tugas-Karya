#include <SoftSerial.h>     /* Allows Pin Change Interrupt Vector Sharing */
#include <TinyPinChange.h>  /* Ne pas oublier d'inclure la librairie <TinyPinChange> qui est utilisee par la librairie <RcSeq> */

SoftSerial mySerial(6, 7); // RX, TX


void setup()
{
  pinMode(1, OUTPUT);
  pinMode(6, INPUT);
  pinMode(7, OUTPUT);

  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo only
  }

  //Serial.println("Goodnight moon!");

  // set the data rate for the SoftwareSerial port
  mySerial.begin(9600);
  //mySerial.println("Hello, world?");
  //mySerial.print(F("AT+\r\n"));
  delay(100);
  
}

void loop() // run over and over
{
  digitalWrite(1, HIGH);
  delay(500);
  digitalWrite(1, LOW);
  delay(500);
  if (mySerial.available()) {
    //mySerial.write(mySerial.read());
    char x = mySerial.read();
    if (x == 'a' ) {
      digitalWrite(1, HIGH);
      delay(1000);
      digitalWrite(1, LOW);
    } else  if (x == 'b') {
      for (int i = 0; i < 10; i++) {
        digitalWrite(1, HIGH);
        delay(100);
        digitalWrite(1, LOW);
        delay(100);
      }
    } else {
      digitalWrite(1, LOW);
      delay(1000);
    }
    mySerial.flush();
  }
  if (Serial.available())
    mySerial.write(Serial.read());
}
