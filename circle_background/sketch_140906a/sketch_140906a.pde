color[] palette = {
  #2B0045,
  #4E007D,
  #124D4F,
  #259A9C
};

float a = 40;
float b = 5;
float d = a - b;

void setup() {
  size(2000, 1500);
  smooth();
  background(#303030); //#303039 for a slightly more blue grey
  ellipseMode(CENTER);
  noStroke();
  //start at 20 to have the circle in the corner and not cut off
    for(float x = 20; x < width + a; x = x + a){
    for(float y = 20; y < height + a; y = y + a){
          // Color -- Blue
        int paletteRandom = int(random(palette.length));
        fill(palette[paletteRandom],200);      
        ellipse(x,y,d,d);
    }
  }
  save("circle_background.png");
}
