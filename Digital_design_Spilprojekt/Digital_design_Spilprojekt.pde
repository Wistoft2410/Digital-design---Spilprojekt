GameSystem gameSystem;
Background b;


void setup() {
  frameRate(60);
  size(800, 800);
  gameSystem = new GameSystem();
  b = new Background();
}

void draw() {
  background(200);
  b.display();
  gameSystem.update();
  b.display();
}

void keyPressed() {
  if (key == 'r' || key == 'R' ) {
    println("Reset");
    frameCount = -1;
  }
}
