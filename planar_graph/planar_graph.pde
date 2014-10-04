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

int w = 1920;
int h = 1080;
int num_nodes = 20;
int num_edges = 40;

Node[] nodes = new Node[num_nodes];
Edge[] edges = new Edge[num_edges];

void setup(){
  size(w, h);
  background(#4B0078);
  stroke(#A000FF); //change colours for various tumblr pics
  strokeWeight(5);
  fill(#4B0078);
  
 for(int i=0; i<num_nodes; i++){
    float x = random(w);
    float y = random(h);
    nodes[i] = new Node(x, y);
  }
  for(int i=0; i<num_edges; i++){
     int n1 = (int)random(num_nodes-1);
     int n2 = (int)random(num_nodes-1);
     edges[i] = new Edge(nodes[n1], nodes[n2]);
     line(nodes[n1].x, nodes[n1].y, nodes[n2].x, nodes[n2].y);
  }
  for(int i=0; i<num_nodes; i++){
     if(!nodes[i].touched){
       edges[i] = new Edge(nodes[i], nodes[0]);
       line(nodes[i].x, nodes[i].y, nodes[0].x, nodes[0].y);
     } 
    ellipse(nodes[i].x, nodes[i].y, 20, 20);
  }
  for(int i=0; i<num_nodes; i++){
    ellipse(nodes[i].x, nodes[i].y, 20, 20);
  }
}


