import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture cam;
OpenCV opencv;
PImage cara;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  cara = loadImage("cara.png");
  cam.start();
}

void draw() {
  scale(2);
  opencv.loadImage(cam);
  image(cam, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] cuadros = opencv.detect();
  for (int i = 0; i < cuadros.length; i++) {
      image(cara, cuadros[i].x-cuadros[i].width*.10/2, cuadros[i].y-cuadros[i].height*.10/2,cuadros[i].width+1.10,cuadros[i].height*1.10);
    }
}

void captureEvent(Capture c) {
  c.read();
}
