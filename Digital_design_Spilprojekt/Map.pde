class Map {
  PImage platform;

  PVector loc;
  PVector vel;
  PVector acc;

  Map() {
    platform = loadImage("../Ressources/Platform.png");

    loc = new PVector(400,700);
    vel = new PVector(0, 0);
    acc = new PVector(width*0.000167, 0);
    
  }

  void update() {
    //vel.add(acc);
    loc.add(vel);
  }

  void display() {
    image(platform,loc.x,loc.y,300,100);
  }
}
