// A VALIDER
#define PWM1 9 // ou PIN 9 // 6
#define PWM2 10 // ou 10  9 //10

#define VOIE_A 2 //
#define VOIE_B 3 //

float uc;    // angle de consigne en degrés
float angle; // angle reducteur mesuré
float eps;  // écart sortie comparateur
float um;  // tension commande moteur (PWM)


int pwm1;
int pwm2;

volatile int cpt = 0;

void setup() {
  // Setup du PWM
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
  // Setup du codeur
  pinMode(VOIE_A,INPUT); 
  pinMode(VOIE_B,INPUT);  
  attachInterrupt(digitalPinToInterrupt(VOIE_A),codeurA,CHANGE);
  attachInterrupt(digitalPinToInterrupt(VOIE_B),codeurB,CHANGE);
  //Ouverture du port série
  Serial.begin(9600); 
}


void loop() {
  uc = 90.;
  angle = (float) cpt;  // conversion de l'angle moteur  mesuré en flottant
  angle = angle *360./48./34.; // conversion de l'angle moteur en angle en degrés en sortie du réducteur
  eps = uc-angle; // calcul de l'écart
  um = eps;     // calcul de la consigne moteur
  Serial.print(uc);Serial.print(",");Serial.print(angle);Serial.println();
  moteur(um);
  
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

void codeurA(){
  int a = digitalRead(VOIE_A);
  int b = digitalRead(VOIE_B);
  if(a==b){
    cpt++;
  }
  else{
    cpt--;
  }
}


void codeurB(){
  int a = digitalRead(VOIE_A);
  int b = digitalRead(VOIE_B);
  if(a==b){
    cpt--;
  }
  else{
    cpt++;
  }
}
