// Juan Isidro Yalet Asurmendi 85042/4
// https://youtu.be/RT887tEE3pY

import processing.sound.*;
SoundFile fileTrack;
boolean inicioFileTrack = false;
MenuInicio inicio;

void setup() {
  size(700, 500);
  inicio = new MenuInicio();
  fileTrack = new SoundFile(this,"musicaparapedrocrossmaster.mp3");
}

void draw() {
  background(200);
  inicio.dibujar();
}

void mouseClicked() {
  inicio.botones();
}

void keyPressed() {
  inicio.teclasParaJuego();
}
