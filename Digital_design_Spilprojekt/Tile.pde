class Tile extends Default {

  PVector loc;
  PVector vel;

  float sizeX;
  float sizeY;

  Tile() {
    sizeX = 300.0 / 800.0 * width;
    sizeY = 5.0 / 800.0 * height;
    loc = new PVector(random(width + sizeX, width + sizeX * 2.0), random((680.0 / 800.0) * height, height));
    vel = new PVector(0.5, 0);
  }

  void run() {
    update();
    display();
  }

  void update() {
    loc.sub(vel);
  }

  void display() {
    noStroke();
    fill(100);
    rectMode(CORNER);
    rect(loc.x, loc.y, sizeX, sizeY);
  }

  boolean out() {
    return loc.x < 0;
    }
}
