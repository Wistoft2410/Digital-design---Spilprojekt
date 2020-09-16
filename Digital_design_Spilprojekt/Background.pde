
class Background {
  PVector vandloc;
  PVector soloc;

  Background() {
    vandloc = new PVector(-1, height/1.9);
    soloc = new PVector (100, height/1.40);
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    line(vandloc.x, vandloc.y+150, width, vandloc.y+150);

    // println(frameRate);

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
    fill(35, 137, 218);
    ellipse(soloc.x, soloc.y, 150, 30);

    //vandfaldet
    noFill();
    stroke(90, 188, 216);
    strokeWeight(30);
    bezier(vandloc.x, vandloc.y-15, 60, vandloc.y-30, 40, 500, vandloc.x+40, vandloc.y+140);

    //vulkan
    noFill();
    pushMatrix();
    stroke(255, 102, 0);
    strokeWeight(5);
    noFill();
    translate(width/2, height/1.7);
    curve(0, -100, 0, 0, 100, 0, 100, -100);
    curve(0, -100, 0, 0, -100, 100, -400, 100);
    curve(200, 0, 100, 0, 200, 100, 400, 100);
    fill(255, 102, 0);
    beginShape();
    vertex(-90, 100);
    vertex(-45, 75);
    vertex(0, 0);
    vertex(18, 13);
    vertex(91, 12);
    vertex(100, 0);
    vertex(135, 60);
    vertex(200, 100);
    endShape();
    popMatrix();

  }
}
