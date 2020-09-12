ArrayList<Egg> egg = new ArrayList<Egg>();
Dino player;

void setup() {
  size(600, 600);
  player = new Dino();
}

void draw() {
  background(200);
  player.update();
}
