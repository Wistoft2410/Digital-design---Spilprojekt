class Dino extends Default {
  int liv;
  boolean touchGround;
  float speed;

  Dino () {
    super();
    liv = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167);
    scl = (height + width)/50;
    touchGround = false;
    speed = scl/8;
  }

  void update (ArrayList<Egg> eggs) {
    
    funktion();
    
    collisionWithEggs(eggs);
    display();
    move();
    vel.add(acc);
    loc.add(vel);
    jorden();
  }

  void collisionWithEggs(ArrayList<Egg> eggs) {
    for (Egg egg : eggs) {
      if (dist(egg.loc.x, egg.loc.y, loc.x, loc.y) < 8) {
        // Vi skal huske at sørge for at ægget forsvinder og vi "incrementer" scoren!
        gameSystem.incrementScore();
      }
    }
  }

  void funktion () {
    if (loc.y == height - scl/2) {
      vel.mult(0);
      acc.mult(0);
    }
    if (loc.y < height - scl/2) {
      acc.y = height*0.000167;
    }
  }

  void display () {
    stroke(0);
    strokeWeight(0);
    fill(0);
    ellipse(loc.x, loc.y, scl, scl);
  }

  void jorden () {
    if ( loc.y > height - scl/2 ) {
      touchGround = true;
      loc.y = height - scl/2;
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
      //println(height*0.013);
      vel.y -= height*0.009;
      //vel.y -= constrain(height*0.011,20,height*0.013);
      touchGround = false;
     
    }
  }
}
