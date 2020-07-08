import processing.serial.*;
  // The serial port
  Serial myPort;        
  //variables
  int xPos = 301;
  float average = 0; //<>//
  int sum = 0;
  int counter = 0;
  float inByte = 0;
  
  void setup () {  
    // set the window size:
    //width x height
    size(1200, 1050);
    
    //variables
    int x = 300;
    int y = 300;
    int space = 25;
    int yEnd = 925;
    int yValues = 600;
    int xValues = 0;

    // set port
    println(Serial.list()[0]);
    myPort = new Serial(this, Serial.list()[1], 9600);
    myPort.bufferUntil('\n');
    
    //set the background
    background(#91817F);
    
    //draw 24 vertical lines
    //give it a color
    //at the end of each line place a number (0 at the start and 24 at the end)
    //increment xValues
    //add space between the lines
    for (int i = 0; i < 25; i++){
      line(x, y, x, 900);
      fill(#191616);
      text(xValues, x, yEnd);
      xValues += 1;
      x += space;
    }
  
    //draw 24 horizontal lines
    //give it a color
    //at the end of each line place a number
    //with each line being created this number decreases
    //add space between the lines
    for (int i = 0; i < 25; i++){
      line(300, y, 900, y);      
      fill(#191616);      
      text(yValues, x, y);      
      yValues -= 25;      
      y += space;
    } 
    
    text("Average value", 950, 600);
    text("Hours", 600, 950);
    
  }
      
  void draw () {
    calculateAverage();  
    hint(ENABLE_STROKE_PURE);
    stroke(#E2ECF9);  
    //position the line and stop at the end of the graph
    if (xPos < 900){ //<>//
        line(xPos, 900, xPos, height-average-150);  
        xPos++;
    }
  }
  
  //calculates average of variable inByte
  void calculateAverage(){
    sum += inByte;
    counter++;
    average = sum/counter;
  }

  void serialEvent (Serial myPort) {
    // get the ASCII string:
    String inString = myPort.readStringUntil('\n');
    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);
      // convert to an int and map to the screen height:
      inByte = float(inString);
      println(average);      
    }
  }
  
