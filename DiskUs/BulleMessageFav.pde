class BulleMessageFav extends BulleMessage {
  
  private boolean overRect = false;
  
  public BulleMessageFav (String message, color cBase) { 
    super(message, cBase);
  }
  
  // Méthode permettant de dessiner la bulle de message
  public void drawIt() {
    
    this.overRect();
    
    this.rectX = 50;
    this.rectY = pixelMaxFav - this.hauteurBulle + deplacementFavScroll;
    this.rectWidth = 260;
    this.rectHeight = hauteurBulle;
      
    noStroke();
    
    fill(this.colorBase);
    rect(rectX, rectY, rectWidth, rectHeight);   
 
    textSize(16);
    fill(#000000);
    text(this.adaptedMessage, this.rectX + 10 , this.rectY + 30);
    
    stroke(#000000);
    pixelMaxFav -= this.hauteurBulle + 15;
  }
  
   public void overRect()  {
    if (rectX <= mouseX && mouseX <= rectX+rectWidth && 
        rectY <= mouseY && mouseY <= rectY+rectHeight) {
      setOverRect(true);
    } else {
      setOverRect(false);
    }
  }
  
  public void setOverRect(boolean bool){
    this.overRect = bool;
  }
  
  public boolean getOverRect(){
    return this.overRect;
  }
  
}
