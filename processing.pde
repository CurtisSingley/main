import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port


// Jon Froehlich
// http://makeabilitylab.io

import processing.serial.*;

// The serial port is necessary to read data in from the Arduino
// Think of this Processing program just like Arduino's Serial Monitor and Serial Plotter tools
Serial _serialPort;
int _data [] = new int[0];

PImage img;
PImage img2;
float offset = 0;
float easing = 0.05;

void setup() {
  size(640, 360);
  img = loadImage("ad.png");  // Load an image into the program 
  img2 = loadImage("hotelad.jpg");

  // List all the available serial ports
  println(Serial.list());

  // Open whatever port is the one you're using.
  _serialPort = new Serial(this, Serial.list()[1], 9600);

  // Don't ;generate a serialEvent() unless you get a newline character:
  _serialPort.bufferUntil('\n');

  // setup colormode to be hsb
  // this colorspaces makes it easier to just manipulate "hue"
  // https://processing.org/reference/colorMode_.html
  colorMode(HSB, 1.0, 1.0, 1.0, 1.0);
  
}

void draw() {
background(0);
if (_data[1] > 512) {
  // image(img, 0, 0);  // Display at full opacity
  float dx = (_data[0]-img.width/2) - offset;
  offset += (dx * easing)*3; 
  image(img, offset, 0);

  }
else {
  // image(img2, 0, 0);  // Display at full opacity
  float dx = (_data[0]-img2.width/2) - offset;
  offset += dx * easing; 
  image(img2, offset, 0);
 }
}


void serialEvent (Serial myPort) {
  try {
    
    // Reads and processes the data off the serial port. See: 
    // https://processing.org/reference/libraries/serial/index.html
    String inString = _serialPort.readStringUntil('\n');
    inString = trim(inString);
    println("Read in: " + inString);
    
    // Split the comma separated data into individual values
    _data = int(split(inString, ','));
    
    // Print out the received data (this is just for debugging, feel free to comment out this line)
    println(_data);
  }
  catch(Exception e) {
    println(e);
  }
}
