class Obstaculo {
  
  PImage img;
  int posX, posY;
  int ancho =100;
  int alto=100;
  float rotacion=0;
  float velocidad=0.1;

  Obstaculo(int posX1, int posY1, String tipoDeObstaculo) {
    
    posX = posX1;
    posY = posY1;
    img = loadImage(tipoDeObstaculo);
  }

  void dibujar() {
    
    pushMatrix();
    calcularPosicion();

    translate(posX+25, posY+25);
    rotate(rotacion);
    
    image(img, 0-25, 0-25, img.width, img.height);
    popMatrix();
  }

  void calcularPosicion() {
    
    if (rotacion<=velocidad) {
      rotacion=width;
    }
    if (rotacion>0) {
      rotacion=rotacion+velocidad;
    }
  }
}
