// 1 April 2026 | TankGame by Sidonie Kruger
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
PImage bg1;
int score;
Timer objTimer;

void setup() {
  size(500, 500);
  score = 0;
  t1=new Tank();
  bg1= loadImage("Background.png");
  objTimer = new Timer(1000);
  objTimer.start();
  //obstacles.add(new Obstacle(300, 200, 100, 100, int(random (1, 10)),10));
}

void draw() {
  background(155);
  imageMode (CORNER);
  image (bg1, 0, 0);
  
  // Distribute object on timer
  if(objTimer.isFinished()) {
    //Add object
    obstacles.add(new Obstacle(-100, 200, 100, 100, int(random (1, 10)),10));
    //Restart Timer
    objTimer.start();
  }
  
  //Displays and removes obstacles
   for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
   o.display();
    o.move();
     if(o.reachedEdge()){
      obstacles.remove(i);
    }
   //Detect collision to tank
   if(t1.intersect(o)) {
   
 }
   
   //impact to change score, health, and obstacle
   
  }
    for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
   o.display();
    o.move();
  }
    for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
   o.display();
    o.move();
       
  }
    // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for(int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if(p.intersect(o)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
    p.display();
    p.move();
    if(p.reachedEdge()){
      projectiles.remove(i);
    }
  }
  t1.display();
 //o1.display();
  //o1.move();
  scorePannel();
  println("Ojects in Memory:"+obstacles.size());
  println("Ojects in Memory:"+projectiles.size());
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
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);
  
  if (mag > 0){
    dx /= mag;
    dy /= mag;
    float speed = 5;
  projectiles.add(new Projectile(t1.x, t1.y, 4, 10));
  }
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
