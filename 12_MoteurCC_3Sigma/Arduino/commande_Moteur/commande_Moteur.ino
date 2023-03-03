#define PWM1 6
#define PWM2 9

float uc;
int pwm1;
int pwm2;


void setup() {
   pinMode(PWM1, OUTPUT);
   pinMode(PWM2, OUTPUT);

}

void loop() {
  uc = 0;
  if (uc>0){
    pwm1 = 255;
    pwm2 = 255 - uc;
  } else {
    pwm1 = 255+uc ;
    pwm2 = 255 ;
  }
  digitalWrite(PWM1,pwm1);
  digitalWrite(PWM2,pwm2);
  
}
