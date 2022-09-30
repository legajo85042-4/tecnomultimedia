class Lapida {
  PImage img, img2;
  int posX;
  int posY ;
  int ancho = 33;
  int alto = 33;
  int tam;
  int cantEspaciosX=18;
  int cantEspaciosY=2;
  int caraocruz;
  
  Lapida(){
  img = loadImage("lapida.png");
  img2 = loadImage("cruz.png");
  posX = round(map(round(random(0, cantEspaciosX)),0,cantEspaciosX,0,width -ancho));
  posY = round(map(round(random( 0, cantEspaciosY)),0,cantEspaciosY, height - (height/4)-(alto/2), height - alto-(alto/2)));
  caraocruz = round(random(0,1));
    }
  
  void dibujar(){
    int tamRelativo=round(map( posY,height - (height/4)-(alto/2), height - alto,0, ancho-(ancho/5)));
      if(caraocruz==0){
        image(img, posX, posY, ancho+tamRelativo, alto+tamRelativo);}
      else {image(img2, posX, posY, ancho+tamRelativo, alto+tamRelativo);}
    }
}
