PImage img; 

class Egg extends Default {
  
	float lifespan;
  boolean touchGround;

  float eggSizeX = scl;
  float eggSizeY = scl;

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
<<<<<<< HEAD
   // img = loadImage("../Ressources/Egg.png");
=======
  //  img = loadImage("../Ressources/Egg.png");
>>>>>>> ca0f6ca3844e069d4c9baba0d2571b2f0c990a79
    noStroke();
    fill(255, 223, 0);
    //image(img, loc.x, loc.y, eggSizeX, eggSizeY);
    ellipse(loc.x, loc.y, eggSizeX, eggSizeY);
    
  }
}
