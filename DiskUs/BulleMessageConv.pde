class BulleMessageConv extends BulleMessage {

  // Attributs permettant de dessiner le petit triangle en dessous de la bulle de texte
  private int triangleX1;
  private int triangleY1;
  private int triangleX2;
  private int triangleY2;
  private int triangleX3;
  private int triangleY3;

  // Constructeur de la classe
  public BulleMessageConv (String message, color cBase) {
    super(message, cBase);
  }
  
  // Méthode permettant de dessiner la bulle de message
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
  
  
}
