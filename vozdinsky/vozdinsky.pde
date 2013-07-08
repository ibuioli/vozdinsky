/***************************/
/*        Vozdinsky        */
/*                         */
/*-Autor: Ignacio Buioli   */
/*-Año: 2013               */
/*-Processing: 2.0+        */
/*-PureData 0.43.4+        */
/***************************/

//----Importando Librerías----//
import oscP5.*;
import netP5.*;
//----------------------------//

//----------Objetos-----------//
OscP5 oscP5;
ArrayList esferas, lineas, curvas, irregulares, sinusoides;
PVector curva_grilla;
//----------------------------//

//-----Variables Globales-----//
PImage tex;            //Reserva espacio para la Textura
PImage fondo;          //Reserva espacio para el fondo

float frec_, amp_;     //Frecuencia y Amplitud puras
int frec, amp;         //Frecuencia y Amplitud alteradas

boolean contador;      //Control Contador
byte cont = 70;        //Contador

byte sinus;            //Contador de Sinusoides
//----------------------------//

void setup() {
  size(800, 600, P3D);            //El Modo P3D ayuda al rendimiento y permite mezclas de colores
  colorMode(HSB, 360, 100, 100);  //Modo de Color HSB, 360, 100, 100
  background(360, 100, 100);

  oscP5 = new OscP5(this, 12000); //Puerto 12000
  tex = loadImage("tex.jpg");     //Asigna la Textura

  byte h = (byte)random(45, 60);

  for (int x=0; x < width+50; x++) {   //Genera Fondo
    for (int y=0; y < height; y++) {
      pushStyle();
      strokeWeight(5);
      stroke((int)random(h-15, h), 40, (int)random(85, 95), (int)random(100, 250));
      point(x, y);
      popStyle();
    }
  }

  filter(BLUR, 0.6);  //Ligero desenfoque, empareja los puntos
  fondo = get();      //Hace una impresión del fondo generado

  smooth(3);          //Antialiasing x3

    //////////////////////////////////////////////////////////////////

  curva_grilla = new PVector((int)random(80, width), (int)random(20, height-50));

  //////////////////////////////////////////////////////////////////

  esferas = new ArrayList();
  lineas = new ArrayList();
  curvas = new ArrayList();
  irregulares = new ArrayList();
  sinusoides = new ArrayList();

  ////////////////////////////HACK//////////////////////////////////
  esferas.add(new Esfera(-8000, -8000, 0, 45));
  lineas.add(new Linea(-8000, -8000, 0, 72));
  curvas.add(new Curva(-8000, -8000, 60));
  irregulares.add(new Irregular(-8000, -8000, 0, 90));
  sinusoides.add(new Sinusoide(-8000, -8000, 1, 60));
}

void draw() {
  ////////////////////////////////////////CONFIG/////////////////////////////////////////////////
  amp = (int)amp_;
  frec = (int)frec_;
  //////////////////////////////////////FIN CONFIG///////////////////////////////////////////////

  ////////////////////////////////////////FONDO//////////////////////////////////////////////////
  image(fondo, 0, 0);
  //////////////////////////////////////FIN FONDO////////////////////////////////////////////////

  ///////////////////////////////////////FIGURAS/////////////////////////////////////////////////

  if (amp > 50) {
    if (frec > 40 && frec < 52) {  //Frecuencias Bajas
      if (contador == false) {
        esferas.add(new Esfera((int)random(width), (int)random(height), (int)amp, (int)frec));
      }
      contador = true;
    }
    if (frec > 52 && frec < 60) {  //Frecuencias Medias
      if (contador == false) {
        float azar = random(0, 3);
        if (azar < 1) {
          if (sinus < 3) {
            sinusoides.add(new Sinusoide((int)random(width), (int)random(height), (int)amp, (int)frec));
            sinus++;
          }
          else {
            curvas.add(new Curva((int)random(curva_grilla.x), (int)curva_grilla.y, (int)amp));
          }
        }
        else if (azar > 1) {
          curvas.add(new Curva((int)random(curva_grilla.x), (int)curva_grilla.y, (int)amp));
        }
      }
      contador = true;
    }
    if (frec > 60 && frec < 75) {  //Frecuencias Altas
      if (contador == false) {
        lineas.add(new Linea((int)random(width), (int)random(height), (int)amp, (int)frec));
      }
      contador = true;
    } 
    if (frec > 80) {  //Silbidos
      if (contador == false) {
        irregulares.add(new Irregular((int)random(width), (int)random(height), (int)amp, (int)frec));
      }
      contador = true;
    }
  }
  /////////////////////////////////////FIN FIGURAS///////////////////////////////////////////////
  ///////////////////////////////////////CONFIG//////////////////////////////////////////////////

  if (amp < 10) {
    amp = 0;
  }

  for (int i = esferas.size()-1; i >= 1; i--) { 
    Esfera esfera = (Esfera) esferas.get(i);
    esfera.mostrar();
    if(esfera.finished()){
      esferas.remove(i);
    }
  }
  for (int i = curvas.size()-1; i >= 1; i--) { 
    Curva curva = (Curva) curvas.get(i);
    curva.mostrar();
    if(curva.finished()){
      curvas.remove(i);
    }
  }
  for (int i = lineas.size()-1; i >= 1; i--) { 
    Linea linea = (Linea) lineas.get(i);
    linea.mostrar();
    if(linea.finished()){
      lineas.remove(i);
    }
  }
  for (int i = irregulares.size()-1; i >= 1; i--) { 
    Irregular irregular = (Irregular) irregulares.get(i);
    irregular.mostrar();
    if(irregular.finished()){
      irregulares.remove(i);
    }
  }
  for (int i = sinusoides.size()-1; i >= 1; i--) { 
    Sinusoide sinusoide = (Sinusoide) sinusoides.get(i);
    sinusoide.mostrar();
    if(sinusoide.finished()){
      sinusoides.remove(i);
      sinus = 0;
    }
  }

  if (contador == true) {  //Tiempo de interacción individual de las figuras
    cont--;
    if (cont == 10) {
      cont = 70;
      contador = false;
      amp = 0;
    }
  }

  /////////////////////////////////////FIN CONFIG////////////////////////////////////////////////

  //Aplica Textura
  blend(tex, 0, 0, width, height, 0, 0, width, height, HARD_LIGHT);
}

