Table table;
int i = 0;
int n = 21;

Bar bars[] = new Bar[n];

void setup() {
  
   size(2000, 1000);
   background(256, 256, 256);
  
   table = loadTable("top50_genre_only.csv", "header");
   println(table.getRowCount() + " total rows in table");
   
   for (TableRow row : table.rows()) {
    float genre_number = row.getFloat("genre number");
    float musics_in_genre = row.getFloat("musics in genre");
    String genre = row.getString("genre");
    
    println(genre + " has " + musics_in_genre + " musics in the top 50");
    int RW = int((1800-100)/n);
    int RH = int(musics_in_genre*100);
    float RScore = musics_in_genre;
    String RGenre = genre;
    int RPosX = 105+RW*i;
    int RPosY = 900 - RH - 5;
    bars[i]= new Bar(RW,RH,RScore,RPosX,RPosY,RGenre);
    i+= 1;
 
      
  }

}


void draw() {
  
    //axe y  
    strokeWeight(10);
    line(100,100,100,900);
    line(100,100,80,120);
    line(100,100,120,120);
    textSize(50);
    text("Number of musics \nby genre",150,75);
    //axe x
    strokeWeight(10);
    line(100,900,1900,900);
    line(1900,900,1880,920);
    line(1900,900,1880,880);
    textSize(50);
    text("Genres",750,975);
    //bars
    strokeWeight(5);
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

  Bar(int tempW, int tempH, float tempScore, int tempPosX, int tempPosY, String tempGenre) {
    W = tempW;
    H = tempH;
    Score = tempScore;
    PosX = tempPosX;
    PosY = tempPosY;
    Perso = tempGenre;
    //position du coin supérieur gauche de la barre
    

  }
  
  void display() {
    rect(PosX, PosY, W, H);
    fill(150, 50, 50);
    textSize(10);
    text(Perso,PosX+5,900 - H - 10);
  } 
  
}
