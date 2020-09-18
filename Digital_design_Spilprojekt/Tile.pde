class Tile extends Default {

  PVector loc;
  PVector vel;

  float sizeX;
  float sizeY;

  Tile() {
    
    loc = new PVector(random((-700.0 / 800.0) * width, -300), random((680.0 / 800.0) * height, height));
    println(loc);
    vel = new PVector(0.5, 0);
    sizeX = 300.0 / 800.0 * width;
    sizeY = 5.0 / 800.0 * height;
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
    fill(100);
    rectMode(CORNER);
    rect(loc.x, loc.y, sizeX, sizeY);
  }

  boolean out() {
    return loc.x > width;
  }
}
