class Linea {
  GestorSenial altura;
  byte doble;
  int x, y, t, v;
  int xplus, yplus;
  int conty;        //Contador Interno
  int alf = 255;
  int figuras = 45;

  Linea(int x_, int y_, int t_, int v_) {
    altura = new GestorSenial(60, 75);

    x = x_;
    y = y_;
    t = t_;
    v = v_;

    x = (int)map(x, 0, width, 200, 600);
    y = (int)map(y, 0, height, 200, 600);
    t = (int)map(t, 50, 90, 1, 8);
    
    doble = (byte)random(5);

    if (x > 400) {
      xplus = x+100;
    }
    else {
      xplus = x-100;
    }

    yplus = y;
  }

  void mostrar() {
    conty++;

    if (conty < 70) {
      altura.actualizar(frec_);
    }
    
    pushStyle();
    strokeCap(SQUARE);
    strokeWeight(abs(t));
    stroke(5, alf);
    line(x, y, xplus, yplus);
    if(t < 3 && doble > 3){
      line(x+10, y, xplus+10, yplus);
    }
    popStyle();

    xplus = constrain(xplus, 0+50, width-50);
    yplus = constrain(yplus, 0+50, height-50);

    if (conty < 70) {
      if (amp > 20) {
        if (x > 400) {
          xplus+=4;
        }
        else {
          xplus-=4;
        }
      }
    }

    if (conty < 70) {
      if (amp > 5) {
        if (altura.derivadaNorm() > 0.2) {
          yplus-=6;
        }
        else if (altura.derivadaNorm() < -0.2) {
          yplus+=8;
        }
        else if(altura.derivadaNorm() < 0.2 && (altura.derivadaNorm() > -0.2)) {
          yplus+=0;
        }
      }
    }

    if (cont <= 11) {
      figuras--;
    }
    if(figuras <= 0){
      alf-=10;
    }
  }

  boolean finished() {
    if (alf <= 0) {
      return true;
    }
    else {
      return false;
    }
  }
}

