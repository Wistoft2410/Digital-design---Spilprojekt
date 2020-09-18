class Map extends Default {
  PImage platform;

  PVector loc;
  PVector vel;
  PVector acc;


  Map() {
    platform = loadImage("../Ressources/Platform.png");   
    loc = new PVector(random(100, 0), random(0, 100));
    vel = new PVector(1, 0);
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
    fill(255);
    image(platform, loc.x, loc.y, 300, 100);
  }
}
