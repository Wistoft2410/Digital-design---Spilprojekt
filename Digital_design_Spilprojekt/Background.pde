
class Background {
  PVector vandloc;
  PVector soloc;


  Psystem ps;

  Background() {
    vandloc = new PVector(-width/width, height/1.9);
    soloc = new PVector (width*0.125, height/1.40);
    ps = new Psystem(new PVector(width*0.075, height*0.7075), new PVector(width/2+50, height/2.68));
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    line(vandloc.x, vandloc.y+150, width, vandloc.y+150);

     //himmel
    fill(135, 206, 235);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, width, height*0.5);

    //tree
    int t = 50;
    while (t <=width) {
      pushMatrix();
      translate(100+t, height*0.6875);
      fill(118, 92, 72);
      rectMode(CENTER);
      rect(t, 0, width*0.03125, height*0.0625);
      fill(58, 95, 11);
      ellipse(t, -width*0.05, height*0.05625, height*0.05);
      t+=width*0.0375;
      popMatrix();
    } 

    //planet med måne i omkreds
    fill(100);
    pushMatrix();
    translate(width*0.875, height*0.0625);
    rotate(frameCount*0.1);
    ellipse(0, 0, width*0.05, height*0.05);
    ellipse(width*0.03125, height*0.03125, width*0.025, height*0.025);
    popMatrix();

    //bakken til vandfaldet
    stroke(0);
    strokeWeight(0);
    fill(139, 69, 19, 200);
    rect(vandloc.x + width*0.01875, vandloc.y + height*0.0925, width*0.0375, height*0.1875);  

    //sø
    fill(35, 137, 255);
    ellipse(soloc.x, soloc.y, 150, 30);

   //bjerge
    int b = 0;
    while (b <=width) {
      pushMatrix();
      stroke(139,69,19);
      fill(139,69,19);
      translate(3+b, 400);
      triangle(0+b, 0, 40+b, -50, 80+b, 0); 
      b+=30;
      popMatrix();
    }

    //vulkan
    noFill();
    pushMatrix();
    stroke(155, 118, 83);
    strokeWeight(5);
    noFill();
    translate(width/2, height/2.68);
    curve(0, -100, 0, 0, 100, 0, 100, -100);
    curve(0, -100, 0, 0, -100, 100, -400, 100);
    curve(200, 0, 100, 0, 200, 100, 400, 100);
    fill(155, 118, 83);
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

   

    //vandfaldet
    noFill();
    stroke(0, 191, 255);
    strokeWeight(30);
    bezier(vandloc.x, vandloc.y-15, 60, vandloc.y-30, 40, 500, vandloc.x+40, vandloc.y+140);


    //Partikel system
    ps.run();
  }
}
