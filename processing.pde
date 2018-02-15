// referenced https://processing.org/examples/transparency.html for the image slider
// referenced the class materials for reading the arduino serial port

import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port


// Jon Froehlich
// http://makeabilitylab.io

import processing.serial.*;

// The serial port is necessary to read data in from the Arduino
// Think of this Processing program just like Arduino's Serial Monitor and Serial Plotter tools
Serial _serialPort;  // defines the variable _serialPort as containing serial information
int _data [] = new int[0];  // read data array from arduino serial output

PImage img;
PImage img2;
float offset = 0;  // initialize offset variable
float easing = 0.1;  // this is a value that helps smooth the motion by making the offset steps smaller
int ppos = 0;

void setup() {
  size(900, 315);  // defines the size of the window. In real-world applications, this would probably be much larger to reflect the actual size of the screen
  img = loadImage("ad.png");  // Load an image into the program 
  img2 = loadImage("hotelad.jpg");  // Load a second image into the program

  // List all the available serial ports
  println(Serial.list());

  // Open whatever port is the one you're using.
  _serialPort = new Serial(this, Serial.list()[1], 9600);  // reads the specified serial port at a baud rate of 9600

  // Don't generate a serialEvent() unless you get a newline character:
  _serialPort.bufferUntil('\n');

  // setup colormode to be hsb
  // this colorspaces makes it easier to just manipulate "hue"
  // https://processing.org/reference/colorMode_.html
  colorMode(HSB, 1.0, 1.0, 1.0, 1.0);  // not sure if this is needed? maybe try deleting it and see if it affects anything
  
}

void draw() {
background(0);  // creates a black background as the base
ppos = int(map(_data[0], 0, 1023, 0, 900));  // translates the potentiometer position to the range of possible values for the width of the screen
// if there is a lot of ambient light, use img as the photo to display
if (_data[1] > 512) {
  // the expression in the paranthesis is the distance between the center of the image and the value of the potentiometer, the offset/2 term is the recriprocal of the first term. So calculating the offset will always be twice the value of the distance between the center of the image and the potentiometer value. This allows the picture to transverse over the entire screen both ways until it is not visible 
  float dx = (ppos-img.width/2) - offset/2;  
  offset += dx * easing;  // multiplies the delta by smoothing constant to make the offset steps smaller
  image(img, offset, 0);  // displays the image at the current offset position
  }
// there is not much ambient light, so use img2 as the photo to display instead
else {
  float dx = (ppos-img2.width/2) - offset/2;
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
    println(e);  // print error if there is an error
  }
}
