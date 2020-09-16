class Knap {

  PVector loc;

  int r;
  int g;
  int b;

  float widthSize;
  float heightSize;
  float kant;

  boolean on;

  Knap (float loc_x, float loc_y) {
    loc= new PVector(loc_x, loc_y);
    r = 0;
    g = 200;
    b = 0;
    widthSize = width*0.5;
    heightSize = height*0.5;
    kant = 10;
    on = true;
  }

  void update() {
    display();
    clicked();
  }

  void display() {
    rectMode(CENTER);
    fill(r, g, b);
    rect(loc.x, loc.y, widthSize, heightSize, kant);
  }


  boolean clicked () {
    if (mousePressed && mouseX > loc.x - widthSize*0.5 && mouseX < loc.x + widthSize*0.5 && mouseY > loc.y - heightSize*0.5 && mouseY < loc.y + heightSize*0.5 && on ) {
      on = false;
      r = 200;
      g = 0;
      return true;
    } else return false;
  }
}
