class Node{
  float x, y;
  boolean touched;
  Node(float _x, float _y){
    x=_x;
    y=_y; 
    touched = false;
  }
  void setTouched(){
    touched = true;
  }
}

class Edge{
  Node n1;
  Node n2;
  Edge(Node _n1, Node _n2){
    n1=_n1;
    n1.setTouched();
    n2=_n2;
    n2.setTouched();
  } 
}

int w = 700;
int h = 700;
int num_nodes = 10;
int num_edges = 20;
int node_size = 20;

Node[] nodes = new Node[num_nodes];
Edge[] edges = new Edge[num_edges];

void setup(){
  size(w, h);
  background(#4B0078);
  stroke(#A000FF);
  strokeWeight(5);
  fill(#4B0078);
  
 for(int i=0; i<num_nodes; i++){
    float x = random(w);
    float y = random(h);
    nodes[i] = new Node(x, y);
    ellipse(nodes[i].x, nodes[i].y, 20, 20);
  }
  for(int i=0; i<num_edges; i++){
     int n1 = (int)random(num_nodes-1);
     int n2 = (int)random(num_nodes-1);
     edges[i] = new Edge(nodes[n1], nodes[n2]);
     line(nodes[n1].x, nodes[n1].y, nodes[n2].x, nodes[n2].y);
     
     for(int j=0; j<i; j++){
      lineIntersection(edges[i], edges[j]);
    }
  }
  for(int i=0; i<num_nodes; i++){
     if(!nodes[i].touched){
       int n = (int)random(num_nodes-1);
       edges[i] = new Edge(nodes[i], nodes[n]);
       line(nodes[i].x, nodes[i].y, nodes[n].x, nodes[n].y);
     } 
  }
  
  //have to draw circles last so the lines don't cross them
  for(int i=0; i<num_nodes; i++){
    ellipse(nodes[i].x, nodes[i].y, node_size, node_size);
  }
}

//takes in two edges and draws a circle where they intersect
//Adapted from http://wiki.processing.org/w/Line-Line_intersection
void lineIntersection(Edge e1, Edge e2)
{
  Node p1 = e1.n1;
  Node p2 = e1.n2;
  Node p3 = e2.n1;
  Node p4 = e2.n2;
  
  float bx = p2.x - p1.x;
  float by = p2.y - p1.y;
  float dx = p4.x - p3.x;
  float dy = p4.y - p3.y; 
  //cross product of vectors
  float b_cross_d = bx*dy - by*dx;
  //check if parallel
  if(b_cross_d == 0) {
    return;
  }
  float cx = p3.x - p1.x; 
  float cy = p3.y - p1.y;
  //calculate offset of intersection with respect to p1
  float t = (cx*dy - cy*dx) / b_cross_d;
  float u = (cx*by - cy*bx) / b_cross_d;
  if(t < 0 || t > 1 || u < 0 || u > 1){
    return;
  }
 
  //draw node at intersection
  ellipse(p1.x+t*bx, p1.y+t*by, node_size, node_size); 
}
