class MenuInicio {

  int trackPlay=1;
  int trackInicio=0;
  PImage img1, imgCreditos, imgSoundOff, imgSoundON;
  PFont fuente;
  int opciones=0;
  Historia historia;


  MenuInicio() {

    historia = new Historia();
    img1 = loadImage("pantallainicio.png");
    imgCreditos = loadImage("imagencreditos.jpg");
    imgSoundOff= loadImage("soundOff0.png");
    imgSoundON= loadImage("soundOn0.png");
    fuente = loadFont("CheapFire-48.vlw");
    textFont(fuente);
  }

  void dibujar() {
    
    noStroke();
    image(img1, 0, 0, width, height);
    dibujarBotonesDeInicio();
    dibujarBotonMusica();
    if (trackInicio==0) {
      fileTrack.play();
      trackInicio=1;
    }
    if (opciones==1) {
      dibujarCreditos();
    } else if (opciones==2) {
      historia.dibujar();
    }
  }

  void dibujarCreditos() {
    
    image(imgCreditos, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    rect(500, 400, 150, 50, 7);
    fill(255, 0, 0);
    textSize(50);
    text("FDA \n Tecnologia Multimedial 1 \n Isidro Yalet \n Prof Leonardo Garay", width/2, height/2);
    fill(255);
    text("FDA \n Tecnologia Multimedial 1 \n Isidro Yalet \n Prof Leonardo Garay", (width/2)-4, (height/2)-4);
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("Inicio", 575, 440);
  }

  void dibujarBotonesDeInicio() {
    
    strokeWeight(4);
    stroke(0);
    textAlign(LEFT);
    textSize(40);
    fill(255, 0, 0);
    rect(50, 400, 150, 50, 7);
    rect(500, 400, 150, 50, 7);
    fill(0);
    text("Creditos", 60, 440);
    text("Historia", 514, 440);
  }

  void botones() {
    
    if (opciones==0) {
      if (mouseX < 200 && mouseX > 50 && mouseY < 450 && mouseY > 400) {
        opciones=1;
      }
      if (mouseX < 650 && mouseX > 500 && mouseY < 450 && mouseY > 400) {
        opciones=2;
      }

      if (mouseX < 650 && mouseX > 600 && mouseY < 300 && mouseY > 250) {
        if (trackPlay==0) {
          fileTrack.play();
          trackPlay=1;
        } else if (trackPlay==1) {
          fileTrack.stop();
          trackPlay=0;
        }
      }
    } else if (opciones==1) {
      if (mouseX < 650 && mouseX > 500 && mouseY < 450 && mouseY > 400) {
        opciones=0;
      }
    } else if (opciones==2) {
      historia.seleccionDeEscenas();
      if (historia.pantallaActual==10||historia.pantallaActual==11) {
        if (mouseX < 650 && mouseX > 500 && mouseY < 450 && mouseY > 400) {
          opciones=0;
          historia.reinicioHistoria();
        }
      }
    }
  }

  void teclasParaJuego() {
    
    if (opciones==2) {
      historia.teclasParaJuego();
    }
  }

  void dibujarBotonMusica() {
    
    if (trackPlay==0) {
      image(imgSoundOff, 600, 250, imgSoundOff.width, imgSoundOff.height);
    } else if (trackPlay==1) {
      image(imgSoundON, 600, 250, imgSoundON.width, imgSoundON.height);
    }
  }
}
