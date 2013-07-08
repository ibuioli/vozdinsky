class Curva {
  int x, y, g, d, r;
  int plus, pluss;
  int conty;        //Contador Interno
  int alf = 255;
  int figuras = 45;

  Curva(int x_, int y_, int g_) {
    x = x_;
    y = y_;
    g = g_;
    d = 10;

    x = (int)map(x, 0, width, 50, 750);
    y = (int)map(y, 0, height, 50, 450);

    byte azar = (byte)random(0, 2);

    if (y < height/2) {
      if (azar == 0) {
        y = y;
      }
      else {
        y = y+300;
      }
    }
    else {
      if (azar == 0) {
        y = y;
      }
      else {
        y = y-300;
      }
    }

    g = (int)map(g, 50, 90, 2, 8);
    r = (int)random(5, 90);
  }

  void mostrar() {
    conty++;

    if (conty < 70) {
      if (amp > 5) {
        d+=2;
      }
    }

    if (g > 5 && d > 80) {
      pushStyle();
      strokeCap(SQUARE);
      strokeWeight(abs(g));
      stroke(r, 99, 75, alf);
      noFill();
      arc(x, y, d-8, d-8, PI, radians(pluss));
      popStyle();

      pluss = constrain(pluss, 0, 350); 
      pluss+=10;
    }

    pushStyle();
    strokeWeight(g);
    stroke(0, alf);
    noFill();
    arc(x, y, d, d, PI, radians(plus));
    popStyle();

    plus = constrain(plus, 0, 350); 
    plus+=10;
    
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

