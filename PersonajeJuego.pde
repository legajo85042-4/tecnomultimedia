class PersonajeJuego {
  
  int posX, posY;
  int ancho, alto;
  PImage img1, img2;
  int img=1;

  PersonajeJuego(int _posX, int _posY, int _ancho, int _alto) {
    
    posX = _posX;
    posY = _posY;
    ancho = _ancho;
    alto = _alto;
    img1 = loadImage("personaje10.png");
    img2 = loadImage("personaje20.png");
  }

  void dibujar() {
    
    if (img%2==0) {

      image(img1, posX, posY, img1.width/2, img1.height/2);
    } else {

      image(img2, posX, posY, img1.width/2, img1.height/2);
    }
  }
  void resetearPosiciones() {
    posX=0;
    posY=0;
  }
  void moverArriba() {
    posY = posY - alto; 
    img++;
  }

  void moverAbajo() {
    posY = posY + alto;
    img++;
  }

  void moverDerecha() {
    posX = posX + ancho;
    img++;
  }

  void moverIzquierda() {
    posX = posX - ancho;
    img++;
  }
}
