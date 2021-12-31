class PageConv{
  //Les boutons
  private RectBouton btReturn = new RectBouton(15, 15, 84, 52, #DEDEDE, #FFFFFF);
  private RectBouton btSugg1 = new RectBouton(24,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg2 = new RectBouton(119,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg3 = new RectBouton(213,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btFav = new RectBouton(205,488, 30, 45, #DEDEDE, #FFFFFF);
  
  public ArrayList <BulleMessage> listeMessages = new ArrayList<BulleMessage>();
  
  
  public void display(){
    //fond
    background(#2D2727);
    
    //cadre gris
    fill(#414040);
    rect(9, 9, 342, 622);
    
        
    //les messages
    drawAllMessages();
    
    //les boutons
    update();
    drawAllButtons();
    
    //images
    fill(#7D7D7D);
    rect(9, 540, 342, 92);
    
    //texte
    textArea.setVisible(true);
    if (keyPressed && key == ENTER && enterKeyAlreadyPressed == false) {
      enterKeyAlreadyPressed = true;
      
      println(message);
      
      // Créer bulle de message
      /*int nbLignesMessage = wordWrap(message, 205);
      int hauteurBulle = 20 + nbLignesMessage * 22;
      listeMessages.add(new BulleMessage(message, 105, pixelMaxMessages - hauteurBulle, 220, hauteurBulle, #FFFFFF));
      pixelMaxMessages = pixelMaxMessages - hauteurBulle - 20;*/
      textArea.setText("");
      listeMessages.add(0, new BulleMessage(message, #FFFFFF));
            
      tts.speak(message);
      
    }
    if (!keyPressed && enterKeyAlreadyPressed == true) {
      enterKeyAlreadyPressed = false;
    }
  }
  
  public void drawAllButtons(){
    btReturn.drawIt();
    btSugg1.drawIt();
    btSugg2.drawIt();
    btSugg3.drawIt();
    btFav.drawIt();
  }
  
  public void drawAllMessages() {
    textSize(16);
    for (int i = 0; i < listeMessages.size(); i++) {
      listeMessages.get(i).drawIt(); 
    }
    pixelMaxMessages = 450;
  }
  
  public void update(){
    btReturn.overRect();
    btSugg1.overRect();
    btSugg2.overRect();
    btSugg3.overRect();
    btFav.overRect();
  }
  
  public void mouseAction(){
    if(btReturn.getOverRect()){
      page = page.MENU;
    }
  }
  
  

  
  
}
