class PageConv{
  //Le bouton
  private RectBouton bouton = new RectBouton(53, 291, 253, 59);
  
  public void display(){
    //fond
    background(#2D2727);
    
    //titre
    textFont(FontTitle);
    fill(#FFFFFF);
    text("DiskUs", 62, 100);
    
    //bouton "Nouvelle conversation
    update();
    if(bouton.getOverRect()){
      fill(#FFFFFF);
    } else {
      fill(#DEDEDE);
    }
    rect(bouton.getX(), bouton.getY(), bouton.getWidth(), bouton.getHeight());
    
    //texte
    textFont(Arial);
    fill(#000000);
    text("Nouvelle conversation", 61, 329);
  }
  
  public void update(){
    bouton.overRect();
  }
  
  public void mouseAction(){
    if(bouton.getOverRect()){
      page = page.CONV;
    }
  }
}
