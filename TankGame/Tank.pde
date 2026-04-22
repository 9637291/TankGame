class Tank {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage iTank, iTankA, iTankS, iTankD;
  char idir;
 

  //Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 7.0;
    health = 75.0;
    iTank = loadImage("tank.png");
    iTankA = loadImage("tankA.png");
    iTankS = loadImage("tankS.png");
    iTankD = loadImage("tankD.png");
    idir= 'w';
  }

  void display() {
    imageMode(CENTER);
    image(iTank, x, y);
  }



  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 's') {
      idir = 's';
      y = y + speed;
    } else if (dir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (dir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }

  void fire() {
  }
    boolean intersect(Obstacle o) {
    float distance = dist(x,y,o.x,o.y);
    if(distance < 100) {
      return true;
    } else {
      return false;
    }
}
