void setup(){
  size(500, 500);
  background(#ffffff);

  int num_lines = 200;
  int x=0;
  int y=500;
  for(int i=0; i<num_lines; i++){
    float opacity = random(75, 100);
    stroke(#E80C7A, opacity);
    strokeWeight(random(0.5, 5));
    line(x, 0, x, 500);
    x=x+3;
    line(0, y, 500, y);
    y=y-3;
  }
}
