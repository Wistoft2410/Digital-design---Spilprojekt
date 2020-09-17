class Map extends Default {

  Map() {
    loc = new PVector(random(-200, 100), random(680, 800));
    vel = new PVector(0.5, 0);
  }
  void run() {
    update();
    display();
  }


  void update() {
    loc.add(vel);
  }

  void display() {
    noStroke();
    fill(2);
    rectMode(CORNER);
    rect(loc.x, loc.y, 300, 5);
  }

  boolean out() {
    if (loc.x > width) {
      return true;
    } else {
      return false;
    }
  }
}
