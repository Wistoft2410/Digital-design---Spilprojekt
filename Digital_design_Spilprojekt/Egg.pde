PImage img; 

class Egg {
  PVector loc;
  PVector vel;
  PVector acc;
	float lifespan;

  boolean touchGround;

  float eggSizeX;
  float eggSizeY;

  Egg (float loc_x, float loc_y) {
    eggSizeX = width/50;
    eggSizeY = height/30;
    touchGround = false;

    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167);
  }

  void update () {
    vel.add(acc);
    loc.add(vel);
  }

	void run() {
		update();
		display();
	}

  void display () {
    img = loadImage("../Ressources/Egg.png");
    noStroke();
    fill(255, 223, 0);
    image(img, loc.x, loc.y, eggSizeX, eggSizeY);
    
  }
}
