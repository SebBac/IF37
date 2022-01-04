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
}
