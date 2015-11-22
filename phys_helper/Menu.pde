public void drawMenu() {
  ArrayList<String> items = new ArrayList<String>();
  items.add("Simulation");
  items.add("Graph");
  items.add("Unit Conversion");
  items.add("Equation Calculator");
  
  cp5.addScrollableList("menuoptions")
    .setColor(new CColor(0xff007f00, 0xff009900, 0xff006600, 0xffffffff, 0xfffffff))
    .setType(ScrollableList.LIST)
    .setBarVisible(false)
    .setPosition(0, 385)
    .setSize(width, height - 54)
    .setBarHeight(0)
    .setItemHeight(96)
    .addItems(items)
    .getValueLabel().setSize(25)
    .alignX(ControlP5.CENTER);
}

public void menuoptions(int index) {
  cp5.dispose();
  cp5 = new ControlP5(that);
  
  switch (index) {
    case 0:
      mode = Mode.SIMULATION;
      drawSim();
      break;
    case 1:
      mode = Mode.GRAPH;
      break;
    case 2:
      mode = Mode.UNITCONV;
      break;
    case 3:
      mode = Mode.EQCALC;
      break;
  }
}