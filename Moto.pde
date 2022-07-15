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
