class Cielo {
  int cant;
  int cantConstelaciones = 400;
  int cantCometas =3;
  int dist = 100;
  Estrella [] estrellas;
  Constelacion constelaciones;
  Cometa [] cometa;
  
  Cielo(int cantEstrellas){
    cant = cantEstrellas;
    estrellas = new Estrella [cant];
    constelaciones = new Constelacion(0,0,0,0);
    cometa = new Cometa [cant];
    
     for (int i = 0; i < cant; i++) {
       estrellas[i] = new Estrella();
     }
     for (int i = 0; i < cantCometas; i++) {
       cometa[i] = new Cometa();
     }
  }
  
  void dibujar(){
   dibujarConstelaciones();
    for (int i = 0; i < cant; i++) {
      estrellas[i].dibujar();
      }
    for (int x = 0; x < cantCometas; x++) {
      cometa[x].dibujar();
    }
  }
  
  void dibujarConstelaciones(){
      for (int i = 0; i < cantConstelaciones; i++) {
        Estrella estrellaAComparar = estrellas[i];
      for (int j = 0; j < cantConstelaciones; j++) {

        Estrella estrellaSegunda =  estrellas[j];
      if (i != j  && estanCercaEntre(estrellaAComparar, estrellaSegunda)){
       int x1=estrellaAComparar.posX;
       int y1=estrellaAComparar.posY;
       int x2=estrellaSegunda.posX;
       int y2=estrellaSegunda.posY;
        if(estrellaAComparar.nivel==estrellaAComparar.nivelesEstrellas && estrellaSegunda.nivel ==estrellaSegunda.nivelesEstrellas){
      constelaciones = new Constelacion(x1,y1,x2,y2);
      constelaciones.dibujar();}}
      }}
        
  }
  
  boolean estanCercaEntre(Estrella estrella1, Estrella estrella2){
    return dist(estrella1.posX, estrella1.posY, estrella2.posX, estrella2.posY) < (dist);
  }
}
