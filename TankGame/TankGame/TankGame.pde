// 1 April 2026 | TankGame by Sidonie Kruger
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg1;
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  score = 0;
  t1=new Tank();
  bg1= loadImage("Background.png");
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //obstacles.add(new Obstacle(300, 200, 100, 100, int(random (1, 10)),10));
}

void draw() {
  background(155);
  imageMode (CORNER);
  image (bg1, 0, 0);

  // Distribute object on timer
  if (objTimer.isFinished()) {
    //Add object
    obstacles.add(new Obstacle( 100, 100, int(random (1, 10)), 10));
    //Restart Timer
    objTimer.start();
  }
  // distribue powerups on timer
  if (puTimer.isFinished()) {
    //Add object
    powerups.add(new PowerUp(100, 100));
    //Restart Timer
    puTimer.start();
  }


  //Displays and removes powerups
  //for (int i = 0; i < powerups.size(); i++) {
  //  PowerUp pu = powerups.get(i);
  //  pu.display();
  //  pu.move();
  //  if (pu.offScreen()) {
  //    powerups.remove(pu);
  //  }
  //  if (pu.intersect(t1)) {
  //    //Turret
  //    if (pu.type == 't') {
  //      t1.turretCount++;
  //    }
  //  } else if (pu.type == 'a') {
  //    t1.laserCount = t1.laserCount + 100;
  //  } else if (pu.type == 'h') {
  //    t1.health++;
  //  }
  //}
  //Detect collision to tank
  //if (t1.intersect(o)) {



  //Displays and removes obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();

    //if (o.offScreen()) {
    //  obstacles.remove(i);
    //}
    //Detect collision to tank
    if (t1.intersect(o)) {
      obstacles.remove(o);
      score = score -1;
    }
    //impact to change score, health, and obstacle
  }


  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
    p.display();
    p.move();
    if (p.offScreen()) {
      projectiles.remove(i);
    }
  }
  t1.display();
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

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    if (t1.turretCount == 1 && t1.laserCount > 0) {
      projectiles.add(new Projectile(t1.x, t1.y, 4, 10));
      t1.laserCount = t1.laserCount -1;
    } else if (t1.turretCount == 2 && t1.laserCount > 2) {
      projectiles.add(new Projectile(t1.x-20, t1.y, 4, 10));
      projectiles.add(new Projectile(t1.y, t1.x+20, 4, 10));
    } else if (t1.turretCount == 3) {
      projectiles.add(new Projectile(t1.x-25, t1.y, 4, 10));
      projectiles.add(new Projectile(t1.y, t1.x+10, 4, 10));
      projectiles.add(new Projectile(t1.y, t1.x+100, 4, 10));
    }
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
