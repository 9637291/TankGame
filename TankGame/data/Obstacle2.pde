class Obstacle2 {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage iTankbrown;
  char idir;


    //Constructor
  Obstacle2(float x, float y, float w, float h, float speed, float health) {
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
  }
}
