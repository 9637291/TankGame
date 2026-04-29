class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage iTankbrown;
  char idir;


  //Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this. h = h;
    this. speed = speed;
    this. health= health;
     if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = width +100;
      y = random(height);
    } else {
      idir = 's';
      x =random(width);
      y = -100;
    }
    iTankbrown = loadImage("tankbrown.png");
  }

  void display() {
    imageMode(CENTER);
    image(iTankbrown, x, y);
  }



  void move() {
    switch(idir) {
    case 'w':
      y = y - speed;
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
}
