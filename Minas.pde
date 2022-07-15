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
