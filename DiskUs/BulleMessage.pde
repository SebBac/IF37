class BulleMessage {
 
  private int rectX;
  private int rectY; 
  private int rectWidth = 0;
  private int rectHeight = 0;
  
  private int triangleX1;
  private int triangleY1;
  private int triangleX2;
  private int triangleY2;
  private int triangleX3;
  private int triangleY3;
  
  private int maxWidth;
  private int hauteurBulle;
  
  private String message;
  private String adaptedMessage;
  
  private color colorBase = #000000;
  
  public BulleMessage (String message, color cBase) {
    
    this.message = message;
    this.adaptedMessage = "";
    this.maxWidth = 230;
    
    this.colorBase = cBase;
    
    int nbLignes = wordWrap();
    this.hauteurBulle = 25 + nbLignes * 24;
}
  
  public void drawIt() {
    
    this.rectX = 85;
    this.rectY = pixelMaxMessages - this.hauteurBulle + deplacementConvScroll;
    this.rectWidth = 250;
    this.rectHeight = hauteurBulle;
        
    this.triangleX1 = (int) ((this.rectX + this.rectWidth)/1.2);
    this.triangleY1 = this.rectY + this.rectHeight;
    this.triangleX2 = this.triangleX1 + 14;
    this.triangleY2 = this.rectY + this.rectHeight;
    this.triangleX3 = this.triangleX1 + 7;
    this.triangleY3 = this.rectY + this.rectHeight + 14;    
    
    noStroke();
    
    fill(this.colorBase);
    rect(rectX, rectY, rectWidth, rectHeight);   
    
    triangle(this.triangleX1, this.triangleY1, this.triangleX2, this.triangleY2, this.triangleX3, this.triangleY3);
    
    textSize(16);
    fill(#000000);
    text(this.adaptedMessage, this.rectX + 10 , this.rectY + 30);
    
    stroke(#000000);
    pixelMaxMessages -= this.hauteurBulle + 30;
  }
  
  //Fonction adaptant la taille du message pour l'afficher a l'ecran dans la bulle de texte
  /*private int adaptMessage(String message){
    int i;
    int positionEspace;
    String temp;
    ArrayList<String> listeLignesMessage = new ArrayList<String>();
    
    // Tant que le message ne tient pas sur une ligne
    while (textWidth(message) > max) {
     i = 1;
     temp = message.substring(0, i);
     
     // Tant que le message "temp" n'est pas plus large que max, on ajoute une lettre au message "temp"
      while (textWidth(temp) < max) {
       if (message.charAt(i) == ' ') positionEspace = i;
       i++;
       temp = message.substring(0, i);        
      }
      
      listeLignesMessage.add(temp);
      message = message.substring(i, message.length());
    }
    
    //On ajoute la dernière ligne
    listeLignesMessage.add(message);
  
    // Reconstitution du message avec les sauts de ligne
    message = "";
    
    for (i = 0; i < listeLignesMessage.size(); i++) {
      message += listeLignesMessage.get(i) + "\n";
    }
    
    System.out.println(message);
    
    int nbSauts = 0;
    for (i = 0; i < message.length(); i++) {
      if (message.charAt(i) == '\n') {
        nbSauts ++;        
      }
      
    }
    
    return nbSauts;
  }*/
  
  int wordWrap() {
    
    // Make an empty ArrayList
    StringList a = new StringList();
    float w = 0;    // Accumulate width of chars
    int i = 0;      // Count through chars
    int rememberSpace = 0; // Remember where the last space was
    int lastRememberedSpace = 0;
    // As long as we are not at the end of the String
    while (i < this.message.length()) {
      // Current char
      char c = this.message.charAt(i);
      w += textWidth(c); // accumulate width
      System.out.println("char : " +c + ", totalWidth : " +w);
      if (c == ' ') rememberSpace = i; // Are we a blank space?
      if (w > this.maxWidth) {  // Have we reached the end of a line?
      
        String sub = this.message.substring(0,rememberSpace); // Make a substring
        // Chop off space at beginning
        if (sub.length() > 0 && sub.charAt(0) == ' ') sub = sub.substring(1,sub.length());
        // Add substring to the list
        a.append(sub);
        // Reset everything
        this.message = this.message.substring(rememberSpace,this.message.length());
        i = 0;
        w = 0;
      } 
      else {
        i++;  // Keep going!
      }
    }
  
    // Take care of the last remaining line
    if (this.message.length() > 0 && this.message.charAt(0) == ' ') this.message = this.message.substring(1,this.message.length());
    a.append(this.message);
    
    for (int ind = 0; ind < a.size(); ind++) {
     this.adaptedMessage += a.get(ind);
     this.adaptedMessage += "\n";
     System.out.println(this.adaptedMessage);
    }
    
    System.out.println("hgdghdgehd");
    System.out.println(this.adaptedMessage);
    System.out.println(a.size());
    
    return a.size();
  }
}
