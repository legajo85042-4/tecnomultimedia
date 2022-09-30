class Tierra {
  PImage img;
  int posX;
  int posY = height - (height/4);
  int ancho = width;
  int alto = height - (height/4);
  Lapida [] lapidas;
  Flor [] flores;
  int cantLapidas=20;
  int cantFlores=5;
  
  Tierra(){
    img = loadImage("sueloo.png");
    flores = new Flor [cantFlores];
    lapidas = new Lapida [cantLapidas];
    for (int i = 0; i < cantLapidas; i++) {
       lapidas[i] = new Lapida();       
       }
    for (int i = 0; i < cantFlores; i++) {
      int _posX= lapidas[i].posX;
      int _posY= lapidas[i].posY;
       flores[i] = new Flor(_posX,_posY);}
  }
  
  void dibujar(){
  image(img, posX, posY, ancho, alto);
  for (int x = 0; x < cantLapidas; x++) {
  lapidas[x].dibujar();
  }
   for (int x = 0; x < cantFlores; x++) {flores[x].dibujar();}
  }
}
