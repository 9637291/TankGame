// 1 April 2026 | TankGame by Sidonie Kruger
Tank t1;
Obstacle o1;
PImage bg1;
void setup() {
  size(500, 500);
  t1=new Tank();
  bg1= loadImage("Background.png");
  o1 = new Obstacle(100,100,100,50,5,100);
}

void draw() {
  background(155);
  imageMode (CORNER);
  image (bg1,0,0);
  t1.display();
  o1.display();
  o1.move();
}

void keyPressed() {
  if(key == 'w'){
     t1.move('w');  
  } else if(key == 's') {
    t1.move('s');
  }else if(key == 'a') {
    t1.move('a');
  }else if(key == 'd') {
    t1.move('d');
  }
}
