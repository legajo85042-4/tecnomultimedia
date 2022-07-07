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
