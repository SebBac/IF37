class PageConv{
  //Les boutons
  private RectBouton btReturn = new RectBouton(15, 15, 84, 52, #DEDEDE, #FFFFFF);
  private RectBouton btSugg1 = new RectBouton(24,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg2 = new RectBouton(119,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg3 = new RectBouton(213,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btFav = new RectBouton(306,488, 30, 45, #DEDEDE, #FFFFFF);
  private String adaptedMessage = "|...";
  
  public void display(){
    //fond
    background(#2D2727);
    
    //cadre gris
    fill(#414040);
    rect(9, 9, 342, 622);
    
    //les boutons
    update();
    drawAllButtons();
    
    //images
    fill(#7D7D7D);
    rect(9, 540, 342, 92);
    
    //texte
    textFont(Arial);
    textSize(18);
    fill(#FFFFFF);
    text(this.adaptedMessage, 20, 574);
  }
  
  public void drawAllButtons(){
    btReturn.drawIt();
    btSugg1.drawIt();
    btSugg2.drawIt();
    btSugg3.drawIt();
    btFav.drawIt();
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
  
  //Fonction gerant le message que l'utilisateur ecrit
  public void inputMessage(){
    //on ne prend pas en compte les touches speciales comme SHIFT ou MAJ
    if(key != CODED && key != ENTER){
      //si l'utilisateur veut supprimer le dernier caractere rentre...
      if(key == BACKSPACE){
        if(message.length() > 0){ 
          message = message.substring(0, message.length()-1);
          pageConv.adaptMessage();
          print(message + "\n");
        }
      }
      else {
        message += key;
        pageConv.adaptMessage();
        print(message + "\n");
      }
    }
  }
  
  //Fonction adaptant la taille du message pour l'afficher a l'ecran
  public void adaptMessage(){
    if(message.length() == 0){
      this.adaptedMessage = "|...";
    } else {
      String adMessage = message;
      String firstPart = "";
      String secondPart = "";
      int max = 272;
      int i = 0;
      
      if(textWidth(adMessage) > 2*max){
        i = 1;
        adMessage = "..." + adMessage.substring(i, adMessage.length());
        while(textWidth(adMessage) > 2*max){
          i++;
          adMessage = "..." + adMessage.substring(i, adMessage.length());
        }
      }
      
      int mLength = adMessage.length();
      
      if(textWidth(adMessage) > max){
        i = 1;
        firstPart = adMessage.substring(0, mLength -i);
        while(textWidth(firstPart) > max){
          i++;
          firstPart = adMessage.substring(0, mLength -i);
        }
        secondPart = adMessage.substring(mLength -i, mLength);
        adMessage = firstPart + '\n' + secondPart;
      }
      
      this.adaptedMessage = adMessage;
      }
  }
}
