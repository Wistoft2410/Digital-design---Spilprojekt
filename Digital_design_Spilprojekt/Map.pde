class Map {
  PImage platform;

  PVector location;
  PVector velocity;
  PVector acceleration;


  Map() {
        platform = loadImage("../Ressources/Platform.png");



    location = new PVector(200, 200);


    location = new PVector(random(100,0), random(0,100));


    velocity = new PVector(1, 0);
    
  }

void run() {
 update();
 display();
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
