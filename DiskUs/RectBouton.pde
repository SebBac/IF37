class RectBouton{
  private boolean overRect = false;
  private int rectX = 0;
  private int rectY = 0;
  private int rectWidth = 0;
  private int rectHeight = 0;
  private color colorBase = #000000;
  private color colorHover = #FFFFFF;
  
  // Constructeur
  public RectBouton(int x, int y, int w, int h, color cBase, color cHover){
    this.rectX = x;
    this.rectY = y;
    this.rectWidth = w;
    this.rectHeight = h;
    this.colorBase = cBase;
    this.colorHover = cHover;
  }
  
  // Setter de OverRect
  public void setOverRect(boolean bool){
    this.overRect = bool;
  }
  
  // Getter de OverRect
  public boolean getOverRect(){
    return this.overRect;
  }
  
  // Dessine le bouton
  public void drawIt(){
    if(this.overRect){
      fill(this.colorHover);
    } else {
      fill(this.colorBase);
    }
    rect(rectX, rectY, rectWidth, rectHeight);
  }
  
  // Méthode qui renvoie si le curseur est sur la bulle de message ou non
  public void overRect()  {
    if (rectX <= mouseX && mouseX <= rectX+rectWidth && 
        rectY <= mouseY && mouseY <= rectY+rectHeight) {
      setOverRect(true);
    } else {
      setOverRect(false);
    }
  }
}
