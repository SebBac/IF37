class PageConv{
  //Les boutons
  private RectBouton btReturn = new RectBouton(15, 15, 84, 52, #DEDEDE, #FFFFFF);
  private RectBouton btSugg1 = new RectBouton(24,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg2 = new RectBouton(119,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg3 = new RectBouton(213,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btFav = new RectBouton(306,488, 30, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSend = new RectBouton(313,574, 23, 23, #DEDEDE, #FFFFFF);
  
  //Liste des messages de la conversation
  public ArrayList <BulleMessageConv> listeMessagesConv = new ArrayList<BulleMessageConv>();
  
  //Affichage de la pageConv
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
    
    textFont(Arial);
    textSize(12);
    fill(#000000);
    text("Retour", 40, 45);
    text(">", 321,590);
    text("fav", 310,515);
    
    
    writeFavOnButton();
    
  }
  
  public void writeFavOnButton() {
    if (pageFav.getListeMessagesFav().size() == 0) {
      textSize(20);
      text("...", 57,515);
      text("...", 152,515);
      text("...", 246,515);
    } 
    else {
      if (pageFav.getListeMessagesFav().size() == 1){
        text(pageFav.getListeMessagesFav().get(0).getMessageForFavButton(), 30,515);
        textSize(20);
        text("...", 152,515);
        text("...", 246,515);
      }
      else if (pageFav.getListeMessagesFav().size() == 2){
        text(pageFav.getListeMessagesFav().get(0).getMessageForFavButton(), 30,515);
        text(pageFav.getListeMessagesFav().get(1).getMessageForFavButton(), 125,515);
        textSize(20);
        text("...", 246,515);
      }
      else if (pageFav.getListeMessagesFav().size() >= 3){
        text(pageFav.getListeMessagesFav().get(0).getMessageForFavButton(), 30,515);
        text(pageFav.getListeMessagesFav().get(1).getMessageForFavButton(), 125,515);
        text(pageFav.getListeMessagesFav().get(2).getMessageForFavButton(), 219,515);
      }
    }
  }
  
  // Verifie si le curseur est sur chaque bouton (utile pour la fonction mouseAction())
  public void update(){
    btReturn.overRect();
    btSugg1.overRect();
    btSugg2.overRect();
    btSugg3.overRect();
    btFav.overRect();
    btSend.overRect();
  }
   // Dessine les boutons
  public void drawAllButtons(){
    btReturn.drawIt();
    btSugg1.drawIt();
    btSugg2.drawIt();
    btSugg3.drawIt();
    btFav.drawIt();
    btSend.drawIt();
  }
  
  // Dessine les messages de la conversation
  public void drawAllMessages() {
    textSize(16);
    pixelMaxMessages = 450;
    for (int i = listeMessagesConv.size() -1 ; i >= 0; i--) {
      listeMessagesConv.get(i).drawIt(); 
    }
  }
  
  // Ajout d'un message : Appel de la méthode SendBulleTTS()
  public void addBullesTTS(){
    if (keyPressed && key == ENTER) {
      sendBulleTTS();
    }
  }
  
  // Ajout d'un message s'il est non vide
  public void sendBulleTTS(){
    message = textArea.getText();
    if(message.length() > 1){ //si la textArea est vide, le message fait quand même 1 caractère de longueur
      bulleTTS();
    }
  }
  
  // Ajout d'un message passé en paramètre
  public void sendBulleTTS(String m){
    message = m;
    bulleTTS();
  }
  
  // Ajout de la bulle de message, synthèse vocale du message et reinitialisation de la zone de texte
  public void bulleTTS(){
    println(message);
    textArea.setText("");
    listeMessagesConv.add(new BulleMessageConv(message, #60A0FF));
          
    tts.speak(message);
  }
  
  // Methode gérant les clics de l'utilisateur
  public void mouseAction(){
    
    // Si le curseur était sur le bouton retour, on retourne au menu
    if(btReturn.getOverRect()){
      page = Page.MENU;
    }
    
    // Si le curseur était sur le bouton de suggestion d'un massage favori, on envoie ce message
    else if(btSugg1.getOverRect()){
      if(pageFav.getListeMessageFav().size()>=1){
        sendBulleTTS(pageFav.getListeMessageFav().get(0).getMessage());
      }
    } 
    else if(btSugg2.getOverRect()){
      if(pageFav.getListeMessageFav().size()>=2){
        sendBulleTTS(pageFav.getListeMessageFav().get(1).getMessage());
      }
    } 
    else if(btSugg3.getOverRect()){
      if(pageFav.getListeMessageFav().size()>=3){
        sendBulleTTS(pageFav.getListeMessageFav().get(2).getMessage());
      }
    } 
    
    //Si le curseur était sur le bouton menant à la page Fav, on change de page pour la page Fav
    else if (btFav.getOverRect()){
      page = Page.FAV;
    } 
    // Si le curseur était sur le bouton d'envoi, on envoie le message de la textArea
    else if (btSend.getOverRect()){
      sendBulleTTS();
    }
  }
}
