void swap(int[] a, int x, int y) {
  int tmp = a[x];
  a[x] = a[y];
  a[y] = tmp;
  return;
}

void random_shuffle(int[] array, int size) {
  int a, b;
  for (int i = size; i > 1; i--) {
    a = i - 1;
    b = (int)random(0,size - 1) % i;
    swap(array, a, b);
  }
  return;
}

class Torus {
  float[][] points = new float[PMAX][3];
  int[] index = new int[PMAX];
  float[] rand = new float[PMAX];
  int max;
  int num;
  
  int row, column;
  float irad, orad;
  
  boolean isShuffle  = true;
  
  Torus(int r, int c, float ir, float or, int type, int param) {
    row = r;
    column = c;
    irad = ir;
    orad = or;
    max = row * column;
    
    switch(type) {
      case HF:
        initHF(param);
        break;
      default:
        init(param);
    }
  }
  
  void init(int param) {
    int count = 0;
    // set points
    for (int i = 0; i < row; i++) {
      float r = PI * 2 / row * i;
      float rr = (float)Math.cos(r);
      float ry = (float)Math.sin(r);
      for (int j = 0; j < column; j++) {
        float tr = PI * 2 / column * j;
        float tx = (rr * irad + orad) * (float)Math.cos(tr);
        float ty = ry * irad;
        float tz = (rr * irad + orad) * (float)Math.sin(tr);
        
        points[count][0] = tx;
        points[count][1] = ty;
        points[count][2] = tz;
        count++;
      }
    }
    // set index
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        if ((i+j) % param == 0) {
          index[num++] = i * row + j;
        }
      }
    }
    // set random
    for (int i = 0; i < num; i++) {
      rand[i] = random(1);
    }
  }
  
  void initHF(int param) {
    int count = 0;
    // set points
    for (int i = 0; i <= row/2; i++) {
      float r = PI * 2 / row * i - HALF_PI;
      float rr = (float)Math.cos(r);
      float ry = (float)Math.sin(r);
      for (int j = 0; j < column; j++) {
        float tr = PI * 2 / column * j;
        float tx = (rr * irad + orad) * (float)Math.cos(tr);
        float ty = ry * irad;
        float tz = (rr * irad + orad) * (float)Math.sin(tr);
        
        points[count][0] = tx;
        points[count][1] = ty;
        points[count][2] = tz;
        count++;
      }
    }
    // set index
    for (int i = 0; i <= row/2; i++) {
      for (int j = 0; j < column; j++) {
        if ((i+j) % param == 0) {
          index[num++] = i * row + j;
        }
      }
    }
    // set random
    for (int i = 0; i < num; i++) {
      rand[i] = random(1);
    }
  }
  
  void drawBone(int brow) {
    for (int i = 0; i < brow; i++) {
      float r = PI * 2 / brow * i;
      float rx = (float)Math.cos(r);
      float ry = (float)Math.sin(r);
  
      if (i % 3 == 0) {
        strokeWeight(1.5);
      } else {
        strokeWeight(0.5);
      }
      
      float radius = rx * irad + orad;
      pushMatrix();
      translate(0, ry * irad, 0);
      rotateX(PI/2);
      ellipse(0, 0, radius * 2 , radius * 2);
      popMatrix();
    }
  }
  
  void drawSphere(float size, float offset) {
    noStroke();
    for (int i = 0; i < num; i++) {
      pushMatrix();
      translate(points[ index[i] ][0],
                points[ index[i] ][1],
                points[ index[i] ][2]);
      sphere(size * rand[i] + offset);
      popMatrix();
    }
  }

  void drawLines() {
    if (isShuffle) {
      random_shuffle(index, 128);
      isShuffle = false;
    }
    strokeWeight(1);
    stroke(150, 80);
    for (int i = 2; i < num; i+=2) {
      int a = index[i-2];
      int b = index[i-1];
      int c = index[ i ];
      line(points[a][0], points[a][1], points[a][2],
           points[b][0], points[b][1], points[b][2]);
  
      line(points[c][0], points[c][1], points[c][2],
           points[b][0], points[b][1], points[b][2]);
    }
  }
}
