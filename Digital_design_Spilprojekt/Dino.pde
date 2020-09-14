class Dino {

  

  PVector gravity;
  PVector loc;
  PVector vel;
  PVector acc;
  float dinoSize;
  boolean touchGround;
  float speed;

  Dino () {
    gravity = new PVector (0, height*0.000167);
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    dinoSize = (height + width)/50;
    touchGround = false;
    speed = dinoSize/8;

  }

  void update () {
    display();
    move();
    applyForce(gravity);
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
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
    acc.add(force);
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
