class Dino {

  PVector gravity;
  PVector loc;
  PVector vel;
  PVector acc;
  float dinoSize;
  boolean touchGround = false;

  Dino () {
    gravity = new PVector (0, 5);
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dinoSize = 10;
  }

  void update () {
    move();
    applyForce(gravity);
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    display();
    jorden();
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

  void applyForce( PVector force ) {
    acc = force;
  }

  void move() {
    if ( keyCode == RIGHT && keyPressed ) {
      loc.add(3, 0);
    }
    if ( keyCode == LEFT && keyPressed ) {
      loc.sub(3, 0);
    }
    if ( keyCode == UP && keyPressed ) {
      loc.sub(0,10);
    }
  }
}
