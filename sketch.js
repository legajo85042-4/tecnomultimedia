
var estela = [];

var posiciones = [40, 55, 77, 97, 38, 59, 70, 85];

var tipo = 0;

var imgFinos = [];
var imgGruesos = []
var imgFiguras = [];
var imgFigurasEfx = [];
var imgVidrio;
var imgFondoSalpicado;
var imgFondoTextura = [];

let colores = [
  //255, 255, 255, 200,
  //255, 255, 0, 200,
  255, 132, 188, 200,
  245, 208, 111, 200,
  196, 184, 80, 200,
  234, 184, 16, 200,
  252, 221, 9, 200,
  0, 100, 255, 200,
  //0, 255, 0, 200,
  //255, 0, 255, 200
];

var backColor = 4 * 4;

var finosCant = 4;
var gruesosCant = 8;
var figurasCant = 8;
var texturasCant = 2;
var numeros = [0, 1, 2, 3, 4, 5, 6, 7];
var numeros2 = [0, 1, 2, 3, 4, 5, 6, 7];
let numFina = [];
let numGruesa = [];
let numFigura = [];
var escala = 0.8777;

let z = 0;
let f = 0;
let posLineas = 100; //posicion de la primera linea

let colorAleatorio;
let aleatorio;
let espejo;

var lineas;
var fondoLineas;
let figurasON = true;
let strobe2ON = false;

let comienzo;

//-------------------eventos de sonido para interaccion

let haySonidoAltoYAgudo = false;
let thresholdVolAlto = 0.1;
let thresholdPitchAlto = 0.1;
let antesHabiaSonido = false;
let altoEvento = false;
let buenComienzo = false;


function preload() {
  for (let index = 0; index < 8; index++) {
    let a = index + 1;
    if (index < finosCant) {
      imgFinos[index] = loadImage('imagenes/finos rojos/' + a + '.png');
    }
    if (index < gruesosCant) {
      imgGruesos[index] = loadImage('imagenes/gruesos2/' + a + '.png');
    }
    if (index < figurasCant) {
      imgFiguras[index] = loadImage('imagenes/figuras lowfi/' + a + '00.png');
      imgFigurasEfx[index] = loadImage('imagenes/figuras lowfi/' + a + '10.png');
    }
    if (index < texturasCant) {
      imgFondoTextura[index] = loadImage('imagenes/texturas/t' + a + '.png');
    }
  }
  imgVidrio = loadImage('imagenes/texturas/broken.png');
  imgFondoSalpicado = loadImage('imagenes/texturas/mancha4.png');
}

function cargaDeFiguras() {
  for (let i = numeros.length - 1; i > 0; i--) {
    let j = floor(random(i + 1));
    let c = floor(random(i + 1));
    [numeros[i], numeros[j]] = [numeros[j], numeros[i]];
    [numeros2[i], numeros2[c]] = [numeros2[c], numeros2[i]];

  }
  numGruesa = numeros;
  numFigura = numeros2;
}

function carga() { // genera los valores aleatorios para crear un nuevo cuadro

  if(windowHeight<900){
    escala = 0.7;
    posLineas = 30;
  }
  else{
    escala = 0.8777;
    posLineas = 10;
  }

  for (let index = 0; index < 4; index++) {
    let distancia = floor(random(15, 23));
    posLineas = posLineas + distancia;
    posiciones[index] = posLineas;
  }

  for (let i = 0; i < 4; i++) {
    numFina[i] = floor(random(finosCant));
  }

  cargaDeFiguras();

   colorAleatorio = floor(random(colores.length / 4));
  //colorAleatorio = floor(random(texturasCant));

  aleatorio = floor(random(-1, 1));
  espejo = false;

  z = 0;
  f = 0;
}

function setup() {

  inicioDeReconocimientoDeVoz();

  createCanvas(windowWidth, windowHeight);

  for (let index = 0; index < 4; index++) {
    estela[index] = new Estela();
  }

  carga();
}

function draw() {

  amplitudDelMicrofonoParaElDraw();

  //-------------------eventos de sonido-----------------------

  let wableY = sin(gestorPitch.filtrada) * 100;
  // let wableX = cos(gestorPitch.filtrada) * 100;

  haySonidoAltoYAgudo = gestorAmp.filtrada > thresholdVolAlto && gestorPitch.filtrada > thresholdPitchAlto;

  altoEvento = haySonidoAltoYAgudo && !antesHabiaSonido;

  antesHabiaSonido = haySonidoAltoYAgudo;

  if (altoEvento || mouseIsPressed) {
    carga();
    comienzo = millis();
    buenComienzo = true;

  }
  //--------------------------------------------------------------

   backColor = colorAleatorio * 4;
   background(colores[backColor], colores[backColor + 1], colores[backColor + 2], colores[backColor + 3]);

  //image(imgFondoTextura[colorAleatorio], 0, 0, width, height);
 // image(imgFondoSalpicado, 0, 0, width, height);
  

  //-------strobe y vidrio--------
  let duracionVidrio = 700;
  let terminoVidrio = millis() - comienzo > duracionVidrio;

  let duracionStrobe = 2500;
  let terminoStrobe = millis() - comienzo > duracionStrobe;
  if (!terminoStrobe && buenComienzo) {

    push();
    let strobe = 2 > random(3);
    let strobe2 = 2 > random(5);

    fill(0, 165);
    if (strobe2) {
      strobe2ON = true;
    }
    else { strobe2ON = false }

    if (strobe) {
      rect(0, 0, width, height);
      figurasON = false;

    }
    else { figurasON = true; }
    pop();
  }
  else {
    figurasON = true;
    strobe2ON = false;
  }


  //---------------------

  push();
  espejo = aleatorio < 0;

 // if (espejo) {
  if (espejo) {
   

    translate(width, -f);

    scale(-escala, escala);
    image(imgFondoSalpicado, map(30, 0, 100, 0, width * 1.3) -770 , f, windowWidth * (1+escala), windowHeight* (1+escala));

  }
  else {
    translate(0, -f);
    image(imgFondoSalpicado, 0, f, width, height);
    scale(escala, escala);
  }

  for (let index = 0; index < 4; index++) {
    let wable = 0;
    if (z > windowHeight - 100) {
      f += 0.1;
    }
    if (index % 2 == 0) {
      wable = map(wableY * -1, 0, 100, 15, posiciones[index + tipo]);
    }
    else {
      wable = map(wableY, 0, 100, 15, posiciones[index + tipo]);
    }

    estela[index].dibujar(imgFinos[numFina[index]], imgGruesos[numGruesa[index]], z, map(posiciones[index + tipo], 0, 100, 0, width * 1.3) - 700 + wable, 0);

    if (figurasON) {
      if (gestorAmp.filtrada > (index / 100) * 1.25 + AMP_MIN) {
        image(imgFigurasEfx[numFigura[index]], map(posiciones[index + tipo], 0, 100, 0, width * 1.3) - z / 2 - 570 + wable, z - 202 - 150, 700, 700);
      }
      else {
        image(imgFiguras[numFigura[index]], map(posiciones[index + tipo], 0, 100, 0, width * 1.3) - z / 2 - 570 + wable, z - 202 - 150, 700, 700);

      }
    }

  }


  pop();

  if (!terminoVidrio && buenComienzo) {
    //image(imgVidrio, 0, 0, windowWidth, windowHeight);
  }
  if (strobe2ON && buenComienzo) {
    push;
    fill(255, 100);
    rect(0, 0, windowWidth, windowHeight);
    pop;
    //cargaDeFiguras();
  }

  if (z < 793) { z += 102; }

}


