class Dino {
  int liv;

  PVector loc;
  PVector vel;
  PVector acc;

  float dinoSize;
  boolean touchGround;
  float speed;

  Dino () {
    liv = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167);
    dinoSize = (height + width)/50;
    touchGround = false;
    speed = dinoSize/8;
  }

  void update (ArrayList<Egg> eggs) {
    collisionWithEggs(eggs);
    display();
    move();
    vel.add(acc);
    loc.add(vel);
    jorden();
  }

  void collisionWithEggs(ArrayList<Egg> eggs) {
    for (Egg egg : eggs) {
      if (dist(egg.loc.x, egg.loc.y, loc.x, loc.y) < 5) println("lool");
    }
  }

  void display () {
    fill(0);
    ellipse(loc.x, loc.y, dinoSize, dinoSize);
  }

  void jorden () {
    if ( loc.y > height - dinoSize/2 ) {
      touchGround = true;
      loc.y = height - dinoSize/2;
    }
  }

  boolean isDead () {
    if (liv <= 0) {
      liv = 0;
      return true;
    } else {
      return false;
    }
  }

  void move() {
    if ( keyCode == RIGHT && keyPressed ) {
      loc.add(speed, 0);
    }
    if ( keyCode == LEFT && keyPressed ) {
      loc.sub(speed, 0);
    }
    if ( keyCode == UP && keyPressed && touchGround) {
      touchGround = false;
      vel.y -= height*0.013;
    }
  }
}
