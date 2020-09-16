class Meteor extends Default {
  PImage muneb = loadImage("../Ressources/Meteor.png");

  boolean touchGround;
  float meteorSize;

  Meteor (float loc_x, float loc_y) {
    meteorSize = width/20;
    touchGround = false;

    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000017);
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
    noStroke();
    fill(220);
    image(muneb,loc.x, loc.y, meteorSize, meteorSize);
  }
}
