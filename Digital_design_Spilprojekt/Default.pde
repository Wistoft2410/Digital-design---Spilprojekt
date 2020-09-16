// TODO: Mangler vel også en run metode der kalder på update og display metdoerne!
class Default {
  PVector loc;
  PVector vel;
  PVector acc;

  float scl;


  Default () {
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, height*0.000167);

    scl = (height+width)*0.1;
  }

  Default (float pos_x, float pos_y) {
    loc = new PVector(pos_x, pos_y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    scl = (height+width)*0.1;
  }
}
