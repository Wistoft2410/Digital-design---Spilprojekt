class Heart extends Default {

  PImage heart = loadImage("../Ressources/Heart.png");
  int liv;
  float heartSize;

  Heart() {
    loc = new PVector(0, 0);
    heartSize = (height+width)*0.1;
    liv = 3;
  }

  Heart (float pos_x, float pos_y, float size_, int liv_) {
    loc = new PVector(pos_x, pos_y);
    heartSize = size_;
    liv = liv_;
  }


  void display () {
    for (int i = 0; i < liv; i++) {
      image(heart, loc.x + heartSize*i, loc.y, heartSize, heartSize);
    }
  }
}
