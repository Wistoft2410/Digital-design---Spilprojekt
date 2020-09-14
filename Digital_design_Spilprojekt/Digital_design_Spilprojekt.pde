ArrayList<Egg> egg = new ArrayList<Egg>();
Egg test;
Dino player;

void setup() {
  size(800, 800);
  player = new Dino();
  test = new Egg(100,100);
}

void draw() {
  background(200);
  player.update();
  test.update();
}

void mousePressed () {
  player.heart.liv--;
}
