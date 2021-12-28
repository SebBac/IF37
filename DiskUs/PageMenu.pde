class PageMenu{
  //Le bouton
  private RectBouton boutonConv = new RectBouton(53, 291, 253, 59, #DEDEDE, #FFFFFF);
  
  public void display(){
    //fond
    background(#2D2727);
    
    //titre
    textFont(FontTitle);
    fill(#FFFFFF);
    text("DiskUs", 62, 100);
    
    //les boutons
    update();
    drawAllButtons();
    
    //texte
    textFont(Arial);
    fill(#000000);
    text("Nouvelle conversation", 61, 329);
    
    txf1.setVisible(false);
  }
  
  public void drawAllButtons(){
    boutonConv.drawIt();
  }
  
  public void update(){
    boutonConv.overRect();
  }
  
  public void mouseAction(){
    if(boutonConv.getOverRect()){
      page = page.CONV;
    }
  }
}
