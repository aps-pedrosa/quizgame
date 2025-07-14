const int buttonPin = 2;

void setup() {
  pinMode(buttonPin, INPUT_PULLUP);
  Serial.begin(9600);
  Serial.println("BUTTON_PRESSED");
}

void loop() {
}
