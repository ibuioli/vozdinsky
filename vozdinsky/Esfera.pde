class Esfera {
  PImage grado;
  byte degrado;
  int x, y, d;
  int dc, r;
  int alf = 255;
  int conty;      //Contador Interno
  int baraja;
  int figuras = 45;
  color c, cor, pcor, gcor;
  boolean central;

  Esfera(int x_, int y_, int d_, color c_) {
    x = x_;
    y = y_;
    d = d_;
    c = c_;

    x = (int)map(x, 0, width, 100, 700);
    y = (int)map(y, 0, height, 100, 500);
    d = (int)map(d, 50, 90, 10, 200);

    r = (int)random(d);
    cor = c_;

    baraja = (byte)random(10);

    if (d > 120) {
      int centro = int(random(0, 10));
      if (centro > 5) {
        central = true;
        pcor = int(random(0, d+40));
      }
      else {
        central = false;
      }
    }

    gcor = (color)random(20, 280);
    degrado = (byte)random(0, 6);

    if (degrado >= 5) {
      grado = loadImage("grado.png");
    }
    else {
      grado = null;
    }
  }

  void mostrar() {
    conty++;

    if (conty < 70) {
      if (amp > 3) {
        if (baraja > 3) {
          cor = (cor + 1) % 50;
        }
        if (baraja < 3) {
          cor = 200+(cor + 1) % 20;
        }
      }
    }

    if (degrado >= 5) {
      pushStyle();
      imageMode(CENTER);
      tint(gcor, 90, 88, 220);
      image(grado, x, y, dc*1.8, dc*1.8);
      popStyle();
    }

    pushStyle();
    strokeWeight(abs(sin(r))*2);
    stroke(c, 70, r-20, alf-r); 
    fill(cor, 99, 75, alf);
    ellipse(x, y, dc, dc);
    popStyle();

    if (central) {
      pushStyle();
      strokeWeight(2);
      stroke(c, 50, r-100, alf-55-r);
      fill(c, 110-r, 75, alf);
      ellipse(x, y, dc/2, dc/2);
      popStyle();
    }

    if (dc < d) {
      dc+=5;
    }

    if (cont <= 11) {
      figuras--;
    }
    if (figuras <= 0) {
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

