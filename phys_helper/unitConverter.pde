boolean setupUCUIRun = false;

ScrollableList ucType, inUnit, outUnit;
Textfield ucInput;
Textarea ucOutput;
String[] massUnits, lengthUnits, velocityUnits, accelUnits, timeUnits, tempUnits, energyUnits, currUnits;
float[] massConsts, lengthConsts, velocityConsts, accelConsts, timeConsts, tempConsts, tempZeros, energyConsts, currConsts;

void setupUnitConverterUI() {
  fill(0);
  setupUCUIRun = true;
  
  ucOutput = new Textarea(cp5, "Output");
  ucOutput.setPosition(100, 370)
          .setText("OUTPUT");
  
  outUnit = new ScrollableList(cp5, "Convert to...");
  outUnit.setPosition(100, 270)
         .setSize(232, 200)
         .setType(ScrollableList.DROPDOWN)
         .close();
  
  //input field
  ucInput = new Textfield(cp5, "Input");
  ucInput.setPosition(100,200)
         .setSize(232,25);
      
  /*Convert: 
    mass          (g|kg, oz|lb, N), 
    length        (cm|m|km, in|ft|mi),
    velocity      (m/s|km/s, km/h, in/s|ft/s, mph),
    accelaration  (m/s^2|ft/s^2),
    time          (s, min, hr, day, wk, mo, yr),
    temp          (K, ºF, ºC),
    energy        (J|kJ|mJ, cal|kcal|Mcal, Wh|kWh)  */
    
  //Units = names of units, Consts = convert to Units[0]
  massUnits =      new String[]{"Grams (g)", "Kilograms (kg)", "Ounces (oz)", "Pounds (lb)"};
  massConsts =      new float[]{ 1,           1000,             28.349523125,  453.59237   };
  
  lengthUnits =    new String[]{"Centimeters (cm)", "Meters (m)", "Kilometers (km)", "Inches (in)", "Feet (ft)", "Miles (mi)"};
  lengthConsts =    new float[]{ 1,                  100,          100000,            2.54,          30.48,       160934.4   };
  
  velocityUnits =  new String[]{"Meters per sec (m/s)", "Kilometers per sec (km/s)", "Kilometers per hour (km/h)", "Feet per sec (ft/s)", "Miles per sec (mi/s)", "Miles per hour (mph)"};
  velocityConsts =  new float[]{ 1,                      1000,                        0.27777778,                   0.3048,                1609,                   0.447                };
  
  accelUnits =     new String[]{"Meters per sq. sec^2 (m/s^2)", "Feet per sq. sec (km/s^2)"};
  accelConsts =     new float[]{ 1,                              0.3048                    };
  
  timeUnits =      new String[]{"Seconds (s)", "Minutes (min)", "Hours (hr)", "Days", "Weeks (wk)", "Months (30 days) (mo)", "Years (365 days) (yr)"};
  timeConsts =      new float[]{ 1,             60,              3600,         86400,  604800,       2630000,                 31560000              };
  
  tempUnits =      new String[]{"Degrees Fahrenheit (ºF)", "Degrees Celsius (ºC)", "Kelvin (K)"};
  tempConsts =      new float[]{ 1,                         5/9,                    5/9        };
  tempZeros =       new float[]{ 32,                        0,                      373.2      };
  
  energyUnits =    new String[]{"Joules (J)", "Kilojoules (kJ)", "Megajoules (MJ)", "Calories (cal)", "Kilocalories (kcal)", "Megacalories (Mcal)", "Watt-hours (Wh)", "Kilowatt-hours (kWh)"};
  energyConsts =    new float[]{ 1,            1000,              1000000,           4.187,            4187,                  4187000,               3600,              3600000              };
  
  inUnit = new ScrollableList(cp5, "Convert from...");
  inUnit.setPosition(100, 150)
        .setSize(232, 200)
        .setType(ScrollableList.DROPDOWN)
        .close();
         
  //Choose type of conversion
  String[] ucTypes = {"Mass", "Length", "Velocity", "Accelaration", "Time", "Temperature", "Energy/Work"};
  ucType = new ScrollableList(cp5, "Unit type");
  ucType.setPosition(100, 100)
        .setSize(232,200)
        .setType(ScrollableList.DROPDOWN)
        .addItems(ucTypes)
        .close();
}

void drawUnitConverterUI() {
  background(0);
  if (!setupUCUIRun) setupUnitConverterUI();
  
  //switch between unit selections when different type is selected
  if (ControlP5.ACTION_PRESS == 1)
    onChangeType();
  
  //perform conversion
  convert(float(ucInput.getText()), int(ucType.getValue()), int(inUnit.getValue()), int(outUnit.getValue()));
}

//switch dropdowns & constant values when type is changed
void onChangeType() {
  inUnit.clear();
  outUnit.clear();
  switch (int(ucType.getValue())) {
    case 0:  inUnit.addItems(massUnits);
             outUnit.addItems(massUnits);
             currUnits = massUnits;
             currConsts = massConsts;
             break;
             
    case 1:  inUnit.addItems(lengthUnits);
             outUnit.addItems(lengthUnits);
             currUnits = lengthUnits;
             currConsts = lengthConsts;
             break;
             
    case 2:  inUnit.addItems(velocityUnits);
             outUnit.addItems(velocityUnits);
             currUnits = velocityUnits;
             currConsts = velocityConsts;
             break;
             
    case 3:  inUnit.addItems(accelUnits);
             outUnit.addItems(accelUnits);
             currUnits = accelUnits;
             currConsts = accelConsts;
             break;
             
    case 4:  inUnit.addItems(timeUnits);
             outUnit.addItems(timeUnits);
             currUnits = timeUnits;
             currConsts = timeConsts;
             break;
             
    case 5:  inUnit.addItems(tempUnits);
             outUnit.addItems(tempUnits);
             currUnits = tempUnits;
             currConsts = tempConsts;
             break;
             
    case 6:  inUnit.addItems(energyUnits);
             outUnit.addItems(energyUnits);
             currUnits = energyUnits;
             currConsts = energyConsts;
             break;
  }
  if (inUnit.getValue() > currUnits.length) {
    inUnit.setValue(0);
  }
  if (outUnit.getValue() > currUnits.length) {
    outUnit.setValue(0);
  }
}

//convert!
void convert(float in, int unitsIndex, int fromIndex, int toIndex) {
  float out = in;
  if (fromIndex == toIndex) out = in;
  else if (unitsIndex == 5) {
    switch (fromIndex) {
      case 0:  switch(toIndex) {
                 case 1: out = (in - 32) * (5 / 9);          break;
                 case 2: out = (in - 32) * (5 / 9) + 273.15; break;
               }
      case 1:  switch(toIndex) {
                 case 0: out = in * (9 / 5) + 32; break;
                 case 2: out = in + 273.15;       break;
               }
      case 2:  switch(toIndex) {
                 case 0: out = (in - 273.15) * (9 / 5) + 32; break;
                 case 1: out = in - 273.15;                  break;
               }
    } 
  } else {
    out = in * currConsts[fromIndex] / currConsts[toIndex];
  }
  ucOutput.setText(in + " " + currUnits[fromIndex] + "\n\n= " + out + " " + currUnits[toIndex]);
}