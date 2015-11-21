boolean setupUCUIRun = false;

enum ConvertType {
  MASS, LENGTH, VELOCITY, ACCEL, TIME, TEMP, ENERGY
}

void setupUnitConverterUI() {
  fill(0);
  setupUCUIRun = true;
  
  //Choose type of conversion
  String[] types = {"Mass", "Length", "Velocity", "Accelaration", "Time", "Temperature", "Energy/Work"};
  ScrollableList type = new ScrollableList(cp5, "type");
  type.setPosition(100, 100)
      .setSize(232,200)
      .setType(ScrollableList.DROPDOWN)
      .addItems(types);
      
  /*Convert: 
    mass         (g|kg, oz|lb, N), 
    length       (cm|m|km, in|ft|mi),
    velocity     (m/s|km/s, km/h, in/s|ft/s, mph),
    accelaration (m/s^2|ft/s^2),
    time         (s, min, hr, day, wk, mo, yr),
    temp         (K, ºF, ºC),
    energy       (J|kJ|mJ, cal|kcal|Mcal, Wh|kWh)
  */
  
  String[] massUnits =      {"Grams (g)", "Kilograms (kg)", "Ounces (oz)", "Pounds (lb)", "Newtons (N)"};
  String[] lengthUnits =    {"Centimeters (cm)", "Meters (m)", "Kilometers (km)", "Inches (in)", "Miles (mi)"};
  String[] velocityUnits =  {"Meters per sec (m/s)", "Kilometers per sec (km/s)", "Kilometers per hour (km/h)", "Inches per sec (in/s)", "Feet per sec (ft/s)", "Miles per hour (mph)"};
  String[] accelUnits =     {"Meters per sq. sec^2 (m/s^2)", "Feet per sq. sec (km/s^2)"};
  String[] timeUnits =      {"Seconds (s)", "Minutes (min)", "Hours (hr)", "Days", "Weeks (wk)", "Months (mo)", "Years (yr)"};
  String[] tempUnits =      {"Degrees Fahrenheit (ºF)", "Degrees Celsius (ºC)", "Kelvin (K)"};
  String[] energyUnits =    {"Joules (J)", "Kilojoules (kJ)", "Megajoules (MJ)", "Calories (cal)", "Kilocalories (kcal)", "Megacalories (Mcal)", "Watt-hours (Wh)", "Kilowatt-hours (kWh)"};
  
  Textfield input = new Textfield(cp5, "input");
  input.setPosition(100,200)
       .setSize(232,25);
}

void drawUnitConverterUI() {
  background(0);
  if (!setupUCUIRun) setupUnitConverterUI();
  //draw UI
  
  
}

float convert(float in, int convertTo) {
  float out = in; //temp
  return out;
}