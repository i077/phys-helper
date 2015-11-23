import controlP5.*;

ControlP5 cp5;

public enum Mode {
  MAINMENU, SIMULATION, GRAPH, UNITCONV, EQCALC
}
PApplet that;
Mode mode;

void setup() {
  size(432, 768);
  that=this;
  mode = Mode.MAINMENU;
  cp5 = new ControlP5(that);
  drawMenu();
}

void draw() {
  switch (mode) {
    case MAINMENU:
    background(204,255,205);
      //draw main menu
      break;
    case SIMULATION:
      //draw sim UI
      break;
    case GRAPH:
      drawGraphs();
      break;
    case UNITCONV:
      drawUnitConverterUI();
      break;
    case EQCALC:
      equations();
      break;
  }
}