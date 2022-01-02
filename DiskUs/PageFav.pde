class PageFav{
  //Les boutons
  private RectBouton btReturn = new RectBouton(15, 15, 84, 52, #DEDEDE, #FFFFFF);
  private RectBouton btSend = new RectBouton(313,574, 23, 23, #DEDEDE, #FFFFFF);
  
  ArrayList<String> listeMessagesFav = new ArrayList<String>();
  
  public ArrayList<String> getListeMessageFav(){
    return this.listeMessagesFav;
  }
  
  public void display(){
    //fond
    background(#2D2727);
    
    //cadre gris
    fill(#414040);
    rect(9, 9, 342, 622);
    
    //images
    fill(#7D7D7D);
    rect(9, 540, 342, 92); //rectangle fond zone de texte
    fill(#2D2727);
    rect(9, 0, 342, 8); //fond pour cacher les bulles de textes sur le haut de l'ecran
    rect(9, 632, 342, 8); //idem pour le bas de l'ecran
    fill(#373131);
    rect(9, 9, 342, 67); //fond zone de retour au menu
    
    //texte
    textArea.setVisible(true);
    enterAddMessageFav();
    
    //les boutons
    update();
    drawAllButtons();
  }
  
  public void update(){
    this.btReturn.overRect();
    this.btSend.overRect();
  }
  
  public void drawAllButtons(){
    this.btReturn.drawIt();
    this.btSend.drawIt();
  }
  
  public void enterAddMessageFav(){
    if (keyPressed && key == ENTER) {
      addMessageFav();
    }
  }
  
  public void addMessageFav(){
    message = textArea.getText();
    if(message.length() > 1){
      this.listeMessagesFav.add(message);
      textArea.setText("");
    }
  }
  
  public void mouseAction(){
    if(this.btReturn.getOverRect()){
      page = Page.CONV;
    } else if (btSend.getOverRect()){
      addMessageFav();
    }
  }
}
