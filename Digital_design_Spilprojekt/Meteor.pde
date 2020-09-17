class Meteor extends Default {
  PImage meteor = loadImage("../Ressources/Meteor.png");

	boolean hit;
  boolean touchGround;

  float size;

  Meteor (float loc_x, float loc_y) {
    size = width/20;
    touchGround = false;

    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000097);
  }
  
   void update () {
    vel.add(acc);
    loc.add(vel);
  }

	void run() {
		update();
    display();
	}	

	void setHit(boolean hit) {
		this.hit = hit;
	}

  void display () {
    noStroke();
    fill(220);
    image(meteor,loc.x, loc.y, size, size);
  }
}
