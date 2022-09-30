class Estrella {
  int posY;
  int posX;
  int tam = 10;
  int cantLuz = 8;
  int opacidad =70;
  int nivelesEstrellas =9;
  int nivel =0;
  Estrella(){
  posX = round(random(tam, width -tam));
  posY = round(random(tam, height -tam));
  nivel = round(random(0, nivelesEstrellas));}
  
  void dibujar() {
    tam = round(map(nivel, 0, nivelesEstrellas,0,cantLuz));
    noStroke();
    for(int j=1; j < tam; j++){
      if(nivel>=(nivelesEstrellas-1)){
    fill(255,255,255, opacidad); }
    else if(nivel>=(nivelesEstrellas-2)){
    fill(255,219,219, opacidad);}
    else if(nivel>=(nivelesEstrellas-3)){
    fill(149,251,255, opacidad);}
    else if(nivel>=(nivelesEstrellas-4)){
    fill(249,255,173, opacidad);}
    ellipse(posX, posY, j*2, j*2); 
    if(nivel>=(nivelesEstrellas-1)){
    fill(255,255,255, opacidad-60);ellipse(posX, posY, 2, j*9);ellipse(posX, posY, j*9,2 ); }
    }
  }
}
