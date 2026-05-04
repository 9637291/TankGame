class PowerUp {
  // Member Variable
  float x, y, w, h, speed;
  PImage powerup;
  char type;


  //Constructor
  PowerUp(float w, float h) {
    w = 100;
    h = 100;
    speed = 5;
    if (int(random(4))==2) {
   type = 'h'; // H is for health
    }else if (int(random(3))==1){
      type = 't'; // T is for Turret
    }else{
      type = 'a'; // A is for ammo
    }
    powerup = loadImage("powerup.png");
  }


  void display() {
    if (type== 'h') {
      fill(0, 200, 0);
      ellipse (x, y, w, h);
      fill(255);
      textAlign(CENTER,CENTER);
      text ("Health", x, y);
    } else if (type== 't') {
      fill(0, 200, 200);
      ellipse (x, y, w, h);
      fill(255);
      text ("Turret", x, y);
    } else if (type== 'a') {
      fill(200, 0, 0);
      ellipse (x, y, w, h);
      fill(255);
      text ("Ammo", x, y);
    }
    //imageMode(CENTER);
    //image(iTankbrown, x, y);
  }



  void move() {
    switch(type) {
    case 'w':
      y = y + speed;
      break;
    case 'a':
      x = x - speed;
      break;
    case 's':
      y = y + speed;
      break;
    case 'd':
      x = x + speed;
      break;
    }
  }
  boolean offScreen() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
   boolean intersect(Tank t) {
    float distance = dist(x,y,t.x,t.y);
    if(distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  
}
