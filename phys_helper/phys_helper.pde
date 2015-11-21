import controlP5.*;
ControlP5 cp5;

public enum Mode {
  MAINMENU, SIMULATION, GRAPH, UNITCONV, EQCALC
}

Mode mode;

void setup() {
  size(432, 768);
  cp5 = new ControlP5(this);
  mode = Mode.MAINMENU;
  drawMenu();
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
      //draw graph UI
      break;
    case UNITCONV:
      //draw converter UI
      break;
    case EQCALC:
      //draw calculations UI
      break;
  }
}

void controlEvent(ControlEvent event) {
  // use if necessary
}