
import controlP5.*;
int n;
ControlP5 cp5;

public enum Mode {
  MAINMENU, SIMULATION, GRAPH, UNITCONV, EQCALC
}

Mode mode;

void setup() {
  size(432, 768);
  mode = Mode.GRAPH;
  cp5 = new ControlP5(this);
}

void draw() {
  switch (mode) {
    case MAINMENU:
      //draw main menu
      break;
    case SIMULATION:
      //draw sim UI
      break;
    case GRAPH:
    
    if(n==0){
     sets();
     n=1;
    }
     background(255);
     drawTaskbar();
     drawGraph();
     selectOption();
     drawEquation();
     setAxis();
      break;
    case UNITCONV:
      //draw converter UI
      break;
    case EQCALC:
      //draw calculations UI
      break;
  }
}