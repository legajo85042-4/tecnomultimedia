class Constelacion{
  int posXA;
  int posYA;
  int posXB;
  int posYB;
  
  Constelacion(int XA, int YA, int XB, int YB){
  posXA=XA; posYA=YA; posXB=XB; posYB=YB;}
  
  void dibujar(){
  stroke(255);
  line(posXA, posYA, posXB, posYB);
  }
}
