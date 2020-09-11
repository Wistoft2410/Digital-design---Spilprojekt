class Dino {

  PVector loc;
  PVector vel;
  PVector acc;
  float dinoSize;

  Dino () {    
    loc = new PVector(width/2, height/2);
    vel = new PVector();
    acc = new PVector(0, 0.1);
    dinoSize = 10;
  }

  void update () {
    vel.add(acc);
    loc.add(vel);
    display();
    jorden();
    control();
  }

  void display () {
    fill(0);
    ellipse(loc.x, loc.y, dinoSize, dinoSize);
  }

  void jorden () {
    if ( loc.y > height - dinoSize/2 ) {
      loc.y = height - dinoSize/2;
      vel.y = 0;
    }
  }

  void control () {
    if (keyCode == UP) {
      vel.y = -1;
    }
  }
}
