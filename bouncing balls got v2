Table table;
int x1, x2, y1, y2;
int k = 0;
int n = 6;
int scorebis;
ArrayList<String> Noms = new ArrayList<String>();

Ball balls[] = new Ball[n];

void setup() {
  
  size(400, 400);
  background(0, 0, 0);
  
  table = loadTable("GOT.csv", "header");
  println(table.getRowCount() + " total rows in table");
  
  for (TableRow row : table.rows()) {

    float score = row.getFloat("score");
    String name = row.getString("short_name");
    
    if (score > 1.3) {
      
      println(name + " has a score of " + score);
      
      int RposX = (int)random(50,350);
      int RposY = (int)random(50,350);
      float Rdirh = (float)random(-1,1);
      float Rdirv = (float)random(-1,1);
      String RNom = name;
      score = (score-1)*100;
      scorebis = (int)score;
      balls[k]= new Ball(RposX,RposY,scorebis,Rdirh,Rdirv,RNom);
      k++;
  }

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
      if ( (x2-x1)*(x2-x1)+(y2-y1)*(y2-y1) < 5000 && i<j){
        line( x1, y1, x2, y2 );
    }
  }
}
}

class Ball {
  int posX;
  int posY;
  int d;
  float dirh;
  float dirv;
  String Nom;

  Ball(int tempPosX, int tempPosY, int tempD, float tempdirh, float tempdirv, String tempNom) {
    posX = tempPosX;
    posY = tempPosY;
    dirh = tempdirh;
    dirv = tempdirv;
    d = tempD;
    Nom = tempNom;
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
    fill(150, 50, 50);
    text(Nom,posX+d/2+5,posY);
  } 
}
