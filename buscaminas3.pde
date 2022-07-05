     void inicializarCasillas(){
      for (int fila = 0; fila < columnasTablero; fila++){
        for (int columna= 0; columna < filasTablero; columna++){
        Casillas[columna][fila]=2;}}
    } 
    
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
     Casillas[columnasTablero-1][filasTablero-1]=1;
   
    }
    void instrucciones(){
    fill(255,152,15);
    stroke(214,189,0);
   strokeWeight(15);
    rect (0, 0, 700,700);
    fill(255);
    textSize(20);
    text("< PLAY! >\n\n INSTRUCCIONES: \n A: izquierda \n D: derecha \n W: arriba \n S: abajo \n OBJETIVO: Llegar al cuadrado rojo sin explotar",width/2,height/2);
    
    
    }
    void ponerMoto(){
    Casillas[Tempfila][Tempcolumna]=3;
      if (keyy['a']){ 
        if (Tempfila>0){
        Tempfila--;
        if (Casillas[Tempfila][Tempcolumna]==2){
        Casillas[Tempfila+1][Tempcolumna]=2;
        Casillas[Tempfila][Tempcolumna]=3;}
        else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}}
         else if (Tempfila<0){
        Tempfila++;}
      }
      if (keyy['d']){
        if(Tempfila==(filasTablero-1)){
        Tempfila=filasTablero-2;
        Casillas[Tempfila-1][Tempcolumna]=2;
      }
        if (Tempfila<=(filasTablero-1)){
        Tempfila++;
        if (Casillas[Tempfila][Tempcolumna]==2){
        Casillas[Tempfila-1][Tempcolumna]=2;
        Casillas[Tempfila][Tempcolumna]=3;}
        else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}}
        
      }
      if (keyy['s']){
        if(Tempcolumna==(columnasTablero-1)){
        Tempcolumna=columnasTablero-2;
        Casillas[Tempfila][Tempcolumna-1]=2;}
        if (Tempcolumna<=(columnasTablero-1)){
        Tempcolumna++;
         if (Casillas[Tempfila][Tempcolumna]==2){
        Casillas[Tempfila][Tempcolumna-1]=2;
        Casillas[Tempfila][Tempcolumna]=3;}
        else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}}
      }
      if (keyy['w']){
        if (Tempcolumna<0){
        Tempcolumna++;}
        else if (Tempcolumna>0){
        Tempcolumna--;
         if (Casillas[Tempfila][Tempcolumna]==2){
        Casillas[Tempfila][Tempcolumna+1]=2;
        Casillas[Tempfila][Tempcolumna]=3;}
        else if(Casillas[Tempfila][Tempcolumna]==1){Casillas[Tempfila][Tempcolumna]=4;}}
      }
      
  
      
    }
        
    void dibujarTablero (){
   // stroke(252,212,5);
   stroke(0,255,0);
   strokeWeight(1);
      for (int fila = 0; fila < columnasTablero; fila++){
        for (int columna= 0; columna < filasTablero; columna++){
          if(Casillas[columna][fila] == 1){
            image (imagen,columna * anchoCasilla, fila * altoCasilla, imagen.width/4, imagen.height/4);
            noFill();
            
            rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);
          if (columna==columnasTablero-1 && fila==filasTablero-1){
       
            fill(255,0,0);
            rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);}}
           else if(Casillas[columna][fila] == 2){
            fill(245);
            rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);
          } else if(Casillas[columna][fila] == 3){
            image (imagen2,columna * anchoCasilla, fila * altoCasilla, imagen.width/4, imagen.height/4);
            noFill();
            rect (columna * anchoCasilla, fila * altoCasilla, anchoCasilla,altoCasilla);
          }else if(Casillas[columna][fila] == 4){
            fill(0);
            rect (0, 0, 700,700);
            if (columna==(columnasTablero-1) && fila==(filasTablero-1)){
            ganaste=1;}else{perdiste=1;}
          }
         
        }
      }
    }
    void vosperdiste(){
    if (perdiste==1){
      fill(0);
      stroke(214,189,0);
   strokeWeight(15);
    rect (0, 0, 700,700);
    textSize(20);
    fill(255);
    text("PERDISTE!",width/2,height/2);
    text("RESET",658,685);}}
    void vosganaste(){
    if (ganaste==1){
      fill(255,0,0);
      stroke(214,189,0);
   strokeWeight(15);
    rect (0, 0, 700,700);
    fill(0);
    textSize(20);
    text("GANASTE!",width/2,height/2);
    text("RESET",658,685);}}
