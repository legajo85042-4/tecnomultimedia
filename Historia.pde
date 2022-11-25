class Historia {

  int pantallaActual= 1;
  int cant;
  int ganaste=3;
  int tipoDeObstaculo=0;
  PFont fuente, fuente2;
  Pantalla [] pantallas;
  Juego [] juegos;

  Historia() {
    
    juegos= new Juego[5];
    fuente = loadFont("CheapFire-48.vlw");
    textFont(fuente);
    fuente2 = loadFont("ComicSansMS-20.vlw");
    textFont(fuente2);

    pantallas = new Pantalla [12];

    pantallas[1] = new Pantalla("compartimientodemoto0.jpg", "personajeAguantera0.png", 3);
    pantallas[2] = new Pantalla("fondo1_farmacia0.png", "hombreEnMoto.png", 1);
    pantallas[3] = new Pantalla("fondo3encasa0.jpg", "personajeDeFrente0.png", 3);
    pantallas[4] = new Pantalla("fondo4buscasteatuamigo0.jpg", "pepeConAmigo.png", 1);
    pantallas[5] = new Pantalla("fondoFuego0.jpg", "personajeParaArañas0.png", 3);
    pantallas[6] = new Pantalla("fondoArañas0.jpg", "personajeParaArañas0.png", 3);
    pantallas[7] = new Pantalla("fondo1_farmacia0.png", "personajeHongo0.png", 2);
    pantallas[8] = new Pantalla("fondo1_farmacia0.png", "personajeHechicero0.png", 2);
    pantallas[9] = new Pantalla("fondoParaJuego0.jpg", null, 3);
    pantallas[10] = new Pantalla("perdiste0.jpg", null, 3);
    pantallas[11] = new Pantalla("ganaste0.jpg", null, 3);

    juegos[1] = new Juego("imgMagia0.png");
    juegos[2] = new Juego("imagenHongos0.png");
    juegos[3] = new Juego("imgAraña0.png");
    juegos[4] = new Juego("imgFuego0.png");
  }


  void dibujar() {
    
    pantallas[pantallaActual].dibujar();
    dibujarSeleccionador();
  }

  void seleccionDeEscenas() {
    if (pantallaActual==1) {

      if (mouseX < 300-10 && mouseX > 200-10 && mouseY < 500 && mouseY > 450) {
        pantallaActual=2;
      }
      if (mouseX < 400 && mouseX > 300 && mouseY < 500 && mouseY > 450) {
        pantallaActual=3;
      }
      if (mouseX < 500+10 && mouseX > 400+10 && mouseY < 500 && mouseY > 450) {
        pantallaActual=4;
      }
    } else if (pantallaActual==2) {

      if (mouseX < 500 && mouseX > 200 && mouseY < 500 && mouseY > 450) {
        pantallaActual=9;
      }
    } else if (pantallaActual==3) {

      if (mouseX < 350-5 && mouseX > 200-5 && mouseY < 500 && mouseY > 450) {
        pantallaActual=5;
      }
      if (mouseX < 500+5 && mouseX > 350+5 && mouseY < 500 && mouseY > 450) {
        pantallaActual=6;
      }
    } else if (pantallaActual==4) {

      if (mouseX < 350-5 && mouseX > 200-5 && mouseY < 500 && mouseY > 450) {
        pantallaActual=7;
      }
      if (mouseX < 500+5 && mouseX > 350+5 && mouseY < 500 && mouseY > 450) {
        pantallaActual=8;
      }
    } else if (pantallaActual==5) {

      // a juego
      if (mouseX < 500 && mouseX > 200 && mouseY < 500 && mouseY > 450) {
        pantallaActual=9;
      }
    } else if (pantallaActual==6) {

      // a juego
      if (mouseX < 500 && mouseX > 200 && mouseY < 500 && mouseY > 450) {
        pantallaActual=9;
      }
    } else if (pantallaActual==7) {

      // a juego
      if (mouseX < 500 && mouseX > 200 && mouseY < 500 && mouseY > 450) {
        pantallaActual=9;
      }
    } else if (pantallaActual==8) {

      // a juego
      if (mouseX < 500 && mouseX > 200 && mouseY < 500 && mouseY > 450) {
        pantallaActual=9;
      }
    } else if (pantallaActual==10) {

      if (mouseX < 200 && mouseX > 50 && mouseY < 450 && mouseY > 400) {
        pantallaActual=1;
      }
    } else if (pantallaActual==11) {

      if (mouseX < 200 && mouseX > 50 && mouseY < 450 && mouseY > 400) {
        pantallaActual=1;
      }
    }
  }

  void reinicioHistoria() {
    
    pantallaActual=1;
  }
  
  void dibujarSeleccionador() {
    
    textAlign(CENTER, CENTER);
    textFont(fuente2);
    strokeWeight(3);
    stroke(255, 8, 223);

    if (pantallaActual==1) {
      dibujarTextoSuperior("Tu dueño te metio en la aguantera de la moto. Qué es lo que harás?");
      dibujarBotones("Vas con\n tu dueño", "Te quedás\n en casa", "Le robas\n la moto");
    } else if (pantallaActual==2) {
      tipoDeObstaculo=4;
      dibujarTextoSuperior("A tu dueño le van a robar la moto. Terminarás en un lugar incierto");
      dibujarBotones("Vas a parar a un lugar en llamas!", null, null);
    } else if (pantallaActual==3) {
      dibujarTextoSuperior("Ahora estas en tu casa y querés escaparte. Qué vas a hacer???????");
      dibujarBotones("Salir\n por atrás", "Salir\n por adelante", null);
    } else if (pantallaActual==4) {
      dibujarTextoSuperior("Pasaste a buscar a tu amigo. Pero en el camino te van a secuestrar.");
      dibujarBotones("Te secuestra\n un hongo", "Te secuestra\n un hechicero", null);
    } else if (pantallaActual==5) {
      tipoDeObstaculo=4;
      dibujarTextoSuperior(" LA CASA SE PRENDE FUEGO¡ Evita el fuego para escapar¡¡¡¡¡¡¡¡¡¡");
      dibujarBotones("DALE YO PUEDO", null, null);
    } else if (pantallaActual==6) {
      tipoDeObstaculo=3;
      dibujarTextoSuperior("La casa esta infectada de arañas venenosas. Evitalas y escaparás");
      dibujarBotones("Dale, soy aracnofobico", null, null);
    } else if (pantallaActual==7) {
      tipoDeObstaculo=2;
      dibujarTextoSuperior("Te llevará a su cueva llena de hongos mágicos. Evítalos y escaparás");
      dibujarBotones("Dale! Capaz me llevo un par!", null, null);
    } else if (pantallaActual==8) {
      tipoDeObstaculo=1;     
      dibujarTextoSuperior("El hechicero te lanzó magia negra. Evíta sus hechizos y escaparas¡¡¡");
      dibujarBotones("OKA ¡¡¡", null, null);
    } else if (pantallaActual==9) {
      // dibujar juego
      juegos[tipoDeObstaculo].dibujar();
      juegos[tipoDeObstaculo].ganaste();
      ganaste=juegos[tipoDeObstaculo].ganaste;
      if (ganaste==0) {
        pantallaActual=10;
      } else if (ganaste==1) {
        pantallaActual=11;
      }
      fill(0);
      text("Juega con \nlas flechas", 2, 380);
      text("Juega con \nlas flechas", 602, 380);
      fill(255);
      text("Juega con \nlas flechas", 0, 380);
      text("Juega con \nlas flechas", 600, 380);
    } else if (pantallaActual==10) {
      ganaste=3;
      juegos[tipoDeObstaculo].resetearJuego();
      dibujarBotonesFinales("Reiniciar","Inicio");
    } else if (pantallaActual==11) {
      ganaste=3;
      juegos[tipoDeObstaculo].resetearJuego();
      dibujarBotonesFinales("Reiniciar","Inicio");
    }
  }

  void teclasParaJuego() {
    
    if (pantallaActual==9) {
      juegos[tipoDeObstaculo].teclasPersonaje();
    }
  }

  void dibujarTextoSuperior(String texto) {
    
    textSize(20);
    int ancho1=650;
    int alto1=50;
    int posXcuadro=10;
    int posYcuadro=10;
    fill(255, 0, 0, 100);
    rect(posXcuadro, posYcuadro, 650, 50, 7);
    fill(255);
    text(texto, posXcuadro+ancho1/2, posYcuadro+alto1/2);
  }

  void dibujarBotones(String texto1, String texto2, String texto3) {
    
    textSize(19);
    if (texto1 != null && texto2 == null && texto3 == null) {
      fill(252, 3, 220, 100);
      rect(200, 450, 300, 50, 7);
      fill(255);
      text(texto1, 200+(300/2), 450+(50/2));
    } else if (texto1 != null && texto2 != null && texto3 == null) {
      fill(0, 0, 255, 100);
      rect(200-5, 450, 150, 50, 7);
      fill(255, 0, 255, 100);
      rect(350+5, 450, 150, 50, 7);
      fill(255);
      text(texto1, 200+(150/2)-5, 450+(50/2));
      text(texto2, 350+(150/2)+5, 450+(50/2));
    } else {
      fill(255, 100, 0, 100);
      rect(200-10, 450, 100, 50, 7);
      fill(255, 0, 255, 100);
      rect(300, 450, 100, 50, 7);
      fill(255, 100, 0, 100);
      rect(400+10, 450, 100, 50, 7);
      fill(255);
      text(texto1, 200+(100/2)-10, 450+(50/2));
      text(texto2, 300+(100/2), 450+(50/2));
      text(texto3, 400+(100/2)+10, 450+(50/2));
    }
  }
  
  void dibujarBotonesFinales(String texto1, String texto2){
    
      textSize(34);
      textFont(fuente);
      fill(0, 255, 200, 100);
      rect(50, 400, 154, 50, 7);
      rect(500, 400, 154, 50, 7);
      fill(0);
      text(texto1, 50+(154/2), 400+(50/2));
      text(texto2, 500+(154/2), 400+(50/2));
  }
}
