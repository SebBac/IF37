class PageConv{
  //Les boutons
  private RectBouton btReturn = new RectBouton(15, 15, 84, 52, #DEDEDE, #FFFFFF);
  private RectBouton btSugg1 = new RectBouton(24,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg2 = new RectBouton(119,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg3 = new RectBouton(213,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btFav = new RectBouton(306,488, 30, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSend = new RectBouton(313,574, 23, 23, #DEDEDE, #FFFFFF);
  
  public ArrayList <BulleMessageConv> listeMessagesConv = new ArrayList<BulleMessageConv>();
  
  public void display(){
    //fond
    background(#2D2727);
    
    //cadre gris
    fill(#414040);
    rect(9, 9, 342, 622);
    
    //les messages
    drawAllMessages();
    
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
    addBullesTTS();
    
    //les boutons
    update();
    drawAllButtons();
  }
  
  public void update(){
    btReturn.overRect();
    btSugg1.overRect();
    btSugg2.overRect();
    btSugg3.overRect();
    btFav.overRect();
    btSend.overRect();
  }
  
  public void drawAllButtons(){
    btReturn.drawIt();
    btSugg1.drawIt();
    btSugg2.drawIt();
    btSugg3.drawIt();
    btFav.drawIt();
    btSend.drawIt();
  }
  
  public void drawAllMessages() {
    textSize(16);
    pixelMaxMessages = 450;
    for (int i = listeMessagesConv.size() -1 ; i >= 0; i--) {
      listeMessagesConv.get(i).drawIt(); 
    }
  }
  
  public void addBullesTTS(){
    if (keyPressed && key == ENTER) {
      sendBulleTTS();
    }
  }
  
  public void sendBulleTTS(){
    message = textArea.getText();
    if(message.length() > 1){ //si la textArea est vide, le message fait quand même 1 caractère de longueur
      bulleTTS();
    }
  }
  
  public void sendBulleTTS(String m){
    message = m;
    bulleTTS();
  }
  
  public void bulleTTS(){
    println(message);
    textArea.setText("");
    listeMessagesConv.add(new BulleMessageConv(message, #60A0FF));
          
    tts.speak(message);
  }
  
  public void mouseAction(){
    if(btReturn.getOverRect()){
      page = Page.MENU;
    } else if(btSugg1.getOverRect()){
      if(pageFav.getListeMessageFav().size()>=1){
        sendBulleTTS(pageFav.getListeMessageFav().get(0).getMessage());
      }
    } else if(btSugg2.getOverRect()){
      if(pageFav.getListeMessageFav().size()>=2){
        sendBulleTTS(pageFav.getListeMessageFav().get(1).getMessage());
      }
    } else if(btSugg3.getOverRect()){
      if(pageFav.getListeMessageFav().size()>=3){
        sendBulleTTS(pageFav.getListeMessageFav().get(2).getMessage());
      }
    } else if (btFav.getOverRect()){
      page = Page.FAV;
    } else if (btSend.getOverRect()){
      sendBulleTTS();
    }
  }
}
