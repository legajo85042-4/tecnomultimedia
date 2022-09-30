//https://youtu.be/KhfOZUV9QJA
//Juan Isidro Yalet Asurmendi 85042/4
Cielo cielo;
Tierra tierra;

void setup(){
  size(700,500);
  cielo = new Cielo(500);
  tierra = new Tierra();}
  
void draw(){
  background(0);
  cielo.dibujar();
  tierra.dibujar();}
