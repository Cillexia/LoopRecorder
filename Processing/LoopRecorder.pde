/**
* LoopRecorder: A cillexia project by Christian Bietsch
* Website: www.cillexia.net
*/

// ========== Settings ==========
int totalFrames = 240;    // Total frames to record
boolean record = false;   // record
String name = "anima";    // name
String format = "png";    // formate

int counter = 0;          // counts frames

void setup() {
  size(400, 400);  // image size
}

//** File name: folder/name.format */
String fileName() { return name+"/"+name+nf(counter,4)+"."+format; }

void draw() {
  final float progress = record ? float(counter) / totalFrames : float(counter % totalFrames) / totalFrames;
  draw(progress);
  if (record && counter == 0) { println("Start to record: "+ name); }
  if (record) { saveFrame(fileName()); }
  counter++;
  if (record) { println("Save: "+ counter +"/"+totalFrames); }
  if (record && counter == totalFrames) { println("DONE"); exit(); }
}

/** Draws each anima frame with progress [0.0...1.0] */
void draw(float progress) {
  // DEMO
  background(20);
  translate(width*0.5, height*0.5);
  // ring
  stroke(170);
  noFill();
  circle(0, 0, width*0.8);
  // ball
  PVector v = PVector.fromAngle(TWO_PI*progress-PI*0.5);
  v.mult(width*0.4);
  noStroke();
  fill(255);
  circle(v.x, v.y, width*0.03);
  // progress
  fill(255);
  textSize(width*0.06);
  textAlign(CENTER, CENTER);
  text("progress: "+nf(progress, 0, 4), 0, 0);
  // name
  fill(200);
  textSize(width*0.04);
  text("LoopRecorder Demo", 0, -height*0.46);
  // cillexia
  fill(200);
  textSize(width*0.04);
  text("cillexia", 0, height*0.44);
  // END OF DEMO
}
