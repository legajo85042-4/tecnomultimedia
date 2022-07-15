void menu(){image (imagen4,0,0);}
 
void instrucciones(){image (imagen5,0,0);
  int posy = 200;
  int margen = 5;
  int f =width-margen;
  int j=0;
  for(j=margen; j< f; j++){
    float m=map(j,0,f,214,0);
    if (j%20 > 10){stroke(189,m,0);}
    else {stroke(189,0,m);}
    line(j*1,height*0.47+posy,j*1,height*0.60+posy);
 }}

void creditos(){image (imagen6,0,0);
  fill(255,0,0);
  stroke(214,189,0);
  strokeWeight(15);
  noFill();
  rect (0, 0, 700,700);
  int margen = 35;
  int f =width-margen;
  for(int j=margen; j< f; j++){
    float m=map(j,0,f,214,0);
    stroke(189,m,0,50);
    line(j*1,height*0.47-20,j*1,height*0.62-20);}
  fill(0);
  textSize(26); 
  text("CREDITOS\n \n ALUMNO  Juan Isidro Yalet Asurmendi \nPROFESOR Leonardo Garay",width/2,height/2-20);  } 
          
void vosperdiste(){  if (perdiste==1){image (imagen6,0,0);}  }

void vosganaste(){  if (ganaste==1){image (imagen7,0,0);}  }  

void pantallas(int pantalla){
 switch(pantalla){  
  case 0:
  perdiste=0; ganaste=0; Tempfila=0; Tempcolumna = 0 ;
  menu();
  inicializarCasillas();
  ponerMinas(numerodeminas); 
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
  break;}}
