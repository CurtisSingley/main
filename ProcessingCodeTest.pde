// Jon Froehlich
// http://makeabilitylab.io

import processing.serial.*;

// The serial port is necessary to read data in from the Arduino
// Think of this Processing program just like Arduino's Serial Monitor and Serial Plotter tools
Serial _serialPort;
int _data [] = new int[0];

float theta;

void setup() {
  size(600, 360);
  img = loadimage("D:\textb.jpg");  // loads text image
  // List all the available serial ports
  println(Serial.list());

  // Open whatever port is the one you're using.
  // On my PC at home, it's the second option in the list, index 1
  // On my Mac, it's the fifth option in the list, index 4
  _serialPort = new Serial(this, Serial.list()[7], 9600);

  // Don't generate a serialEvent() unless you get a newline character:
  _serialPort.bufferUntil('\n');

  // setup colormode to be hsb
  // this colorspaces makes it easier to just manipulate "hue"
  // https://processing.org/reference/colorMode_.html
  colorMode(HSB, 1.0, 1.0, 1.0, 1.0);
}

void draw() {
  background(0)
  // Referenced code from https://processing.org/examples/tree.html
  // This creates a fractal tree that changes angles based on input
  frameRate(30);
  stroke(255);
  // Just a simple check to make sure the array is the size I expect (so the data is there)
  if (_data.length >= 3) {

    // used to fade an image in and out based on a1 input
    float b = map(_data[2], 0, 1023, 0, 255);
    tint(255, b);  // varies text transparency based on a1 input
    image(img, 0, 0);  // displays image
    
    // used to draw the tree fractal based on a0 input
    float a = _data[1];
    // Convert it to radians
    theta = radians(a);
    // Start the tree from the bottom of the screen
    translate(width/2,height);
    // Draw a line 120 pixels
    line(0,0,0,-120);
    // Move to the end of that line
    translate(0,-120);
    // Start the recursive branching!
    branch(120);;

  }
  
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
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
