class Map {
  PImage platform;

  PVector location;
  PVector velocity;
  PVector acceleration;


  Map() {
        platform = loadImage("../Ressources/Platform.png");

    location = new PVector(200, 200);
    velocity = new PVector(1, 0);
    
  }

  void update() {
    location.add(velocity);
  }


  void display() {
    noStroke();
    fill(255);
    image(platform,location.x,location.y,300,100);
  }
}
