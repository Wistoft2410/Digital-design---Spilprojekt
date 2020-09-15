
class Background {
  PVector vandloc;
  PVector soloc;

  Background() {
    vandloc = new PVector(-1, height/1.9);
    soloc = new PVector (100, height/1.40);
  }

  void display() {
    line(vandloc.x, vandloc.y+150, width, vandloc.y+150);
    println(frameRate);

    
    //planet med måne i omkreds
    fill(100);
    pushMatrix();
    translate(width-100, 50);
    rotate(frameCount*0.1);
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
