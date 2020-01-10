Table table;
int i = 0;
int n = 6;

Bar bars[] = new Bar[n];

void setup() {
  
   size(1000, 1000);
   background(256, 256, 256);
  
   table = loadTable("GOT.csv", "header");
   println(table.getRowCount() + " total rows in table");
   
   for (TableRow row : table.rows()) {

    float score = row.getFloat("score");
    String name = row.getString("short_name");
    
    if (score > 1.3) {
      println(name + " has a score of " + score);
      int RW = int((700-50*n)/6);
      int RH = int(score*400);
      float RScore = score;
      String RPerso = name;
      int RPosX = int(100+RW*i+(50*(i+1)));
      int RPosY = 900 - RH;
      bars[i]= new Bar(RW,RH,RScore,RPosX,RPosY,RPerso);
      i+= 1;
  }

}
}

void draw() {
  
    line(100,100,100,900);
    line(100,100,80,120);
    line(100,100,120,120);
    textSize(50);
    text("score",50,75);
    //axe y
    line(100,900,900,900);
    line(900,900,880,920);
    line(900,900,880,880);
    textSize(50);
    text("character",750,975);
    //axe x
    for(int i = 0; i < n; i++){
      bars[i].display();
    }
    
  }
  
class Bar {
  int W;
  int H;
  float Score;
  int PosX;
  int PosY;
  String Perso;

  Bar(int tempW, int tempH, float tempScore, int tempPosX, int tempPosY, String tempPerso) {
    W = tempW;
    H = tempH;
    Score = tempScore;
    PosX = tempPosX;
    PosY = tempPosY;
    Perso = tempPerso;
    //position du coin supérieur gauche de la barre
    

  }
  
  void display() {
    rect(PosX, PosY, W, H);
    noStroke();
    fill(150, 50, 50);
    textSize(10);
    text(Perso,PosX,900 - H - 10);
  } 
  
}
