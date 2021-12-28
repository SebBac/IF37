class PageConv{
  //Les boutons
  private RectBouton btReturn = new RectBouton(15, 15, 84, 52, #DEDEDE, #FFFFFF);
  private RectBouton btSugg1 = new RectBouton(24,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg2 = new RectBouton(119,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btSugg3 = new RectBouton(213,488, 83, 45, #DEDEDE, #FFFFFF);
  private RectBouton btFav = new RectBouton(306,488, 30, 45, #DEDEDE, #FFFFFF);
  private String adaptedSizeMessage = "";
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
  
  //Fonction adaptant le message de l'utilisateur pour l'afficher a l'ecran
  public void adaptMessage(){
    //max est la taille (width) maximum en pixel que le message peut occuper a l'ecran
    int max = 272;
    //on met a jour "this.adaptedSizeMessage" pour obtenir le message a afficher
    updateSizeMessage(max);
    
    //si le message a afficher est vide, on affiche "|..."
    if(this.adaptedSizeMessage == ""){
      this.adaptedMessage = "|...";
    } else  if(textWidth(this.adaptedSizeMessage) < max){ //s'il tient en une ligne, on l'affiche en une ligne
      this.adaptedMessage = this.adaptedSizeMessage + '|';
    } else { //sinon on le traite pour l'afficher sur 2 lignes en rajoutant un '\n' au milieu
      String adMessage = this.adaptedSizeMessage;
      //si le message a afficher n'est pas identique au message ecrit, alors c'est qu'il est reduit : on rajoute donc '...' devant
      if(!adMessage.equals(message)){
        adMessage = "..." + adMessage;
      }
      String firstLine = "";
      String secondLine = "";
      int mLength = adMessage.length();
      int i = 1;
      firstLine = adMessage.substring(0, mLength -i);
      while(textWidth(firstLine) > max){
        i++;
        firstLine = adMessage.substring(0, mLength -i);
      }
      secondLine = adMessage.substring(mLength -i, mLength);
      this.adaptedMessage = firstLine + '\n' + secondLine + '|';
    }
  }
  
  //fonction adaptant la taille du message de l'utilisateur pour lui permettre d'etre affiche
  public void updateSizeMessage(int max){
    int mLenght = message.length();
    
    //si le message peut rentrer en entier a l'affichage, alors on n'adapte pas sa taille.
    if(textWidth(message) < 2*max){
      this.adaptedSizeMessage = message;
    } else if (key == BACKSPACE) {
      //On supprime le dernier caractère en reprenant un caractère de "message" au début du String
      this.adaptedSizeMessage = message.substring(mLenght-(this.adaptedSizeMessage.length()), mLenght);
      while(textWidth("..." + this.adaptedSizeMessage) < 2*max && this.adaptedSizeMessage.length() + 1 < mLenght){
        this.adaptedSizeMessage = message.substring(mLenght-(this.adaptedSizeMessage.length() + 1), mLenght);
      }
      if(textWidth("..." + this.adaptedSizeMessage) > 2*max){
        this.adaptedSizeMessage = message.substring(mLenght-(this.adaptedSizeMessage.length() - 1), mLenght);
      }
    } else {
      this.adaptedSizeMessage = this.adaptedSizeMessage + key;
      int i = 0;
      if(textWidth("..." + this.adaptedSizeMessage) > 2*max){
        while(textWidth("..." + this.adaptedSizeMessage) > 2*max){
          i++;
          this.adaptedSizeMessage = this.adaptedSizeMessage.substring(i, this.adaptedSizeMessage.length());
        }
      }
    }
  }
}
