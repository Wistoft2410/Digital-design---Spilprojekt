class Tile extends Default {

  PVector loc;
  PVector vel;

  float sizeX;
  float sizeY;

  Tile() {
    loc = new PVector(random(-600, -300), random(680, 800));
    vel = new PVector(0.5, 0);
    sizeX = 300;
    sizeY = 5;
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
    rect(loc.x, loc.y, sizeX, sizeY);
  }

  boolean out() {
    return loc.x > width;
  }
}
