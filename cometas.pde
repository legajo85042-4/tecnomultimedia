class Cometa {
  int tam=12;
  int posX;
  int posY;
  int opacidad=30;
  int largo =13;
  int z;
  int velocidad=3;
  
  Cometa(){
     posX = round(random(tam, width -tam));
     posY = round(random(tam, height -tam));
   
  }

  void dibujar(){
    pushMatrix();
 
    rotate(PI/-4.0);
    translate(-width/2,0);
    noStroke();
    calcularPosicion();
    
  //forma del cometa
    for(int j=1; j < tam; j++){
      z=round(map(j,0,tam,0,largo));
    fill(0,0,255, opacidad-(j)); 
    ellipse(posX+(z*z), posY,  z*z,tam);}
    for(int j=1; j < tam; j++){
      z=round(map(j,0,tam,0,largo));
    fill(0,255,255, opacidad-(j+j)); 
    ellipse(posX+(z*z)-z, posY,  z*z,tam+z+z-4);}
    for(int j=1; j < tam; j++){
      z=round(map(j,0,tam,0,largo));
    fill(0,255,100, opacidad-(j)); 
    ellipse(posX+(z*z)-3, posY,  z*z,tam-6);}
    popMatrix();
  }
  
  void calcularPosicion() {
    if (posX<=velocidad){posX=width;}
    if (posX>0){posX=posX-velocidad;}}
}
