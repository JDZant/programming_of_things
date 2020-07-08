//set the variables with pin numbers
int piezoPin = 9;
int lightValue = 0; 
int ledPin = 4;
int photPin = 2;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  //set pinmodes
  pinMode(piezoPin, OUTPUT);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  sensLight();
  lightValue = analogRead(photPin);
  blinkLed();
  makeSound();
}

//this function 
void makeSound(){
    digitalWrite(piezoPin, HIGH);
    delay(lightValue);
    digitalWrite(piezoPin, LOW);
    delay(lightValue);
}

//function responsible for blinking the led
void blinkLed(){
    digitalWrite(ledPin, HIGH);
    delay(lightValue);
    digitalWrite(ledPin, LOW);
    delay(lightValue);
}
//sensLight prints the variable to the selected COM so that processing can use this data
void sensLight(){
  Serial.println(lightValue);
}
