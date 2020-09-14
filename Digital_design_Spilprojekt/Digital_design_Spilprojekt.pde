
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
}

void keyPressed() {
  if (key == 'r') {
    println("Reset");
    frameCount =-1;
  }
}
