class RectBouton{
  private boolean overRect = false;
  private int rectX = 0;
  private int rectY = 0;
  private int rectWidth = 0;
  private int rectHeight = 0;
  
  public RectBouton(int x, int y, int w, int h){
    this.rectX = x;
    this.rectY = y;
    this.rectWidth = w;
    this.rectHeight = h;
  }
  
  public int getX(){
    return rectX;
  }
  
  public int getY(){
    return rectY;
  }
  
  public int getWidth(){
    return rectWidth;
  }
  
  public int getHeight(){
    return rectHeight;
  }
  
  public void setOverRect(boolean bool){
    this.overRect = bool;
  }
  
  public boolean getOverRect(){
    return this.overRect;
  }
  
  public void overRect()  {
    if (rectX <= mouseX && mouseX <= rectX+rectWidth && 
        rectY <= mouseY && mouseY <= rectY+rectHeight) {
      setOverRect(true);
    } else {
      setOverRect(false);
    }
  }
}
