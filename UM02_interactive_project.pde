import java.util.*;

Table table;
int i = 0;
int n = 21;
Integer[] array;
List<Integer> l;

//'#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080', '#ffffff', '#000000'];
Bar bars[] = new Bar[n];

void setup() {
  
   size(1800, 1000);
   background(256, 256, 256);
   
   array = new Integer[]{#e6194b, #3cb44b, #ffe119, #4363d8, #f58231, #911eb4, #46f0f0, #f032e6, #bcf60c, #fabebe, #008080, #e6beff, #9a6324, #fffac8, #800000, #aaffc3, #808000, #ffd8b1, #000075, #808080, #000000};
 
   table = loadTable("top50_genre_only.csv", "header");
   println(table.getRowCount() + " total rows in table");
   
   for (TableRow row : table.rows()) {
    float genre_number = row.getFloat("genre number");
    float musics_in_genre = row.getFloat("musics in genre");
    String genre = row.getString("genre");
    
    println(genre + " has " + musics_in_genre + " musics in the top 50");
    //int RW = int((1800-100)/n);
    //int RH = int(musics_in_genre*100);
    int RW = int(musics_in_genre*600/7);
    int RH = int((1000-100)/n);
    float RScore = musics_in_genre;
    String RGenre = genre;
    //int RPosX = 105+RW*i;
    //int RPosY = 900 - RH - 5;
    int RPosX = 600;
    int RPosY = 100 + RH*i;
    bars[i]= new Bar(RW,RH,RScore,RPosX,RPosY,RGenre);
    i+= 1;
 
      
  }

}


void draw() {
    
    //bars
    strokeWeight(5);
    for(int i = 0; i < n; i++){
      color c = array[i];
      fill(c);
      bars[i].display();
    }
    //interaction
    for(int i = 0; i < n; i++){
    if ((mouseX > 600) && (mouseX < 1800) && (mouseY > 100 + int((1000-100)/n)*i) && (mouseY < 100 + int((1000-100)/n)*i + int((1000-100)/n))) {

      text(i, 300, 500);
    }
  }
}
  
class Bar {
  int W;
  int H;
  float Score;
  int PosX;
  int PosY;
  String Genre;

  Bar(int tempW, int tempH, float tempScore, int tempPosX, int tempPosY, String tempGenre) {
    W = tempW;
    H = tempH;
    Score = tempScore;
    PosX = tempPosX;
    PosY = tempPosY;
    Genre = tempGenre;
    //position du coin supérieur gauche de la barre
    

  }
  
  void display() {
    rect(PosX, PosY, W, H);
    fill(0,0,0);
    textSize(25);
    text(Genre, 1300, PosY + 30);
  } 
  
}
