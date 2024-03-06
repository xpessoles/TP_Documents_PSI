/* Encoder Library - Basic Example
 * http://www.pjrc.com/teensy/td_libs_Encoder.html
 *
 * This example code is in the public domain.
 */

#include <Encoder.h>

// A Renseigner
#define PWM1 9; // ou PIN 9 // 6
#define PWM2 10; // ou 10  9 //10

#define VOIE_A 2; //
#define VOIE_B 3, //

Encoder myEnc(VOIE_A, VOIE_B);
//   avoid using pins with LEDs attached

void setup() {
  // Configuration du PWM
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);

  // Configuration du port série
  Serial.begin(9600);
  Serial.println("Basic Encoder Test:");
}

long oldPosition  = -999;

long cpt = myEnc.read();

void loop() {
  
  Serial.println(newPosition);
  
  for (int t=0; t<500; t++)
   {  
    cpt = myEnc.read();
     Serial.print(cpt);Serial.print(",");Serial.print(cpt);Serial.println();
     moteur(0);
   }

  for (int t=0; t<500; t++)
   {
    cpt = myEnc.read();
     Serial.print(cpt);Serial.print(",");Serial.print(cpt);Serial.println();
     moteur(-100);
     delay(1);
   }

  for (int t=0; t<500; t++)
   {
    cpt = myEnc.read();
     Serial.print(cpt);Serial.print(",");Serial.print(cpt);Serial.println();
     moteur(100);
     delay(1);
   }  
  
}


void moteur(float x){
  // Commande du moteur (commande comprise entre -255 et 255)
   if (x>0){
    pwm1 = 255;
    pwm2 = 255 - x;
  } else {
    pwm1 = 255+x ;
    pwm2 = 255 ;
  }
  analogWrite(PWM1,pwm1);
  analogWrite(PWM2,pwm2);
  }
