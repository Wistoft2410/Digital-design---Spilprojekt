class Tile extends Default {

  PVector loc;
  PVector vel;

  float sizeX;
  float sizeY;

  Tile() {
    sizeX = 300.0 / 800.0 * width;
    sizeY = 5.0 / 800.0 * height;
    loc = new PVector(random(width + sizeX * 1.5, width + sizeX * 2), random(((680.0 / 800.0) * height) - sizeY*0.5, height - sizeY*0.5));
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
    rectMode(CENTER);
    rect(loc.x, loc.y, sizeX, sizeY);
  }

  boolean out() {
    return loc.x + sizeX * 0.5 < 0;
    }
}
