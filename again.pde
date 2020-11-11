import java.awt.AWTException;
import java.awt.Robot;
import java.awt.MouseInfo;
import java.awt.event.InputEvent;

Robot robot;


















PVector startPoint = new PVector();
PVector destination = new PVector();
int posX;
int posY;
float count;
float progress;
float progressSpeed = 0.05f;

float clickChance = 0.01f;
boolean mouseClicked = false;

void setup() {
  try {
    robot = new Robot();
  } 
  catch (AWTException e) {
    e.printStackTrace();
  }
  size(400, 135);
  //  setDestiniation();
}

void draw() {
  background (0);
  int time= 40 - (millis()/1000);
  text("Runnning "+ time +" seconds... Press ESC to escape this nightmare", 20,70);

  count+=0.1;
  posX = MouseInfo.getPointerInfo().getLocation().x;
  posY = MouseInfo.getPointerInfo().getLocation().y;//mouseY;
  robot.mouseMove(posX+int(sin(count)*cos(count/2.3)*3), posY+int(cos(count)*cos(count/1.9)*3.2));


  if (random(1) < clickChance) {
    if (!mouseClicked) {
      robot.mousePress(InputEvent.BUTTON1_MASK);
    } else {
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
    }
    mouseClicked = !mouseClicked;
  }

  if (millis() > 60000) {
    exit();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == ESC) {
      exit();
    }
  }
}
