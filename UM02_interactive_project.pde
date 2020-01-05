import java.util.*;

Table genre_only;
Table musics;
int i = 0;
int n = 21;
Integer[] array;
List<Integer> l;
PFont myFont50;
PFont myFont25;
PFont myFont15;
int number;
String title;
String artist;

//'#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080', '#ffffff', '#000000'];
Bar bars[] = new Bar[n];

void setup() {
  
   //background
   size(1200, 1000);
   background(256, 256, 256);
   //title

   array = new Integer[]{#e6194b, #3cb44b, #ffe119, #4363d8, #f58231, #911eb4, #46f0f0, #f032e6, #bcf60c, #fabebe, #008080, #e6beff, #9a6324, #fffac8, #800000, #aaffc3, #808000, #ffd8b1, #000075, #808080, #000000};
 
   musics = loadTable("top50_by_genre.csv", "header");
   genre_only = loadTable("top50_genre_only.csv", "header");
   println(genre_only.getRowCount() + " total rows in table");
   
   for (TableRow row : genre_only.rows()) {
     
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
    int RPosX = 200;
    int RPosY = 100 + RH*i;
    bars[i]= new Bar(RW,RH,RScore,RPosX,RPosY,RGenre);
    i+= 1;
 
      
  }

}


void draw() {
  
    //title
    myFont50 = createFont("Georgia", 50);
    textFont(myFont50);
    textAlign(CENTER, CENTER);
    textSize(50); 
    fill(0,0,0);
    text("Genres in the TOP50 Spotify", 600, 50);
    
    myFont25 = createFont("Georgia", 15);
    myFont15 = createFont("Georgia", 15); 
    
    //bars
    strokeWeight(5);
    for(int i = 0; i < n; i++){
      color c = array[i];
      fill(c);
      bars[i].display();
    }
    
    //interaction
    for(int i = 0; i < n; i++){
      
      TableRow row1 = genre_only.getRow(i);
      number = row1.getInt("musics in genre");
      
      if ((mouseX > 0) && (mouseX < 200+int(number*600/7)) && (mouseY > 100 + int((1000-100)/n)*i) && (mouseY < 100 + int((1000-100)/n)*i + int((1000-100)/n))) {
        
        stroke(255);
        fill(255,255,255);
        rect(600, 400, 550, 550);
        
        color c = array[i];
        stroke(c);
        fill(255,255,255);
        rect(600, 400, 550, number*2*30);//size with the number of musics
        
        
        
        for(int j = 0; j < number; j++){
          
          TableRow row2 = musics.getRow(i+j);
          title = row2.getString("name");
          artist = row2.getString("artist");
          fill(0,0,0);
          textAlign(LEFT,TOP);
          textFont(myFont25);
          textSize(25);
          text(title,605,400+(j*60));
          textFont(myFont15);
          textSize(15);
          text("by "+artist,605,430+(j*60));
                    
        }
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
    stroke(250,250,250);
    rect(PosX, PosY, W, H);
    fill(0,0,0);
    textSize(25);
    textAlign(RIGHT,CENTER);
    text(Genre, 195, PosY + int((1000-100)/(2*n)));
  } 
  
}
