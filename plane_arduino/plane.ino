const int trig = 3;
const int echo = 2;

float distance;
float duration;
float planePos = 200, previousPos;

void setup(){
  pinMode(trig, OUTPUT);
  pinMode(echo, INPUT);
  Serial.begin(115200);  
}

void loop(){
  digitalWrite(trig, LOW);
  delayMicroseconds(2);
  digitalWrite(trig, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig, LOW);

  duration = pulseIn(echo, HIGH);

  distance = duration*0.034/2;
  planePos = map(distance,0, 30, 300, 0);
  
  if(planePos >= 0 && planePos <= 300){
    previousPos = planePos;
    Serial.println(planePos);
    delay(50);
  }else Serial.println(previousPos);
}
