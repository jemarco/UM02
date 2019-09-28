int n = 5;
int x1, x2, y1, y2;

Ball balls[] = new Ball[n];

void setup() {
  size(200, 200);
  background(0, 0, 0);
  for(int i = 0; i < n; i++){
    int RposX = (int)random(15,185);
    int RposY = (int)random(15,185);
    float Rdirh = (float)random(-1,1);
    float Rdirv = (float)random(-1,1);
    balls[i]= new Ball(RposX,RposY,30,Rdirh,Rdirv);
  }
}

void draw() {
  background(200, 200, 200);
  for(int i = 0; i < n; i++){
    balls[i].moveBall();
    balls[i].display();
    for(int j = 0; j < n; j++){
      x1 = balls[i].getposX();
      y1 = balls[i].getposY();
      x2 = balls[j].getposX();
      y2 = balls[j].getposY();
      if ( (x2-x1)*(x2-x1)+(y2-y1)*(y2-y1) < 2500 && i<j){
        line( x1, y1, x2, y2 );
    }
  }
}
}

class Ball {
  int posX;
  int posY;
  int d = 30;
  float dirh;
  float dirv;

  Ball(int tempPosX, int tempPosY, int tempD, float tempdirh, float tempdirv) {
    posX = tempPosX;
    posY = tempPosY;
    dirh = tempdirh;
    dirv = tempdirv;
    d = tempD;
  }
  
  void moveBall() {
    if (posX >= height - d/2 || posX <= d/2) {
      dirh = -dirh;
    }
    if (posY >= width - d/2 || posY <= d/2) {
      dirv = -dirv;
    }

    if (dirh > 0) {
      posX += 1;
    } else {
      posX -= 1;
    }
    if (dirv > 0) {
      posY += 1;
    } else {
      posY -= 1;
    }
  }
  
  public int getposX(){
      return posX;
   }
   
  public int getposY(){
      return posY;
   }
  
  void display() {
    circle(posX, posY, d);
  } 
}
