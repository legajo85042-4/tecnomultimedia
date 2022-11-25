class Pantalla {

  int posX=0;
  int posY=0;
  int puntoDePartidaPosX=-300;
  int velocidadPersonaje=5;
  int tipoDeMovimiento1=3;
  PImage fondos;
  PImage imgPersonaje;
  String nombrePersonaje;


  Pantalla(String fondoPantalla, String personajes, int tipoDeMovimientoPersonajes) {

    fondos = loadImage(fondoPantalla);
    tipoDeMovimiento1=tipoDeMovimientoPersonajes;
    nombrePersonaje = personajes;
    if (personajes != null) {
      imgPersonaje = loadImage(personajes);
    }
  }

  void dibujar() {

    image(fondos, 0, 0, width, height);
    calcularPosicionPersonaje(tipoDeMovimiento1);
    if (nombrePersonaje != null) {
      image(imgPersonaje, posX, posY, width, height);
    }
  }


  void calcularPosicionPersonaje(int tipoDeMovimientoPersonajes) {
    
    if (tipoDeMovimientoPersonajes==1) {

      if (posX>=puntoDePartidaPosX) {
        posX=posX+velocidadPersonaje;
      }
      if (posX>=width) {
        posX=puntoDePartidaPosX;
      }
    } else if (tipoDeMovimientoPersonajes==2) {
      if (posX<=width) {
        posX=posX-velocidadPersonaje;
      }
      if (posX<=puntoDePartidaPosX) {
        posX=width;
      }
    } else if (tipoDeMovimientoPersonajes==3) {
      posX=0;
      posY=0;
    }
  }
}
