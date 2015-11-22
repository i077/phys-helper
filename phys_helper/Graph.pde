ScrollableList Tlist;
Textfield input2;
Textfield input3;
boolean runGraphSetup = false;
ArrayList stuff = new ArrayList();
//which equation/equation mode
int equation;
void sets() {
  textSize(12);
  input2 = new Textfield(cp5, "");
  input3 = new Textfield(cp5, "mass (unfinished)");
  Tlist = new ScrollableList(cp5, "Taskbar"); 
  stuff.add("TaskBar");
  stuff.add("Position vs. Time");
  stuff.add("Velocity vs. Time");
  stuff.add("Acceleration vs. Time");
  stuff.add("Static Friction vs. Force");
  Tlist.addItems(stuff);
  runGraphSetup = true;
}

void drawGraphs() {
  if (!runGraphSetup) sets();
  background(255);
  drawTaskbar();
  drawGraph();
  selectOption();
  drawEquation();
  setAxis();
}

void drawTaskbar() {
  fill(0);
  rect(0, height-height/3, width, height/3);


  Tlist.setItemHeight(30);
  Tlist.setPosition(0, height-height/3);
  Tlist.setSize(125, 200);
}


void drawGraph() {
  stroke(0);
  fill(255);
  rect(50, 20, width-72, height-height/2.5);
  //increments of 10
  for (int i=0; i<width-62; i++) {

    if (i%30==0) {
      line(i+50, 20, i+50, height-height/2.5+20);
      fill(0);
      textSize(10);
      text(i, i+47, height-height/2.5+35);
      textSize(12);
    }
    if (i%10==0) {
      rect(i+50, 20+(height-height/2.5), 1, 2);
    }
  }
  for (int y=0; y<height-height/2.5; y++) {
    if (y%20==0) {
      line(50, y+20, width-22, y+20);
      fill(0);
      textSize(10);
      text(int((height-height/2.5)-y), 20, y+25);
      textSize(12);
    }
    if (y%10==0) {
      rect(48, y+20, 2, 1);
    }
  }
}

void drawEquation() {
  //equation 1 change in x over time

  if (equation==1) {
    stroke(255);

    text( "Change in position= time * velocity", int(width/3), height-height/3.2);
    float v;
    
    if (float(input2.getText())<=1) {
      v=1/float(input2.getText());
    } else {
      v=float(input2.getText());
    }
    for (float i= 0; i<=360*v; i=i+1/v) {
      if (20+ height-height/2.5-i*float(input2.getText())>=20 && 50+i<width-22 ) {
        fill(255, 0, 0);
        stroke(255, 0, 0);
        point(50+i, 20+ height-height/2.5-i*float(input2.getText()));
        stroke(0);
      }
    }
  }
  //equation 2
  if (equation==2) {
    stroke(255);
    fill(255);
    text( "Velocity= acceleration*time", int(width/3), height-height/3.2);
    float v;
    if (float(input2.getText())<=1) {
      v=1/float(input2.getText());
    } else {
      v=float(input2.getText());
    }
    for (float i= 0; i<=360*v; i=i+1/v) {
      if (20+ height-height/2.5-i*float(input2.getText())>=20 && 50+i<width-22 ) {
        fill(255, 0, 0);
        stroke(255, 0, 0);
        point(50+i, 20+ height-height/2.5-i*float(input2.getText()));
        stroke(0);
      }
    }
  }
  //equation 3
  if (equation==3) {
    stroke(255);
    float v;
    if(float(input2.getText())<=1){
     v=1/float(input2.getText());
    }
    else{
      v=float(input2.getText());
    }
    text( "Acceleration= change in velocity/time", int(width/3), height-height/3.2);
    for (float i= 0; i<=360*v; i=i+1/v) {
      if (20+ height-height/2.5-i/float(input2.getText())>=20 && i<360) {
        fill(255, 0, 0);
        stroke(255, 0, 0);
        point(50+i, 20+ height-height/2.5-i/float(input2.getText()));
        stroke(0);
      }
    }
  }
  //equation 4
  if (equation==4) {
    fill(255);
    text( "Static Friction = Mu(static friction)*Force Applied", int(width/3), height-height/3.2);
    float v;
    
    if (float(input2.getText())<=1) {
      v=1/float(input2.getText());
    } else {
      v=float(input2.getText());
    }
    for (float i= 0; i<=360*v; i=i+1/v) {
      if (20+ height-height/2.5-i*float(input2.getText())>=20 && 50+i<width-22 ) {
        if(20+ height-height/2.5-i*float(input2.getText())<=float(input3.getText())*float(input2.getText())*9.8){
        fill(255, 0, 0);
        stroke(255, 0, 0);
        point(50+i, 20+ height-height/2.5-i*float(input2.getText()));
        stroke(0);
        }
        else{
           fill(255, 0, 0);
        stroke(255, 0, 0);
        point(50+i, 20+ height-height/2.5-i*float(input2.getText())*float(input3.getText())*9.8);
        stroke(0);
        }
      }
    }
  }
  //equation 5
  
}

void selectOption() {
  input3.setSize(100,20);
  input3.setPosition(-width/3, -height-height/3.4);
  input2.setHeight(100);
  if (Tlist.getValue()==0) {
    input2.setPosition(-5000, 0);
  }

  //if mouse is over equation 1
  if (Tlist.getValue()==1) {
    equation=1;
    fill(255);
    text("Velocity: ", int(width/4.6), height-210);
    input2.setPosition(width/3, height-height/3.4);
    input2.setSize(100, 20);
  }
  //if mouse is over equation 2
  if (Tlist.getValue()==2) {
    equation=2;
    fill(255);
    text("Acceleration: ", int(width/4.6)-30, height-210);
    input2.setPosition(width/3, height-height/3.4);
    input2.setSize(100, 20);
  }
  //if mouse is over equation 3
  if (Tlist.getValue()==3) {
    equation=3;
    fill(255);
    text("Change in velocity: ", int(width/4.6)-60, height-210);
    input2.setPosition(width/3, height-height/3.4);
    input2.setSize(100, 20);
  }
  //if mouse is over equation 4
  if (Tlist.getValue()==4) {
    equation=4;
    fill(255);
    text("Mu (static friction): ", int(width/4.6)-65, height-210);
    input2.setPosition(width/3, height-height/3.4);
    input2.setSize(100, 20);
    input3.setPosition(width/3,height-height/3.4+50);
  }
  //
}
void setAxis() {
  if (equation==1) {
    fill(0);
    text("Time (seconds)", width/2.2, height-height/2.96);
    translate(width/2, height/2);
    rotate(radians(90));
    text("Change in position (meters)", -200, 210);
    rotate(radians(-90));
    translate(-width/2, -height/2);
  }
  if (equation==2) {
    fill(0);
    text("Time (seconds)", width/2.2, height-height/2.96);
    translate(width/2, height/2);
    rotate(radians(90));
    text("Velocity (meters/second)", -200, 210);
    rotate(radians(-90));
    translate(-width/2, -height/2);
  }
  if (equation==3) {
    fill(0);
    text("Time (seconds)", width/2.2, height-height/2.96);
    translate(width/2, height/2);
    rotate(radians(90));
    text("Acceleration (meters/second^2)", -200, 210);
    rotate(radians(-90));
    translate(-width/2, -height/2);
  }
  if (equation==4) {
    fill(0);
    text(" Force Applied (Newtons)", width/2.2, height-height/2.96);
    translate(width/2, height/2);
    rotate(radians(90));
    text("Static Friction (Newtons)", -200, 210);
    rotate(radians(-90));
    translate(-width/2, -height/2);
  }
}