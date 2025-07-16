const int team1 = 2;
const int team2 = 3;
const int opA = 4;
const int opB = 5;
const int opC = 6;
const int opD = 7;

void setup() {
  pinMode(team1, INPUT_PULLUP);
  pinMode(team2, INPUT_PULLUP);
  pinMode(opA, INPUT_PULLUP);
  pinMode(opB, INPUT_PULLUP);
  pinMode(opC, INPUT_PULLUP);
  pinMode(opD, INPUT_PULLUP);
  Serial.begin(9600);
  Serial.println("restart");
}

void loop() {
  if (digitalRead(team1) == HIGH) {
    Serial.println("TEAM1_PRESSED");
    delay(1000);
  }
  if (digitalRead(team2) == HIGH) {
    Serial.println("TEAM2_PRESSED");
    delay(1000);
  }
  if (digitalRead(opA) == LOW) {
    Serial.println("OPA_PRESSED");
    delay(1000);
  }
  if (digitalRead(opB) == LOW) {
    Serial.println("OPB_PRESSED");
    delay(1000);
  }
  if (digitalRead(opC) == LOW) {
    Serial.println("OPC_PRESSED");
    delay(1000);
  }
  if (digitalRead(opD) == LOW) {
    Serial.println("OPD_PRESSED");
    delay(1000);
  }

}
