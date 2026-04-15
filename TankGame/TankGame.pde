// 1 April 2026 | TankGame by Sidonie Kruger
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
Obstacle o1;
Obstacle2 o2;
Obstacle3 o3;
PImage bg1;
int score;

void setup() {
  size(500, 500);
  score = 0;
  t1=new Tank();
  bg1= loadImage("Background.png");
  o1 = new Obstacle(100, 100, 100, 50, 5, 100);
}

void draw() {
  background(155);
  imageMode (CORNER);
  image (bg1, 0, 0);
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
  }
  t1.display();
  o1.display();
  o1.move();
  scorePannel();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  projectiles.add(new Projectile(t1.x, t1.y, 4, 10));
}

void scorePannel() {
  fill(127, 100);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(000);
  textSize(25);
  textAlign(CENTER);
  text("Score: " + score, width/2, 20);
}
