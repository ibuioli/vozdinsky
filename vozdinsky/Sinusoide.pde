class Sinusoide {
  PGraphics sn; 
  int x, y, g, cr;
  float ton, mul, mel, mil, a, t, s;
  int conty, alf, cur;
  int alfy = 255;
  int figuras = 45;

  Sinusoide(int x_, int y_, int g_, int cr_) {
    sn = createGraphics(width+100, height); 
    x = x_;
    y = y_;
    g = g_;
    cr = cr_;
    
    x = (int)map(x, 0, width, 200, 600);
    y = (int)map(y, 0, height, 100, 500);
    s = (int)map(g, 70, 90, 1, 3);
    
    mul = map(cr, 52, 60, 5, 20);
    mel = map(cr, 52, 60, -3, 3);
    mil = map(cr, 52, 60, 0.1, 0.25);
    
    cur = (int)random(25, 45);
  }

  void mostrar() {
    conty++;

    sn.beginDraw();
    sn.pushStyle();
    sn.fill(5, alf);
    sn.noStroke();
    sn.ellipse(x, y+sin(a)*mul, 3+t, 3+t);
    sn.popStyle();
    sn.endDraw();
    
    pushStyle();
    pushMatrix();
    translate(width/2, height/2);
    rotate(cur);
    scale(s);
    tint(255, alfy);
    image(sn, -(width+100)/2, -height/2);
    popMatrix();
    popStyle();

    if (conty < 70) {
      if (amp > 10) {
        x+=mel;
        a+=0.5;
        t+=mil;
        alf+=12;
        mul+=0.3;
      }
    }
    
    if (cont <= 11) {
      figuras--;
    }
    if(figuras <= 0){
      alfy-=10;
    }
  }
  
  boolean finished() {
    if (alfy <= 0) {
      return true;
    }
    else {
      return false;
    }
  }
}

