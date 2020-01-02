float r;
float factor;
float total;
float delta = 0.04;
int red = 255;
int green = 255;
int blue = 255;
int frames;

void setup(){
  size(1080, 1080);
  r = height / 2;
  factor = 1;
  total = 255;
  frames = 0;
  strokeWeight(3);
}

PVector getVector(float index, float total){
  float angle = map(index % total, 0, total, 0, TWO_PI);
  PVector vector = PVector.fromAngle(angle + PI/2);
  vector = vector.mult(r);
  return vector;
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  stroke(255);
  noFill();
  circle(0, 0, r*2);
  
  for (int i = 0; i < total; i++){
    PVector v = getVector(i, total);
    fill(255);
    circle(v.x, v.y, 4);
  }
  
  for (int i = 0; i < total; i++){
    PVector a = getVector(i, total);
    PVector b = getVector(i * factor, total);
    if (i <= total/3){
      stroke(255 - 3 * i, 3 * i, 0, i);
    }
    else if (i <= 2 * total / 3){
      stroke(0, 510 - 3 * i, 3 * i - 255, i);
    }
    else{
      stroke(3 * i - 510, 0, 765 - 3 * i, i);
    }
    line(a.x, a.y, b.x, b.y);
  }
  if (factor >= 6){
    delta = -0.08;
  }
  if (factor <= 1){
    print(frames);
    stop();
  }
  factor += delta;
  frames += 1;
  saveFrame("ouput\\gif-" + frames + ".png");
}
