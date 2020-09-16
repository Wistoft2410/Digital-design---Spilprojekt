class Knap {

  PVector loc;

  int r, g, b;

  float widthSize;
  float heightSize;
  float kant;

  boolean on;

  String name;

  Knap (float loc_x, float loc_y, String name_, float widthSize_, float heightSize_) {
    loc= new PVector(loc_x, loc_y);
    r = 0;
    g = 200;
    b = 0;
    widthSize = widthSize_;
    heightSize = heightSize_;
    kant = 10;
    on = true;
    name = name_;
  }

  void update() {
    display();
    clicked();
  }

  void display() {
    rectMode(CENTER);
    fill(r, g, b);
    rect(loc.x, loc.y, widthSize, heightSize, kant);
    fill(0);
    textAlign(CENTER);
    textSize((heightSize+widthSize)*0.1);
    text(name, loc.x, loc.y, widthSize, heightSize);
  }


  void farveSkift() {
    if ( on ) {
      r = 0;
      g = 200;
    } else if ( !on ) {
      r = 200;
      g = 0;
    }
  }

  boolean clicked () {
    if (mousePressed && mouseX > loc.x - widthSize*0.5 && mouseX < loc.x + widthSize*0.5 && mouseY > loc.y - heightSize*0.5 && mouseY < loc.y + heightSize*0.5 && on ) {
      on = false;
      return true;
    } else return false;
  }
}
