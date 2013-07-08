public void oscEvent(OscMessage theOscMessage) {
  //Pregunta si la etiqueta es "datos"
  if (theOscMessage.checkAddrPattern("/datos")) {

    if (theOscMessage.checkTypetag("f")) { //Pregunta si es un valor flotante
      if (amp_ > 5) {
        frec_ = theOscMessage.get(0).floatValue();
      }
    }
  }
  else if (theOscMessage.checkAddrPattern("/vel")) {

    if (theOscMessage.checkTypetag("f")) {
      amp_ = theOscMessage.get(0).floatValue();
    }
  }
}

public void keyPressed(){
  if(key == 'r' || key == 'R'){
    setup();
  }
}

