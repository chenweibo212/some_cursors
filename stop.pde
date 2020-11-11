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
}

void draw() {
  background (0);

  count+=0.1;
  posX = MouseInfo.getPointerInfo().getLocation().x;
  posY = MouseInfo.getPointerInfo().getLocation().y;
  robot.mouseMove(posX+int(sin(count)*(6+sin(count/5)*2)), posY+int(cos(count)*(6+sin(count/5)*2)));
  
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
