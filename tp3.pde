//https://youtu.be/jaVIL6RWAts
//Juan Isidro Yalet Asurmendi 85042/4
PImage imagen, imagen2, imagen3, imagen4, imagen5, imagen6, imagen7, imagen8;
PFont fuente;
int anchoCasilla, altoCasilla;
int columnasTablero = 11;
int filasTablero = 11;
int [][] Casillas;
int Tempfila = 0;
int Tempcolumna = 0;
int perdiste = 0;
int ganaste = 0;
int secuencia = 0;
int numerodeminas = 30;

void setup () {

size (700,700);
frameRate(13);
textAlign(CENTER);
fuente = loadFont("Circus-48.vlw");
textFont(fuente);
imagen = loadImage ("imagen1.jpg");
imagen2 = loadImage ("imagen2.jpg");
imagen3 = loadImage ("imagen3.png");
imagen4 = loadImage ("imagen4.png");
imagen5 = loadImage ("imagen50.png");
imagen6 = loadImage ("imagen6.png");
imagen7 = loadImage ("imagen7.png");
imagen8 = loadImage ("imagen80.png");
Casillas = new int [filasTablero][columnasTablero];
anchoCasilla = width/filasTablero;
altoCasilla = height/columnasTablero;}
 
void draw(){pantallas(secuencia);}

void mouseClicked(){
  if (mouseX < 642 && mouseX > 533 && mouseY < 339 && mouseY > 294){secuencia=1;}
  if (mouseX < 676 && mouseX > 543 && mouseY < 677 && mouseY > 632){secuencia=0;}
  if (mouseX < 243 && mouseX > 150 && mouseY < 576 && mouseY > 495){secuencia=2;}
  if (mouseX < 177 && mouseX > 53 && mouseY < 338 && mouseY > 297){secuencia=3;}}
