/**
* LoopRecorder: A cillexia project by Christian Bietsch
* Website: www.cillexia.net
*/

// ========== RECORD SETTINGS ==========
static final int TOTAL_FRAMES = 240;    // Total frames to record
static boolean RECORD = false;          // record
static final String NAME = "anima";     // name
static final String FORMAT = "png";     // formate

int counter = 0;                        // counts frames

void setup() {
  size(400, 400);  // image size
}

//** File name: folder/name.format */
final String fileName() { return NAME+"/"+NAME+nf(counter,4)+"."+FORMAT; }

void draw() {
  final float progress = RECORD ? float(counter) / TOTAL_FRAMES : float(counter % TOTAL_FRAMES) / TOTAL_FRAMES;
  draw(progress);
  if (RECORD && counter == 0) { println("Start to record: "+ NAME); }
  if (RECORD) { saveFrame(fileName()); }
  counter++;
  if (RECORD) { println("Save: "+ counter +"/"+TOTAL_FRAMES); }
  if (RECORD && counter == TOTAL_FRAMES) { println("DONE"); exit(); }
}

/** Draws each anima frame with progress [0.0...1.0-frame] (Never reaches 1.0, since this is the beginning of the next cycle) */
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
  // frame
  fill(200);
  textSize(width*0.04);
  textAlign(CENTER, CENTER);
  text("frame: "+nf(float(counter % TOTAL_FRAMES))+"/"+TOTAL_FRAMES, 0, height*0.1);
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
