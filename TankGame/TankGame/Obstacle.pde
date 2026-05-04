class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage iTankbrown;
  char idir;


  //Constructor
  Obstacle( float w, float h, float speed, float health) {
    x = int(random(width));
    y = -100;
    this.w = w;
    this. h = h;
    this. speed = speed;
    this. health= health;
    idir= 'w';
    // if (int(random(4))==2) {
    //  idir = 'w';
    //  x = random(width);
    //  y = height + 100;
    //} else if (int(random(3))==1) {
    //  idir = 'd';
    //  x = -100;
    //  y = random(height);
    //} else if (int(random(2))==1) {
    //  idir = 'a';
    //  x = width +100;
    //  y = random(height);
    //} else {
    //  idir = 's';
    //  x =random(width);
    //  y = -100;
    //}
    iTankbrown = loadImage("tankbrown.png");
  }

  void display() {
    imageMode(CENTER);
    rect(x, y, w, h);
    //image(iTankbrown, x, y);
  }



  void move() {
    y = y+ speed;
    //switch(idir) {
    //case 'w':
    //  y = y - speed;
    //  break;
    //case 'a':
    //  x = x - speed;
    //  break;
    //case 's':
    //  y = y + speed;
    //  break;
    //case 'd':
    //  x = x + speed;
    //  break;
    //}
  }
  boolean offScreen() {
    return x >= width+150 || x <= -150 || y > height + 150 || y < -150;
  }
}
