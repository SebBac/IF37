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
    
    textArea.setVisible(false);
  }
  
  // Dessine les boutons
  public void drawAllButtons(){
    boutonConv.drawIt();
  }
  
  // Verifie si le curseur est sur chaque bouton (utile pour la fonction mouseAction())
  public void update(){
    boutonConv.overRect();
  }
  
  // Gère les actions de la souris
  public void mouseAction(){
    // Si le curseur était sur le bouton de conversation lors du clic, on va à la page Conv
    if(boutonConv.getOverRect()){
      page = page.CONV;
    }
  }
}
