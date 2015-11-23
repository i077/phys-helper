ScrollableList eqlist; 
Textfield eqvar1;
Textfield eqvar2;
Textfield eqvar3;
Textfield eqvar4;
Textfield eqvar5;
boolean eqsetup;
ArrayList<PImage> equations;
void equations() {
  if(eqsetup==false){
    equationSetup(); 
  }
  background(204,255,204);
  //1 = kinematics
  //2 = F=ma
  //3 = fk=fnmu
  //4 = Fg=Gm1m2/d2
  //5 = W=Fcostx
  //6 = W=dK
  //7 = P=mgh

  int whichEq=1;
  whichEq=int(eqlist.getValue()+1);
  fill(0);
  stroke(0);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);

  switch(whichEq) {

  case 1:  
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(width/2,height/5-10,200,200);
    image(equations.get(0), width/2, height/10);
    image(equations.get(1), width/2, height/10+40);
    image(equations.get(2), width/2, height/10+90);
    image(equations.get(3), width/2, height/10+130);
    
    fill(0);
    text("Initial v", 40, height/3+30);
    text("Final v", 40, height/3+70);
    text("t", 40, height/3+110);
    text("a", 40, height/3+150);
    text("Δx", 40, height/3+190);

    text("m/s", 175, height/3+30);
    text("m/s", 175, height/3+70);
    text("s", 175, height/3+110);
    text("m/s/s", 175, height/3+150);
    text("m", 175, height/3+190);

    text(kinematics(eqvar1.getText(), eqvar2.getText(), eqvar3.getText(), eqvar4.getText(), eqvar5.getText()),width/2+100 ,height/2);

    break;

  case 2:  
    image(equations.get(4), width/2, height/8);

    text("F", 40, height/3+30);
    text("m", 40, height/3+70);
    text("a", 40, height/3+110);

    text("N", 175, height/3+30);
    text("kg", 175, height/3+70);
    text("m/s/s", 175, height/3+110);

    eqvar4.setText(" NULL");
    eqvar5.setText(" NULL");
    text(newton(eqvar1.getText(),eqvar2.getText(),eqvar3.getText()),width/2+100,height/2);
    break;

  case 3:  
    image(equations.get(5), width/2, height/8);

    text("fk", 40, height/3+30);
    text("μ", 40, height/3+70);
    text("Fn", 40, height/3+110);

    text("N", 175, height/3+30);
    text("", 175, height/3+70);
    text("N", 175, height/3+110);

    eqvar4.setText(" NULL");
    eqvar5.setText(" NULL");
    
    text(friction(eqvar1.getText(),eqvar2.getText(),eqvar3.getText()),width/2+100,height/2);

    break;

  case 4:  
    image(equations.get(6), width/2, height/8);

    text("Fg", 40, height/3+30);
    text("m1", 40, height/3+70);
    text("m2", 40, height/3+110);
    text("d", 40, height/3+150);

    text("N", 175, height/3+30);
    text("kg", 175, height/3+70);
    text("kg", 175, height/3+110);
    text("m", 175, height/3+150);

    eqvar5.setText(" NULL");

    text(gravitation(eqvar1.getText(),eqvar2.getText(),eqvar3.getText(), eqvar4.getText()),width/2+100,height/2);

    break;

  case 5:  
    image(equations.get(7), width/2, height/8);

    text("W", 40, height/3+30);
    text("F", 40, height/3+70);
    text("θ", 40, height/3+110);
    text("Δx", 40, height/3+150);

    text("J", 175, height/3+30);
    text("N", 175, height/3+70);
    text("degrees", 180, height/3+110);
    text("m", 175, height/3+150);

    eqvar5.setText(" NULL");
    
    text("Sorry, this is unfinished",width/2+100,height/2);

    break;

  case 6:  
    image(equations.get(8), width/2, height/8);

    text("W", 40, height/3+30);
    text("m", 40, height/3+70);
    text("Initial V", 40, height/3+110);
    text("Final V", 40, height/3+150);

    text("J", 175, height/3+30);
    text("kg", 175, height/3+70);
    text("m/s", 175, height/3+110);
    text("m/s", 175, height/3+150);

    eqvar5.setText(" NULL");
    
    text("Sorry, this is unfinished",width/2+100,height/2);

    break;

  case 7:  
    image(equations.get(9), width/2, height/8);

    text("P", 40, height/3+30);
    text("m", 40, height/3+70);
    text("h", 40, height/3+110);

    text("J", 175, height/3+30);
    text("kg", 175, height/3+70);
    text("m", 175, height/3+110);

    eqvar4.setText(" NULL");
    eqvar5.setText(" NULL");

    text(potential(eqvar1.getText(),eqvar2.getText(),eqvar3.getText()),width/2+100,height/2);

    break;
  }
}

void equationSetup() {
  eqlist = new ScrollableList(cp5, "Physics Concept");
  eqvar1 = new Textfield(cp5, "var1");
  eqvar2 = new Textfield(cp5, "var2");
  eqvar3 = new Textfield(cp5, "var3");
  eqvar4 = new Textfield(cp5, "var4");
  eqvar5 = new Textfield(cp5, "var5");
  String[] whatItems = new String[7];
  equations = new ArrayList<PImage>();

  whatItems[0] = "Kinematics";
  whatItems[1] = "Newton's Second Law";
  whatItems[2] = "Friction";
  whatItems[3] = "Universal Gravitation";
  whatItems[4] = "Work from Force and Displacement";
  whatItems[5] = "Work-Energy Theorem";
  whatItems[6] = "Potential Energy";

  eqlist.addItems(whatItems);
  eqlist.setBackgroundColor(0);
  eqlist.setItemHeight(20);
  eqlist.setSize(width/2-40, 200);
  eqlist.setBarHeight(20);
  eqlist.close();
  eqlist.setColor(new CColor(0xFFAABBFF, 0xFF33AAFF, 0xFF000000, 0xFFFFFFFF, 0xFFFFFFFF));
  
  eqsetup=true;

  eqvar1.setPosition(width/6, height/3+20);
  eqvar1.setSize(80, 20);
  eqvar1.setColor(new CColor(0xFF000000, 0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF, 0xFF000000));
  eqvar1.setColorCursor(0xFF000000);
  eqvar2.setPosition(width/6, height/3+60);
  eqvar2.setSize(80, 20);
  eqvar2.setColor(new CColor(0xFF000000, 0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF, 0xFF000000));
  eqvar3.setPosition(width/6, height/3+100);
  eqvar3.setSize(80, 20);
  eqvar3.setColor(new CColor(0xFF000000, 0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF, 0xFF000000));
  eqvar4.setPosition(width/6, height/3+140);
  eqvar4.setSize(80, 20);
  eqvar4.setColor(new CColor(0xFF000000, 0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF, 0xFF000000));
  eqvar5.setPosition(width/6, height/3+180);
  eqvar5.setSize(80, 20);
  eqvar5.setColor(new CColor(0xFF000000, 0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF, 0xFF000000));


  equations.add(loadImage("eq1.png"));
  equations.add(loadImage("eq2.png"));
  equations.add(loadImage("eq3.png"));
  equations.add(loadImage("eq4.png"));
  equations.add(loadImage("eq5.png"));
  equations.add(loadImage("eq6.png"));
  equations.add(loadImage("eq7.png"));
  equations.add(loadImage("eq8.png"));
  equations.add(loadImage("eq9.png"));
  equations.add(loadImage("eq10.png"));
}

String kinematics(String vn, String v, String t, String a, String x){
  if(vn.equals("")){
    if(v.equals("")){
      if(a.equals("")||t.equals("")||x.equals("")){
        return "Something is missing.";
      }
      else{
        return "Initial Velocity = " + ((float(x)-(0.5)*float(a)*float(t)*float(t))/float(t));  //no v or vn
      }
    }
    else if(a.equals("")){
      if(t.equals("")||x.equals("")){
        return "Something is missing.";
      }
      else{
        return "Acceleration = " + (2*(float(v)*float(t)-float(x))/(float(t)*float(t)));//no vn or a
      }
    }
    else if(t.equals("")){
      if(x.equals("")){
        return "Something is missing.";
      }
      else{
        return "Initial Velocity = " + (sqrt(abs(float(v)*float(v)-2*float(a)*float(x))));//no vn or t
      }
    }
    else if(x.equals("")){
      return "Initial Velocity = " + (float(v)-float(a)*float(t));//no vn or x
    }
  }
  else if(v.equals("")){
    if(a.equals("")){
      if(t.equals("")||x.equals("")){
        return "Something is missing.";
      }
      else{  
        return "Velocity = " + (2*(float(x)/float(t)-float(vn)));//no v or a
      }
    }
    else if(t.equals("")){
      if(x.equals("")){
        return "Something is missing.";
      }
      else{
        return "Velocity = " + (sqrt(abs(float(vn)*float(vn)+2*float(a)*float(x)))); //no v or t
      }
    }
    else if(x.equals("")){
      return "Velocity = " + (float(vn)+float(a)*float(t));//no v or x
    }
  }
  else if(a.equals("")){
    if(t.equals("")){
      if(x.equals("")){
        return "Something is missing.";
      }
      else{
        return "Acceleration = " + (float(v)*float(v)-float(vn)*float(vn)/2/float(x));//no a or t 
      }
    }
    else if(x.equals("")){
      return "Acceleration = " + ((float(v)-float(vn))/float(t)); //no a or x
    }
  }
  else if(t.equals("")){
    if(x.equals("")){
      return "Time = " + ((float(v)-float(vn))/float(a)); //no t no x
    }
  }
  return "Something is missing.";
}

String newton(String f, String m, String a){
  if(f.equals("")){
    if(m.equals("")||a.equals("")){
      return "Something is missing.";
    }
    else {
      return "Force = " + (float(m)*float(a));
    }
  }
  else if (m.equals("")){
    if(a.equals("")){
      return "Something is missing";
    }
    else {
      return "Mass = " + (float(f)/float(a));
    }
  }
  else{
    if(a.equals("")){
      return "Acceleration = " + (float(f)/float(m));
    }
  }
  return "Something is missing.";
}

String friction(String f, String m, String n){
  if(f.equals("")){
    if(m.equals("")||n.equals("")){
      return "Something is missing.";
    }
    else {
      return "Friction Force = " + (float(m)*float(n));
    }
  }
  else if (m.equals("")){
    if(n.equals("")){
      return "Something is missing";
    }
    else {
      return "Coefficient of Friction = " + (float(f)/float(n));
    }
  }
  else{
    if(n.equals("")){
      return "Normal Force = " + (float(f)/float(m));
    }
  }
  return "Something is missing.";
}

String gravitation(String f, String m1, String m2, String d){
  float bigG=6.67E-11;
  if(f.equals("")){
    if(m1.equals("")||m2.equals("")||d.equals("")){
      return "Something is missing.";
    }
    else{
      return "Gravitational Force = " + (bigG*float(m1)*float(m2)/float(d)/float(d));
    }
  }
  else if(m1.equals("")){
    if(m2.equals("")||d.equals("")){
      return "Something is missing.";
    }
    else{
      return "Mass of first body = " + (float(f)/bigG/float(m2)*float(d)*float(d));
    }
  }
  else if(m2.equals("")){
    if(d.equals("")){
      return "Something is missing.";
    }
    else{
      return "Mass of second body = " + (float(f)/bigG/float(m1)*float(d)*float(d));
    }
  }
  else{
    return "Distance = " + sqrt(abs(float(m1)*float(m2)/float(f)));
  }
}

String potential(String p, String m, String h){
  if(p.equals("")){
    if(m.equals("")||h.equals("")){
      return "Something is missing.";
    }
    else {
      return "Potential Energy = " + (float(m)*float(h)*9.8);
    }
  }
  else if (m.equals("")){
    if(h.equals("")){
      return "Something is missing";
    }
    else {
      return "Mass = " + (float(p)/float(h)/9.8);
    }
  }
  else{
    if(h.equals("")){
      return "Height = " + (float(p)/float(m)/9.8);
    }
  }
  return "Something is missing.";
}