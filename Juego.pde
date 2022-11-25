class Juego {

  int columnasTablero=10;
  int filasTablero=10;
  int obstaculosGenerados = 0;
  int posTempfila;
  int posTempcolumna; 
  int cantObstaculos=50;
  int casilleroAnchoAlto=50;
  int ganaste=3;
  int obstaculosAtravesados=0;
  int premioPosX, premioPosY;
  PImage imgPremio;
  String tipoDeObstaculo;
  Obstaculo [][] obstaculos = new Obstaculo [cantObstaculos][cantObstaculos];
  PersonajeJuego personaje;

  Juego(String obstaculo) {
    tipoDeObstaculo = obstaculo;
    imgPremio = loadImage("salida0.png");
    personaje = new PersonajeJuego(0, 0, casilleroAnchoAlto, casilleroAnchoAlto);
    ponerObstaculos();
    ponerPremio();
  }

  void ponerObstaculos() {
    for (int fila = 0; fila < cantObstaculos; fila++) {
      if (obstaculosGenerados<cantObstaculos) {
        posTempfila = int(random(0, filasTablero));
        posTempcolumna= int(random(0, columnasTablero));
        if (posTempfila >= 1 || posTempcolumna >=1) {
          if (obstaculos[posTempfila][posTempcolumna]== null) {
            obstaculosGenerados ++;
            obstaculos[posTempfila][posTempcolumna] = new Obstaculo(posTempfila*casilleroAnchoAlto, posTempcolumna*casilleroAnchoAlto, tipoDeObstaculo);
          }
        }
      }
    }
  }

  void ponerPremio() {
    int areaY =filasTablero-1;
    int areaX=columnasTablero-4;
    int premioGenerado=0;
    for (int columna= areaX; columna < columnasTablero; columna++) {
      for (int fila = areaY; fila < filasTablero; fila++) {
        if (premioGenerado<1) {
          if (obstaculos[columna][fila] == null) {
            premioPosX=columna*casilleroAnchoAlto;
            premioPosY=fila*casilleroAnchoAlto;
            premioGenerado++;
          }
        }
      }
    }
  }

  void dibujar() {
    pushMatrix();
    translate(100, 0);
    dibujarObstaculos();
    personaje.dibujar();
    dibujarPremio(premioPosX, premioPosY);
    if (hayObstaculo()) {
      obstaculosAtravesados++;
      noStroke();
      fill(255, 0, 0, 100);
      rect(personaje.posX, personaje.posY, casilleroAnchoAlto, casilleroAnchoAlto);
    }
    popMatrix();
    dibujarVidas(5, 5);
    dibujarVidas(595, 5);
  }

  void dibujarPremio(int posX1, int posY1) {
    fill(100, 255, 100);
    rect(posX1, posY1, 50, 50);
    image(imgPremio, posX1, posY1, imgPremio.width, imgPremio.height);
  }

  void dibujarObstaculos() {
    for (int i=0; i< cantObstaculos; i++) {
      for (int j=0; j< cantObstaculos; j++) {
        if (obstaculos[i][j] != null) {
          obstaculos[i][j].dibujar();
        }
      }
    }
  }

  void dibujarVidas(int posXVidas, int  posYVidas) {
    rect(posXVidas, posYVidas, 100, 25);
    strokeWeight(4);
    for (int j=0; j< obstaculosAtravesados; j++) {
      float m=map(j, 0, obstaculosAtravesados, 214, 0);
      stroke(m, 0, 189);
      line(posXVidas+j*4, posYVidas+0, posXVidas+j*4, posYVidas+25);
    }
    strokeWeight(1);
  }

  void ganaste() {
    if (obstaculosAtravesados==25) {
      ganaste=0;
    } else if (hayPremio()) {
      ganaste=1;
    }
  }

  void resetearJuego() {
    obstaculosAtravesados=0; 
    ganaste=3;
    personaje.resetearPosiciones();
  }

  void teclasPersonaje() {
    if (keyCode == RIGHT ) {
      if (hayLimiteDerecha()) {
        personaje.moverDerecha();
      }
    } else if (keyCode == LEFT ) {
      if (hayLimiteIzquierda()) {
        personaje.moverIzquierda();
      }
    } else if (keyCode == UP ) {
      if (hayLimiteArriba()) {
        personaje.moverArriba();
      }
    } else if (keyCode == DOWN ) {
      if (hayLimiteAbajo()) {
        personaje.moverAbajo();
      }
    }
  }

  boolean hayObstaculo() {
    int posXpersonaje = personaje.posX/casilleroAnchoAlto;
    int posYpersonaje = personaje.posY/casilleroAnchoAlto;
    if (obstaculos[posXpersonaje][posYpersonaje]!= null) {
      return true;
    } else {
      return false;
    }
  }

  boolean hayPremio() {
    if (personaje.posX == premioPosX && personaje.posY == premioPosY) {
      return true;
    } else {
      return false;
    }
  }

  boolean hayLimiteDerecha() {
    int posXpersonaje = personaje.posX/casilleroAnchoAlto;
    if (posXpersonaje+1>=columnasTablero) {
      return false;
    } else {
      return true;
    }
  }

  boolean hayLimiteIzquierda() {
    int posXpersonaje = personaje.posX/casilleroAnchoAlto;
    if (posXpersonaje-1<0) {
      return false;
    } else {
      return true;
    }
  }

  boolean hayLimiteArriba() {
    int posYpersonaje = personaje.posY/casilleroAnchoAlto;
    if (posYpersonaje-1<0) {
      return false;
    } else {
      return true;
    }
  }

  boolean hayLimiteAbajo() {
    int posYpersonaje = personaje.posY/casilleroAnchoAlto;
    if (posYpersonaje+1>=filasTablero) {
      return false;
    } else {
      return true;
    }
  }
}
