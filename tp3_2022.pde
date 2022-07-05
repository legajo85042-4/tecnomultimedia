    int anchoCasilla, altoCasilla;
    int columnasTablero = 11;
    int filasTablero = 11;
    int [][] Casillas;
    boolean [] keyy = new boolean[128];
    PImage imagen, imagen2, imagenn3;
    int Tempfila=0;
    int Tempcolumna = 0 ;
    int perdiste =0;
    int ganaste =0;
    int secuencia=0;
    
    void setup () {
    
    size (700,700);
    frameRate(10);
    textAlign(CENTER);
    imagen = loadImage ("imagen1.jpg");
    imagen2 = loadImage ("imagen2.jpg");
    imagenn3 = loadImage ("imagen3.jpg");
    Casillas = new int [filasTablero][columnasTablero];
    anchoCasilla = width/filasTablero;
    altoCasilla = height/columnasTablero;
     inicializarCasillas();
    ponerMinas(35);
    
     }
     
    void draw(){
     switch(secuencia){  
     case 0:
     perdiste=0;
     ganaste=0;
     Tempfila=0;
     Tempcolumna = 0 ;
     instrucciones();inicializarCasillas();ponerMinas(35); 
     break;
     case 1:
     ponerMoto();
     dibujarTablero ();
     vosperdiste();
     vosganaste(); 
     break;
    }
    }
    
     void keyPressed() {keyy[key]=true;}
     void keyReleased() {keyy[key]=false;}
     
     void mouseClicked(){
    if (mouseX < width/2+30 && mouseX > width/2-30 && mouseY < height/2+30 && mouseY > height/2-30){secuencia=1;}
    if (mouseX < 690 && mouseX > 625 && mouseY < 690 && mouseY > 670){secuencia=0;}}
