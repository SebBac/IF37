class PageFav{
  //Les boutons
  private RectBouton btReturn = new RectBouton(15, 15, 84, 52, #DEDEDE, #FFFFFF);
  private RectBouton btSend = new RectBouton(313,574, 23, 23, #DEDEDE, #FFFFFF);
  
  ArrayList<BulleMessageFav> listeMessagesFav = new ArrayList<BulleMessageFav>();
  

  
  // Affichage de la page Fav
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
    drawAllMessages();
  }
  
  // Verifie si le curseur est sur chaque bouton (utile pour la fonction mouseAction())
  public void update(){
    this.btReturn.overRect();
    this.btSend.overRect();
  }
  
  // Dessine les boutons
  public void drawAllButtons(){
    this.btReturn.drawIt();
    this.btSend.drawIt();
  }
  
  // Dessine les messages
  public void drawAllMessages() {
    textSize(16);
    pixelMaxFav = 520;
    for (int i = listeMessagesFav.size() -1 ; i >= 0; i--) {
      listeMessagesFav.get(i).drawIt(); 
    }
  }
  
  // Ajoute un message aux favoris : Appel de la méthode addMessageFav
  public void enterAddMessageFav(){
    if (keyPressed && key == ENTER) {
      addMessageFav();
    }
  }
  
  // Methode qui ajoute un message aux favoris s'il n'est pas vide : Création d'une nouvelle bulle de message favoris + nettoyage de la zone de texte
  public void addMessageFav(){
    message = textArea.getText();
    if(message.length() > 1){
      this.listeMessagesFav.add(new BulleMessageFav(message, #FFFFFF));
      textArea.setText("");
    }
  }
  
  // Getter de la liste des messages favoris
  public ArrayList<BulleMessageFav> getListeMessageFav(){
    return this.listeMessagesFav;
  }
  
  // Methode gérant les clics de l'utilisateur
  public void mouseAction(){

    // Si le curseur était sur le bouton retour, on retourne à la page Conv
    if(this.btReturn.getOverRect()){
      page = Page.CONV;
    } 
    
    // Si le curseur était sur le bouton d'envoi, on ajoute le message de la textArea aux favoris
    else if (btSend.getOverRect()){
      addMessageFav();
    }
    
    // Pour chaque message favoris, si le curseur était sur la bulle du message lors du clic, on envoie le message
    for (int i = 0; i < listeMessagesFav.size(); i++) {
      if (listeMessagesFav.get(i).getOverRect()) {
        // On envoie le message sur lequel l'utilisateur a cliqué
        pageConv.sendBulleTTS(pageFav.getListeMessageFav().get(i).getMessage());
        // On retourne à la page Conv
        page = Page.CONV;
      }
    }
  }
}
