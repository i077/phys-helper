public void drawMenu() {
  ArrayList<String> items = new ArrayList<String>();
  items.add("Simulation");
  items.add("Graph");
  items.add("Unit Conversion");
  items.add("Equation Calculator");
  
  cp5.addScrollableList("menuoptions").setType(ScrollableList.LIST).setBarVisible(false)
    .setPosition(0, 216)
    .setSize(width, height - 54)
    .setBarHeight(0)
    .setItemHeight(100)
    .setBackgroundColor(0x00cc00)
    .addItems(items);
}

public void menuoptions(int index) {
  cp5.dispose();
  switch (index) {
    case 0:
      mode = Mode.SIMULATION;
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