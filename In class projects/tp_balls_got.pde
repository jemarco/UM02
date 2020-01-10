Table table;

void setup() {
  
   table = loadTable("GOT.csv", "header");
   println(table.getRowCount() + " total rows in table");
   
   for (TableRow row : table.rows()) {

    float score = row.getFloat("score");
    String name = row.getString("short_name");
    
    if (score > 1.3) {
      println(name + " has a score of " + score);
  }

}
}
