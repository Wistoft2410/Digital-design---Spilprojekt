GameSystem gameSystem;

void setup() {
  size(800, 800);
  gameSystem = new GameSystem();
}

void draw() {
  background(200);
  gameSystem.update();
}

void mousePressed () {
  gameSystem.eggs.add(new Egg(mouseX,mouseY));
}

void keyPressed() {
  if (key == 'r' || key == 'R' ) {
    println("Reset");
    frameCount = -1;
  }
}
