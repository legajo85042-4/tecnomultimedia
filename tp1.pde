
  PImage imagen, imagenA, imagenB, imagen1, imagen2, imagen3, imagen4, imagen5, imagen6, imagen7, imagen8;

  int posicionY;
  int posicionX;
  int marco = 0;

  float R ; 
  
  PFont fuente;
  int textoSize = 14;
  String texto = "bien";
  color marcolor = (0);
  
  void setup() {
    size(400, 400);

    fuente = loadFont("CheapFire-48.vlw");
    textFont(fuente);
    
    imagen1 = loadImage ("imagen1.png");
    imagen2 = loadImage ("imagen2.png");
    imagen3 = loadImage ("imagen3.png");
    imagen4 = loadImage ("imagen4.png");
    imagen5 = loadImage ("imagen5.png");
    imagen6 = loadImage ("imagen6.png");
    imagen7 = loadImage ("imagen7.png");
    imagen8 = loadImage ("imagen8.png");
    
    posicionY = height;

    textAlign(CENTER);

  }
  void draw() { 
    background(marcolor);

    fill(0);

    R = map(posicionY, mouseY, 0, 0, 200);
    //B = map(posicionX, mouseX, 0, 0, 200);
    marcolor = color(R,0,0);
    
    if (posicionY >= 0 && marco < 7) {
      posicionY-=3;
    } else {
      posicionY = height;
    } 
    
     if (posicionY >= 0 && marco < 7) {
      posicionX+=4;
    } else {
      posicionX = 0;
    } 
    
    if (posicionY <= 0) {
      marco++;


    }
 
    if (marco == 0) {
      textoSize = 30;
      texto = "ARNOLD \n SHWARZENEGGER";
      imagen=imagen1;
      imagenA=imagen7;
      imagenB=imagen2;
    }
    if (marco == 1) {
      textoSize = 30;
      texto = "LINDA HAMILTON";
      imagen=imagen2;
      imagenA=imagen3;
      imagenB=imagen7;

    } else if (marco == 2) {
      textoSize = 28;
      texto = "ROBERT PATRIC";
      imagen=imagen3;
      imagenA=imagen8;
      imagenB=imagen4;

    } else if (marco == 3) {
      textoSize = 28;
      texto = "JOE MORTON";
      imagen=imagen4;
      imagenA=imagen5;
      imagenB=imagen7;

    } else if (marco == 4) {
      texto = "EARL BOEN \n\nS. EPATHA MERKERSON";
      imagen=imagen5;
      imagenA=imagen8;
      imagenB=imagen6;

    } else if (marco == 5) {
      texto = "DANNY COOKSEY \n \nCASTULO GUERRA";
      imagen=imagen6;
      imagenA=imagen7;
      imagenB=imagen8;
    }
    if(marco == 6){
      textoSize = 48;
      texto = "TERMINATOR 2 \nJUDGMENT DAY";
      imagen=imagen7;
      imagenA=imagen7;
      imagenB=imagen1;
    }
    if(marco == 7){
      marco = 0;
    }
    if (marco%2 == 0){
    image (imagenA,posicionY-200,0);
    image (imagen,-50,50);
    image (imagenB,posicionX-200,100);}
    else{
      image (imagenB,posicionX-200,100);
      image (imagen,50,50);
      image (imagenA,posicionY-200,0);
    }
   
    text(texto, width/2, posicionY+60);
   
    fill(255);
    textSize(20);
    text("RESET",358,385);
    textSize(textoSize);
  }
 
  void mouseClicked(){
    if (mouseX < 390 && mouseX > 325 && mouseY < 390 && mouseY > 370){
      marco=0;
     setup();
    }
   }
