
let monitorear = false;

let FREC_MIN = 85;
let FREC_MAX = 2000;

let AMP_MIN = 0.01;
let AMP_MAX = 0.4;

let err = 0;
let mic;
let pitch;
let audioCotext;

let gestorAmp;
let gestorPitch;

const model_url = 'https://cdn.jsdelivr.net/gh/ml5js/ml5-data-and-models/models/pitch-detection/crepe/';

function inicioDeReconocimientoDeVoz(){

  audioContext = getAudioContext(); // inicia el motor de audio
  mic = new p5.AudioIn(); // inicia el micrófono
  mic.start(startPitch); // se enciende el micrófono y le transmito el analisis de frecuencia (pitch) al micrófono. Conecto la libreria con el micrófono


  userStartAudio();// por la dudas para forzar inicio de audio en algunos navegadores

  gestorAmp =  new GestorSenial( AMP_MIN, AMP_MAX);
  gestorPitch = new GestorSenial( FREC_MIN, FREC_MAX);

}

// ---- Pitch detection ---
function startPitch() {
    pitch = ml5.pitchDetection(model_url, audioContext , mic.stream, modelLoaded);
  }
  
  function getPitch() {
    pitch.getPitch(function(err, frequency) {
      if (frequency) {
  
        gestorPitch.actualizar(frequency);    
        //console.log(frequency);
      } 
      getPitch();
    })
  }
  
  function modelLoaded() {
    getPitch();
  }

  function amplitudDelMicrofonoParaElDraw(){
    let vol = mic.getLevel(); // cargo en vol la amplitud del micrófono (señal cruda);
    gestorAmp.actualizar(vol);
  }
