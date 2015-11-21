public void drawSim() {
  // Draws the pause button
  cp5.addButton("sim_to_menu").setCaptionLabel("Menu")
    .setSize(width/2, 25)
    .setPosition(0, height - 25)
    .setColor(new CColor(0xff007f00, 0xff009900, 0xff006600, 0xffffffff, 0xfffffff));
    
  cp5.addButton("sim_pause").setCaptionLabel("Pause")
    .setSize(width/2, 25)
    .setPosition(width/2, height - 25)
    .setColor(new CColor(0xff007f00, 0xff009900, 0xff006600, 0xffffffff, 0xfffffff));
}

public void sim_to_menu() {
  cp5.dispose();
  cp5 = new ControlP5(that);
  
  mode = Mode.MAINMENU;
  drawMenu();
}

public void sim_pause() {
  paused = !paused;
}