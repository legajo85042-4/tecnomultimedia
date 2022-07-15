void inicializarCasillas(){
  for (int fila = 0; fila < columnasTablero; fila++){
    for (int columna= 0; columna < filasTablero; columna++){
      Casillas[columna][fila]=2;} } } 

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
          
 
