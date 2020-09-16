import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 
import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Digital_design_Spilprojekt extends PApplet {


GameSystem gameSystem;
Background b;

public void setup() {
  frameRate(60);
  
  gameSystem = new GameSystem(this);
  b = new Background();
}

public void draw() {
  background(200);
  b.display();
  gameSystem.run();
}

public void mousePressed () {
  //gameSystem.eggs.add(new Egg(mouseX,mouseY));
  gameSystem.eggs.add(new Egg(random(0,width), 0));
  //gameSystem.meteorer.add(new Meteor(random(width), 0));
  //gameSystem.meteorer.add(new Meteor(mouseX,mouseY));
}

public void keyPressed() {
  if (key == 'r' || key == 'R' ) {
    println("Reset");
    frameCount = -1;
  }
}

class Background {
  PVector vandloc;
  PVector soloc;

  Background() {
    vandloc = new PVector(-1, height/1.9f);
    soloc = new PVector (100, height/1.40f);
  }

  public void display() {
    line(vandloc.x, vandloc.y+150, width, vandloc.y+150);

   // println(frameRate);


    
    //planet med måne i omkreds
    fill(100);
    pushMatrix();
    translate(width-100, 50);

    rotate(frameCount*0.1f);

    ellipse(0, 0, 30, 30);
    ellipse(20, 20, 10, 10);
    popMatrix();

    //bakken til vandfaldet
    stroke(0);
    strokeWeight(0);
    fill(139, 69, 19, 200);
    rect(vandloc.x, vandloc.y, 30, 150, 0, 100, 0, 0);  

    //sø
    fill(35,137,218);
    ellipse(soloc.x, soloc.y, 150, 30);

    //vandfaldet
    noFill();
    stroke(90, 188, 216);
    strokeWeight(30);
    bezier(vandloc.x, vandloc.y-15, 60, vandloc.y-30, 40, 500, vandloc.x+40, vandloc.y+140);

  }
}
// TODO: Mangler vel også en run metode der kalder på update og display metdoerne!
class Default {
  PVector loc;
  PVector vel;
  PVector acc;

  float scl;


  Default () {
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167f);

    scl = (height+width)*0.1f;
  }

  Default (float pos_x, float pos_y) {
    loc = new PVector(pos_x, pos_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    scl = (height+width)*0.1f;
  }
}
class Dino extends Default {

  
  int liv;

  ArrayList<Egg> eggs;

  PVector loc;
  PVector vel;
  PVector acc;

  boolean touchGround;

  float speed;
  float scl;

  PImage dinoMundRight;
  PImage dinoMundLeft;
  PImage dinoBack;

  Dino() {
    super();
    liv = 3;

    dinoMundRight = loadImage("../Ressources/dinoMundRight.png");
    dinoMundLeft = loadImage("../Ressources/dinoMundLeft.png");
    dinoBack = loadImage("../Ressources/dinoBack.png");
    loc = new PVector(width/3, height/3);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0.1f);

    scl = (height + width)/10;

    touchGround = false;
    speed = 3;
  }

  public void collisionWithEggs(ArrayList<Egg> eggs) {
    for (Egg egg : eggs) {
      // Jeg tager gennemsnittet af x længden og y længden af ægget, da ægget er en ellipse og ikke en cirkel.
      // Vi må lige finde ud af hvordan det kan gøres bedre!
      // Grunden til at der divideres med 3 er fordi vi gerne vil have fat i selve "radius"
      float minimumDist = (egg.eggSizeX + egg.eggSizeY) / 4 + scl / 3;
      float actualDist  = dist(egg.loc.x, egg.loc.y, loc.x, loc.y);

      // Af en eller anden grund så kolliderer ægget to gange så derfor tjekker vi boolean variablen swallowed
      // for at se om Dino'en har ramt ægget eller ej!
      boolean hitAlready = !egg.swallowed;

      if (actualDist < minimumDist && hitAlready) {
        //Ægget står stille når man får point
        egg.acc.mult(0);
        egg.vel.mult(0);
        // Vi skal huske at sørge for at ægget forsvinder og vi "incrementer" scoren!
        egg.swallow();
        gameSystem.incrementScore();
        gameSystem.ding.play();
      }
    }
  }

  public void display() {
    stroke(0);
    strokeWeight(0);
    fill(0);

    stroke(0);
    strokeWeight(0);
    //Dino billede
    imageMode(CENTER);
    if ( keyCode == RIGHT ) image(dinoMundRight ,loc.x,loc.y,scl,scl);
    else if ( keyCode == LEFT ) image(dinoMundLeft ,loc.x,loc.y,scl,scl);
    else image(dinoBack ,loc.x,loc.y,scl*0.6f,scl);
    imageMode(CORNER);
  }

  public void update() {
    collisionWithEggs(eggs);

    // Tilføj kun tyngdekraft når vi har ramt jorden!
    if (!touchGround) vel.add(acc);
    loc.add(vel);

    // Der skal være en maksimum fart hen af x-aksen, som lige nu er på de 3
    if (abs(vel.x) > 3) vel.x = vel.x > 0 ? 3 : -3;

    move();

    hitGround();
    //println(vel);
  }

  public void run(ArrayList<Egg> eggs) {
    // Jeg bliver nødt til at bruge "this." her, da jeg gerne vil referere til "eggs"
    // variablen i det globale scope, håber i forstår ellers spørg i bare!
    this.eggs = eggs;

    update();
    display();
  }

  public void hitGround() {
    if (loc.y > height - scl / 2) {
      touchGround = true;
      loc.y = height - scl / 2;
    } else touchGround = false;
  }

  public boolean isDead () {
    return liv <= 0;
  }

  public void move() {
    if (keyPressed && keyCode == LEFT) vel.add(new PVector(-speed, 0));
    else if (keyPressed && keyCode == RIGHT) vel.add(new PVector(speed, 0));
    else vel.x = 0;

    if (keyPressed && keyCode == UP && touchGround) { 
      vel.add(new PVector(0, -speed));
    }
  }
}
class Egg extends Default {
  // Vi bruger ikke billedet til noget !!!
  PImage img; 

  float lifespan;

  boolean swallowed;
  boolean touchGround;

  float eggSizeX = scl;
  float eggSizeY = scl;

  Egg (float loc_x, float loc_y) {
    // Vi bruger ikke billedet til noget !!!
    //img = loadImage("../Ressources/Egg.png");
    lifespan = 255;
    swallowed = false;

    eggSizeX = width/50;
    eggSizeY = height/30;
    touchGround = false;

    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167f);
  }

  public void display () {
    // Fjerner alpha'en så det ser ud som om den forsvinder lidt efter lidt.
    // Dette sker kun når swallow() metoden er blevet kaldt
    if (swallowed) lifespan -= 5;
    noStroke();
    fill(255, 223, 0, lifespan);
    ellipse(loc.x, loc.y, eggSizeX, eggSizeY);
  }

  public void update () {
    vel.add(acc);
    loc.add(vel);
  }

  public void run() {
    update();
    display();
  }

  public void swallow() {
    swallowed = true;
  }
}

/*
 GameSystem klassen indeholder alle spil objekter
 og holder styr på selve spil systemet (point, liv, osv.)
*/

class GameSystem {
  Dino dino;
  Heart heart;
  Timer timer;

  SoundFile ding;

  ArrayList<Egg> eggs;
  ArrayList<Meteor> meteorer;
  
    int score;


  GameSystem(PApplet ding_) {
    ding = new SoundFile(ding_,"../Ressources/Ding.mp3");

    score = 0;
    this.eggs = new ArrayList<Egg>();
		// Bliver ikke brugt endnu
    this.meteorer = new ArrayList<Meteor>();

    this.dino = new Dino();
    this.timer = new Timer(width/2, 0, 10);
    this.heart = new Heart(0, 0, (height+width) * 0.05f, dino.liv);
  }

	public void incrementScore() {
		score++;
	}

  public void run() {
		//println(score);
    dino.run(eggs);
    timer.run();
    heart.display();

		fill(0);
		textSize(24);
		text("Score: " + score, width * 0.75f, height * 0.0725f);


    for (Egg egg : (ArrayList<Egg>) eggs.clone()) {
      if (egg.loc.y > height) eggs.remove(egg);
      egg.run();
		}
  }
}
class Heart {

  PImage heart = loadImage("../Ressources/Heart.png");
  int liv;
  PVector loc;
  float heartSize;

  Heart() {
    loc = new PVector(0, 0);
    heartSize = (height+width)*0.1f;
    liv = 3;
  }

  Heart (float pos_x, float pos_y, float size_, int liv_) {
    loc = new PVector(pos_x, pos_y);
    heartSize = size_;
    liv = liv_;
  }


  public void display () {
    for (int i = 0; i < liv; i++) {
      image(heart, loc.x + heartSize*i, loc.y, heartSize, heartSize);
    }
  }
}
class Meteor {
  PImage muneb = loadImage("../Ressources/Meteor.png");

  PVector loc;
  PVector vel;
  PVector acc;

  boolean touchGround;
  float meteorSize;

  Meteor (float loc_x, float loc_y) {
    meteorSize = width/20;
    touchGround = false;

    loc = new PVector(loc_x, loc_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167f);
  }
  
   public void update () {
    vel.add(acc);
    loc.add(vel);
  }

	public void run() {
		update();
    display();
	}	

  public void display () {
    noStroke();
    fill(220);
    image(muneb,loc.x, loc.y, meteorSize, meteorSize);
  }
}
class Timer {

  int startSek;
  int sek;

  PVector loc;

  float timerSize;
  float a = frameRate;

  boolean deathMode;

  Timer () {
    timerSize = (width + height) * 0.1f;
    loc = new PVector(0, 0);
    startSek = 10;
    sek = 10;
    deathMode = false;
  }

  Timer (float loc_x, float loc_y, int a) { 
    timerSize = (width + height) * 0.1f;
    loc = new PVector(loc_x, loc_y + timerSize);
    startSek = a;
    sek = a;
    deathMode = false;
  }

  public void update () {
    countDown();
  }

  public void display () {
    textAlign(CENTER);
    textSize(timerSize);

    if (deathMode) { 
      fill(0, 200, 0);

      //println("Eggs");
      gameSystem.eggs.add(new Egg(random(0, width)*frameCount/50, 0));
    }
    if (!deathMode) {
      fill(200, 0, 0);
      //println("No eggs");
    }
    text(sek, loc.x, loc.y);
  }

  public void run() {
    update();
    display();
  }

  public void countDown() {
    a--;
    if (a < 0) {
      a = frameRate;
      sek -= 1;
    }

    if ( sek <= 0 && !deathMode ) {
      sek = startSek;
      deathMode = true;
    } 
    if (sek <= 0 && deathMode) {
      sek = startSek;
      deathMode = false;
    }
  }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Digital_design_Spilprojekt" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
