//JUAN ISIDRO YALET ASURMENDI 85042/4
//video https://youtu.be/IMksH5yOGd4
int estilo;
float m;
float g1,g2;
//ilusion 1y2b
  float escala =2;
  int fondo=1;
  //circulos
    int r_circ =250;
    int g_circ =255;
    int b_circ =0;
    int t_circ =13;
    float tamanio_circ=20/escala+escala*3;
    float distancia_circ=275/escala;
    float c2;
  //fondo
    float tamanio_fondo=distancia_circ*2+distancia_circ*0.555;
    float coordenadas=-distancia_circ-distancia_circ*0.28;
  //cruz
    float tamanio=20/escala;
    float yy=tamanio/10;
//ilusion 1y2a
  int t;
  int f;
  int margen=15;
  int anchobarra=50;

float x1;
float v2;
int z;

void setup(){
  size (700, 700);
  frameRate(10);
}
void draw() {
   background(255);
   fill(0);
   for(int r=0; r<3; r++){
     if (r==0){g1=0.5; g2=0.5;}
     if (r==1){g1=0.8; g2=0.2;}
     if (r==2){g1=0.2; g2=0.8;}
   quad(width*g1+10,height*g2-30,width*g1+20,height*g2-30,width*g1, height*g2,width*g1, height*g2);
   quad(width*g1+30,height*g2-10,width*g1+30,height*g2-20,width*g1, height*g2,width*g1, height*g2);
   quad(width*g1-30,height*g2+10,width*g1-30,height*g2+20,width*g1, height*g2,width*g1, height*g2);
   quad(width*g1-10,height*g2+30,width*g1-20,height*g2+30,width*g1, height*g2,width*g1, height*g2);}

  //circulo
   float tamanio_circ=20/escala+escala*3;
    float distancia_circ=275/escala;
    float c2;
  //fondo
    float tamanio_fondo=distancia_circ*2+distancia_circ*0.555;
    float coordenadas=-distancia_circ-distancia_circ*0.28;
  //cruz
    float tamanio=20/escala;
    float yy=tamanio/10;
if (estilo==0){escala=2; fondo=1;
     r_circ =250;
     g_circ =255;
     b_circ =0;}
if (estilo==1){escala=3; fondo=1;
     r_circ =0;
     g_circ =250;
     b_circ =255;}
if (estilo==2){escala=3; fondo=0;
     r_circ =255;
     g_circ =0;
     b_circ =250;}
if (estilo==3){escala=2; fondo=0;
     r_circ =0;
     g_circ =250;
     b_circ =255;}
else if(estilo==4){estilo=0;}
   f++;
//ilusion 1a;
if (f<350){
for(int j=0; j< f; j++){
  m=map(j,0,350,0,255);
  stroke(m);
line(350+j*1,0,350+j*1,height/2);}}
else{f=0;}
fill(100);
noStroke();
rect(350+margen,350/2-anchobarra/2,350-margen*2,anchobarra);

//ilusion 2a
if (f<350){
for(int j=0; j< f; j++){
  m=map(j,0,350,0,255);
  stroke(m);
line(j*1,350+0,j*1,height);}}
else{f=0;}
fill(100);
noStroke();
rect(margen,525-anchobarra/2,350-margen*2,anchobarra);

//ilusion 1b
   translate(width/4, height/4);
   //cruz
   if(fondo==1){fill(145);}
   if(fondo==0){fill(0);}
   rect(coordenadas,coordenadas,tamanio_fondo,tamanio_fondo);
   if(fondo==0){fill(255);}
   if(fondo==1){fill(0);}
   rect(0-tamanio/2, 0-yy/2, tamanio, yy);
   rect(0-yy/2, 0-tamanio/2, yy, tamanio);

   z++;

   if(z<12){for(int p=0; p<z; p++){rotate(PI/6.0);}}
   
   else{z=0;}
 
   for(int c=0; c<11; c++){rotate(PI/6.0);
   //circulo
   for(int v=0; v<tamanio_circ; v++){
   c2=tamanio_circ/5;
   x1=v*c2;
   v2= v/4;
   noStroke();
   fill(r_circ,g_circ,b_circ,t_circ-v2);
   ellipse(0,distancia_circ, x1, x1);
}}
//ilusion 2b
 z++;

rotate(PI/-6.0);
   if(z<12){for(int p=0; p<z; p++){rotate(PI/-6.0);}}
   
   else{z=0;}

   translate(-width*0.5, height*0.5);
   //cruz
   if(fondo==1){fill(145);}
   if(fondo==0){fill(0);}
   rect(coordenadas,coordenadas,tamanio_fondo,tamanio_fondo);
   if(fondo==0){fill(255);}
   if(fondo==1){fill(0);}
   rect(0-tamanio/2, 0-yy/2, tamanio, yy);
   rect(0-yy/2, 0-tamanio/2, yy, tamanio);
   if(z<12){for(int p=0; p<z; p++){rotate(PI/6.0);}}
   
   else{z=0;}
  
 
   for(int c=0; c<11; c++){rotate(PI/6.0);
   //circulo
   for(int v=0; v<tamanio_circ; v++){
   c2=tamanio_circ/5;
   x1=v*c2;
   v2= v/4;
   noStroke();
   fill(r_circ,g_circ,b_circ,t_circ-v2);
   ellipse(0,distancia_circ, x1, x1);
}}

}
  void mouseClicked(){
  estilo++;}
