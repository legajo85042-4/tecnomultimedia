class Flor {
 PImage img;
 int posX;
 int posY ;
 int ancho = 40;
 int alto = 40;
 int lugar=10;
 
 Flor(int _posX, int _posY){
    posX = _posX;
    posY = _posY;
    img = loadImage("rosa.png");}
 
 void dibujar(){
  image(img, posX+lugar, posY+lugar, ancho, alto);}
}
