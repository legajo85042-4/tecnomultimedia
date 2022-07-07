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
 
void draw(){
 switch(secuencia){  
  case 0:
  perdiste=0; ganaste=0; Tempfila=0; Tempcolumna = 0 ;
  menu();
  inicializarCasillas();
  ponerMinas(30); 
  break;
  case 1:
  ponerMoto();
  dibujarTablero();
  vosperdiste();
  vosganaste(); 
  break;
  case 2:
  instrucciones();
  break;
  case 3:
  creditos();
  break;} }

void mouseClicked(){
  if (mouseX < 642 && mouseX > 533 && mouseY < 339 && mouseY > 294){secuencia=1;}
  if (mouseX < 676 && mouseX > 543 && mouseY < 677 && mouseY > 632){secuencia=0;}
  if (mouseX < 243 && mouseX > 150 && mouseY < 576 && mouseY > 495){secuencia=2;}
  if (mouseX < 177 && mouseX > 53 && mouseY < 338 && mouseY > 297){secuencia=3;}}

//FUNCIONES FUNCIONES FUNCIONES

void inicializarCasillas(){
  for (int fila = 0; fila < columnasTablero; fila++){
    for (int columna= 0; columna < filasTablero; columna++){
      Casillas[columna][fila]=2;} } } 

void ponerMinas (int numdeminas){
  int minasgeneradas = 0;
  int posTempfila;
  int posTempcolumna; 
  for (int fila = 0; fila < numdeminas; fila++){
    if(minasgeneradas<numdeminas){
      posTempfila = int(random(0, filasTablero));
      posTempcolumna= int(random(0, columnasTablero));
    if(Casillas[posTempfila][posTempcolumna]==2){
      Casillas[posTempfila][posTempcolumna]=1;
      minasgeneradas ++;}}}
 Casillas[columnasTablero-1][filasTablero-1]=1; }

void ponerMoto(){
Casillas[Tempfila][Tempcolumna]=3;
  if (keyPressed && keyCode == LEFT){ 
    if (Tempfila>0){
      Tempfila--;
      if (Casillas[Tempfila][Tempcolumna]==2){
        Casillas[Tempfila+1][Tempcolumna]=2;
         Casillas[Tempfila][Tempcolumna]=3;}
      else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}}
      else if (Tempfila<0){Tempfila++;} }      
  if (keyPressed && keyCode == RIGHT){
    if(Tempfila==(filasTablero-1)){
      Tempfila=filasTablero-2;
      Casillas[Tempfila-1][Tempcolumna]=2;}
    if (Tempfila<=(filasTablero-1)){Tempfila++;
      if (Casillas[Tempfila][Tempcolumna]==2){
        Casillas[Tempfila-1][Tempcolumna]=2;
        Casillas[Tempfila][Tempcolumna]=3;}
      else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}} }
  if (keyPressed && keyCode == DOWN){
    if(Tempcolumna==(columnasTablero-1)){
     Tempcolumna=columnasTablero-2;
     Casillas[Tempfila][Tempcolumna-1]=2;}
   if (Tempcolumna<=(columnasTablero-1)){Tempcolumna++;
      if (Casillas[Tempfila][Tempcolumna]==2){
         Casillas[Tempfila][Tempcolumna-1]=2;
         Casillas[Tempfila][Tempcolumna]=3;}
      else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}}}
  if (keyPressed && keyCode == UP){
    if (Tempcolumna<0){Tempcolumna++;}
    else if (Tempcolumna>0){Tempcolumna--;
     if (Casillas[Tempfila][Tempcolumna]==2){
        Casillas[Tempfila][Tempcolumna+1]=2;
        Casillas[Tempfila][Tempcolumna]=3;}
     else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}}}  }

void dibujarTablero (){
  stroke(0,255,0);
  strokeWeight(1);
  for (int fila = 0; fila < columnasTablero; fila++){
    for (int columna= 0; columna < filasTablero; columna++){
      if(Casillas[columna][fila] == 1){
        image (imagen,columna * anchoCasilla, fila * altoCasilla, imagen.width/4, imagen.height/4);
        noFill();
        rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);
        if (columna==columnasTablero-1 && fila==filasTablero-1){
          image (imagen3,columna * anchoCasilla, fila * altoCasilla, imagen.width/4, imagen.height/4);
          noFill();
          rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);}}
      else if(Casillas[columna][fila] == 2){
          fill(245);
          rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);}
      else if(Casillas[columna][fila] == 3){
          image (imagen2,columna * anchoCasilla, fila * altoCasilla, imagen.width/4, imagen.height/4);
          noFill();
          rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);}
      else if(Casillas[columna][fila] == 4){
          fill(0);
          rect (0, 0, 700,700);
          if (columna==(columnasTablero-1) && fila==(filasTablero-1)){ganaste=1;} else{perdiste=1;}}}}  }
          
 
void menu(){image (imagen4,0,0);}
 
void instrucciones(){image (imagen5,0,0);}

void creditos(){image (imagen8,0,0);
  fill(255,0,0);
  stroke(214,189,0);
  strokeWeight(15);
  noFill();
  rect (0, 0, 700,700);
  int margen = 35;
  int f =width-margen;
  for(int j=margen; j< f; j++){
    float m=map(j,0,f,214,0);
    stroke(0,m,189);
    line(j*1,height*0.47,j*1,height*0.62);}
  fill(0);
  textSize(26);
  text("CREDITOS\n \n ALUMNO  Juan Isidro Yalet Asurmendi \nPROFESOR Leonardo Garay",width/2,height/2);  } 
          
void vosperdiste(){  if (perdiste==1){image (imagen6,0,0);}  }

void vosganaste(){  if (ganaste==1){image (imagen7,0,0);}  }  
