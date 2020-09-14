ArrayList<Egg> egg = new ArrayList<Egg>();
Egg test;
GameSystem gameSystem;
Dino player;

void setup() {
  size(800, 800);
  gameSystem = new GameSystem();
  player = new Dino();
  test = new Egg(100,100);
}

void draw() {
  background(200);
  gameSystem.update();
  player.update();
  test.update();
}

void mousePressed () {
  player.heart.liv--;
}
