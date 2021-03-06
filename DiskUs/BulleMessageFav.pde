class BulleMessageFav extends BulleMessage {
  
  private int minY = 76;
  private int maxY = 540;
  private boolean overRect = false;
  protected color colorHover = #FFFFFF;
  
  // Constructeur
  public BulleMessageFav (String message, color cBase, color cHover) { 
    super(message, cBase);
    this.colorHover = cHover;
  }
  
  
  // Méthode permettant de dessiner la bulle de message
  public void drawIt() {
    
    // Update du message (sert à savoir si la souris était sur un message au moment du clic par exemple)
    this.overRect();
    
    // Mesures du rectangle du message
    this.rectX = 50;
    this.rectY = pixelMaxFav - this.hauteurBulle + deplacementFavScroll;
    this.rectWidth = 260;
    this.rectHeight = hauteurBulle;
    
    // Dessin du rectangle
    noStroke();
    if(this.getOverRect()){
      fill(this.colorHover);
    } else {
      fill(this.colorBase);
    }
    rect(rectX, rectY, rectWidth, rectHeight);   
 
    // Ajout du texte au rectangle
    textSize(16);
    fill(#000000);
    text(this.adaptedMessage, this.rectX + 10 , this.rectY + 30);

    // Pour le prochain
    stroke(#000000);
    pixelMaxFav -= this.hauteurBulle + 15;
  }
  
   // Méthode qui renvoie si le curseur est sur la bulle de message ou non
   public void overRect()  {
    if (minY <= mouseY && mouseY <= maxY &&
        rectX <= mouseX && mouseX <= rectX+rectWidth && 
        rectY <= mouseY && mouseY <= rectY+rectHeight) {
      setOverRect(true);
    } else {
      setOverRect(false);
    }
  }
  
  // Setter de OverRect
  private void setOverRect(boolean bool){
    this.overRect = bool;
  }
  
  // Getter de OverRect
  public boolean getOverRect(){
    return this.overRect;
  }
  
}
