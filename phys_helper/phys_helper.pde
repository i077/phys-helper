import controlP5.*;
ControlP5 cp5;

public enum Mode {
  MAINMENU, SIMULATION, GRAPH, UNITCONV, EQCALC
}

PApplet that;
Mode mode;

void setup() {
  size(432, 768);
  
  that = this;
  cp5 = new ControlP5(that);
  
  mode = Mode.MAINMENU;
  drawMenu();
}

void draw() {
  switch (mode) {
    case MAINMENU:
      background(204, 255, 204);
      break;
    case SIMULATION:
      background(204, 255, 204);
      for (Object o : objects) {
        o.update(paused);
        o.draw(paused);
      }
      for (Warp w : warps) {
        w.update();
        w.draw();
      }
      break;
    case GRAPH:
      background(204, 255, 204);
      break;
    case UNITCONV:
      background(204, 255, 204);
      break;
    case EQCALC:
      background(204, 255, 204);
      break;
  }
}

void controlEvent(ControlEvent event) {
  // use if necessary
}