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
    iTankbrown = loadImage("tankbrown.png");
  }

  void display() {
    imageMode(CENTER);
    image(iTankbrown, x, y);
  }



  void move() {
    x = x + speed;
    if (x>width+w/2) {
      x = 0;
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
