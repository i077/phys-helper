import controlP5.*;

ControlP5 cp5;

public enum Mode {
  MAINMENU, SIMULATION, GRAPH, UNITCONV, EQCALC
}

Mode mode;

void setup() {
  size(432, 768);
  mode = Mode.MAINMENU;
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
      //draw graph UI
      break;
    case UNITCONV:
      drawUnitConverterUI();
      break;
    case EQCALC:
      //draw calculations UI
      break;
  }
}
