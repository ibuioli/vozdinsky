class Irregular {
  int x, y, t, f;
  int r, rt, tc;
  int v1, v2, v3, v4, v5;
  color c, ct;
  int conty;        //Contador Interno
  int alf = 255;
  int figuras = 45;

  Irregular(int x_, int y_, int t_, int f_) {
    x = x_;
    y = y_;
    t = t_;
    f = f_;

    x = (int)map(x, 0, width, 100, 500);
    y = (int)map(y, 0, height, 120, 250);
    t = (int)map(t, 50, 90, 5, 50);

    r = (int)random(t);
    rt = (int)random(1, 4);
    c = (int)random(f);
    ct = (int)map(c, 0, f, 0, 80);

    if (f > 90) {
      v1 = (int)random(200);
      v2 = (int)random(200);
      v3 = (int)random(200);
      v4 = (int)random(200);
      v5 = (int)random(200);
    }
  }

  void mostrar() {    
    conty++;

    if (conty < 70) {
      if (amp > 10) {
        v1 = (int)random(200);
        v2 = (int)random(200);
        v3 = (int)random(200);
        v4 = (int)random(200);
        v5 = (int)random(200);
      }
    }

    pushStyle();
    strokeWeight(abs(sin(r))*2);
    stroke(c, 70, r-50, alf-r); 
    fill(c, 85, 60, alf);

    if (f < 85) {
      rect(x, y, tc, tc);
    }
    else if (f > 85 && f < 90) {
      pushMatrix();
      translate(x, y);
      beginShape();
      vertex(v1, v2);
      vertex(v2, v1);
      vertex(v3, v2);
      vertex(v4, v3);
      endShape();
      popMatrix();
    }
    else if (f > 90) {
      pushMatrix();
      if (t > 30) {
        scale(2);
      }
      translate(x, y);
      beginShape();
      vertex(v2, v2-t);
      vertex(v2+t, v3-50+t);
      vertex(v4/3, v2);
      vertex(v4, v3+35);
      vertex(v5, v4+t+20);
      endShape(CLOSE);
      popMatrix();
    }

    popStyle();

    if (tc < t) {
      tc+=2;
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

