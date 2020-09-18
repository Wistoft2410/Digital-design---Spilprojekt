import processing.sound.*;
PrintWriter output;
GameSystem gameSystem;
Menu menu;

Timer gameovertid;

void setup() {
  gameovertid = new Timer(2);
  output = createWriter("highscore.xml"); 
  output.flush();
  output.close();
  frameRate(60);
  size(800, 800);
  gameSystem = new GameSystem(this, this, this);
  menu = new Menu();     
  gameSystem.music.loop(1, 0.5);
}

void draw() {
  background(255, 255, 204); 
  game();
}

//void mousePressed() {
//  println(mouseX, mouseY);
//}

void keyPressed() {
  gameSystem.dino.recordKeys(keyCode, true);
  restart();
}

// Det her er for Dino klasen så den kan bevæge sig bedre!
void keyReleased() {
  gameSystem.dino.recordKeys(keyCode, false);
}

void restart () {
  if (key == 'r' || key == 'R' ) {
    frameCount = -1;

    // Når vi genstarter programmet så skal musik lydfilen stoppes,
    // da vi ikke vil gentage musikken 2, 3, 4 ... n gange!
    gameSystem.music.stop();
  }
}

void game() {
  if (menu.startKnap.on) menu.update();
  else if (!menu.startKnap.on) gameSystem.run();

  if (gameSystem.gameOver()) {
    if ( gameovertid.sek > 0 ) {
      background(0);
      text("Game Over",width/2,height/2);
      gameovertid.sek -= 0.0167;
    } else {
      gameSystem = new GameSystem(this, this, this);
      menu.startKnap.on = true;
    }
  }
}
