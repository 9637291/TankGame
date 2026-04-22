// Sidonie Kruger | March 25 2026 | Timer
import processing.sound.*;
SoundFile alarm;
Button btnStart, btnStop, btnReset;
int totalTime, startTime, timeLeft;
boolean running;

void setup() {
  size(525, 525);
  alarm = new SoundFile(this, "alarm.wav");
  btnStart = new Button(width/2, 350, 100, 30, "Start");
  btnStop = new Button(width/2, 400, 100, 30, "Stop");
  btnReset = new Button(width/2, 450, 100, 30, "Reset");
  totalTime = 10;
  startTime = 0;
  running = false;
}

void draw() {
  background(127);

  if (running == true) {
    int elapsed = (millis()-startTime)/1000;
    timeLeft = totalTime - elapsed;

    if (timeLeft <= 0) {
      timeLeft= 0;
      running = false;
      alarm.play();
    }
  }
  btnStart.display();
  btnStop.display();
  btnReset.display();
  textSize(100);
  textAlign(CENTER, CENTER);
  fill(10);
  text(timeLeft, width/2, height/2);
  text("Timer", 250, 100);
}

void mousePressed() {
  if(btnStart.isMouseOver() == true) {
    running = true;
    startTime = millis();
  }
  
  if(btnStop.isMouseOver() == true) {
    running = false;
   
  }
    if(btnReset.isMouseOver() == true) {
    running = true;
    startTime = millis();

    }
}

  
