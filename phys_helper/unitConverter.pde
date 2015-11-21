boolean setupUCUIRun = false;

enum ConvertType {
  MASS, LENGTH, VELOCITY, ACCEL, TIME, TEMP, ENERGY
}

ScrollableList ucType, inUnit, outUnit;
Textfield ucInput;
Textarea ucOutput;
String[] massUnits, lengthUnits, velocityUnits, accelUnits, timeUnits, tempUnits, energyUnits, currUnits;

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
      
/*  Convert: 
    mass          (g|kg, oz|lb, N), 
    length        (cm|m|km, in|ft|mi),
    velocity      (m/s|km/s, km/h, in/s|ft/s, mph),
    accelaration  (m/s^2|ft/s^2),
    time          (s, min, hr, day, wk, mo, yr),
    temp          (K, ºF, ºC),
    energy        (J|kJ|mJ, cal|kcal|Mcal, Wh|kWh)  */
  massUnits =      new String[]{"Grams (g)", "Kilograms (kg)", "Ounces (oz)", "Pounds (lb)", "Newtons (N)"};
  lengthUnits =    new String[]{"Centimeters (cm)", "Meters (m)", "Kilometers (km)", "Inches (in)", "Miles (mi)"};
  velocityUnits =  new String[]{"Meters per sec (m/s)", "Kilometers per sec (km/s)", "Kilometers per hour (km/h)", "Inches per sec (in/s)", "Feet per sec (ft/s)", "Miles per hour (mph)"};
  accelUnits =     new String[]{"Meters per sq. sec^2 (m/s^2)", "Feet per sq. sec (km/s^2)"};
  timeUnits =      new String[]{"Seconds (s)", "Minutes (min)", "Hours (hr)", "Days", "Weeks (wk)", "Months (mo)", "Years (yr)"};
  tempUnits =      new String[]{"Degrees Fahrenheit (ºF)", "Degrees Celsius (ºC)", "Kelvin (K)"};
  energyUnits =    new String[]{"Joules (J)", "Kilojoules (kJ)", "Megajoules (MJ)", "Calories (cal)", "Kilocalories (kcal)", "Megacalories (Mcal)", "Watt-hours (Wh)", "Kilowatt-hours (kWh)"};
  
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
  if (ControlP5.ACTION_PRESS == 1) {
    onChangeType();
    convert(float(ucInput.getText()), currUnits[int(inUnit.getValue())], currUnits[int(outUnit.getValue())]);
  }
  try {
    if (keyPressed) convert(float(ucInput.getText()), currUnits[int(inUnit.getValue())], currUnits[int(outUnit.getValue())]);
  } catch (Exception e) {
    ucOutput.setText("ERR: INPUT IS NOT A NUMBER");
  }
}

void onChangeType() {
  inUnit.clear();
  outUnit.clear();
  switch (int(ucType.getValue())) {
    case 0:  inUnit.addItems(massUnits);
             outUnit.addItems(massUnits);
             currUnits = massUnits;
             break;
             
    case 1:  inUnit.addItems(lengthUnits);
             outUnit.addItems(lengthUnits);
             currUnits = lengthUnits;
             break;
             
    case 2:  inUnit.addItems(velocityUnits);
             outUnit.addItems(velocityUnits);
             currUnits = velocityUnits;
             break;
             
    case 3:  inUnit.addItems(accelUnits);
             outUnit.addItems(accelUnits);
             currUnits = accelUnits;
             break;
             
    case 4:  inUnit.addItems(timeUnits);
             outUnit.addItems(timeUnits);
             currUnits = timeUnits;
             break;
             
    case 5:  inUnit.addItems(tempUnits);
             outUnit.addItems(tempUnits);
             currUnits = tempUnits;
             break;
             
    case 6:  inUnit.addItems(energyUnits);
             outUnit.addItems(energyUnits);
             currUnits = energyUnits;
             break;
  }
}

void convert(float in, String convertFrom, String convertTo) {
  float out = in; //temp
  ucOutput.setText(in + " " + convertFrom + "\n= " + out + " " + convertTo);
}