public ArrayList<Object> objects;
public ArrayList<Warp> warps;
public SimObject selected;
public boolean paused;

public void drawSim() {
  addPrimary();
  
  objects = new ArrayList<Object>();
  warps = new ArrayList<Warp>();
  
  paused = false;
  sim_pause();
}

public void addPrimary() {
  cp5.addButton("sim_to_menu").setCaptionLabel("Menu")
    .setSize(width/2, 25)
    .setPosition(0, height - 25)
    .setColor(new CColor(0xff007f00, 0xff009900, 0xff006600, 0xffffffff, 0xfffffff));
    
  cp5.addButton("sim_pause").setCaptionLabel("Pause")
    .setSize(width/2, 25)
    .setPosition(width/2, height - 25)
    .setColor(new CColor(0xff007f00, 0xff009900, 0xff006600, 0xffffffff, 0xfffffff));
}

void mouseClicked() {
  if (mode == Mode.SIMULATION && paused) {
    for (Object o : objects) {
      if (sq(o.position.x - mouseX) + sq(o.position.y - mouseY) <= sq(o.radius)) {
        selected = o;
      }
    }
    for (Warp w : warps) {
      if (sq(w.position.x - mouseX) + sq(w.position.y - mouseY) <= sq(w.radius)) {
        selected = w;
      }
    }
  }
}

public void sim_to_menu() {
  objects = null;
  warps = null;
  
  cp5.dispose();
  cp5 = new ControlP5(that);
  
  mode = Mode.MAINMENU;
  drawMenu();
}

public void sim_pause() {
  if (paused) {
    removePauseButtons();
  } else {
    cp5.get(Button.class, "sim_pause").setCaptionLabel("Unpause");
    addPauseButtons();
  }
  
  paused = !paused;
}

public void addPauseButtons() {
  cp5.addButton("add_object").setCaptionLabel("Add Object")
    .setSize(width/2, 25)
    .setPosition(0, 0)
    .setColor(new CColor(0xff007f00, 0xff009900, 0xff006600, 0xffffffff, 0xfffffff));
  cp5.addButton("add_warp").setCaptionLabel("Add Warp")
    .setSize(width/2, 25)
    .setPosition(width/2, 0)
    .setColor(new CColor(0xff007f00, 0xff009900, 0xff006600, 0xffffffff, 0xfffffff));
}

public void removePauseButtons() {
  cp5.dispose();
  cp5 = new ControlP5(that);
  addPrimary();
}

public void add_object() {
  objects.add(new Object(width/2, height/2, 50));
}

public void add_warp() {
  warps.add(new Warp(width/2, height/2));
}