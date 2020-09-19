class Tile extends Default {

  PVector loc;
  PVector vel;

  float sizeX;
  float sizeY;

  Tile() {
    sizeX = 300.0 / 800.0 * width;
    sizeY = 5.0 / 800.0 * height;
    loc = new PVector( width + sizeX/2, placering( height * 0.8, height ) );
    vel = new PVector(0.5, 0);
  }

  void run() {
    update();
    display();
  }

  void update() {
    loc.sub(vel);
  }



  float placering (float min, float max) {
    int a = (int)random(4);
    if (a == 0) {
      return  min;
    } else if (a == 1) {
      return min + ((max - min)*0.25);
    } else if (a == 2) {
      return min + ((max - min)*0.75);
    } else if (a == 3) {
      return max;
    } else 
      println("Fejl");
    return height*0.1;
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
