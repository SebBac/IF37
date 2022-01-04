abstract class BulleMessage {
  
  protected int rectX;
  protected int rectY; 
  protected int rectWidth = 0;
  protected int rectHeight = 0;
 
  protected int maxWidth;
  protected int hauteurBulle;
  
  protected String message;
  protected String adaptedMessage;
  
  protected color colorBase = #000000;
  
  // Contructeur de la classe
  public BulleMessage(String message, color cBase) {
    
    this.message = message;
    this.adaptedMessage = "";
    this.maxWidth = 230;
    
    this.colorBase = cBase;
    
    int nbLignes = wordWrap();
    this.hauteurBulle = 25 + nbLignes * 24;
  }
  
  public String getMessage() {
    return this.message;
  }
  
  // Méthode permettant de dessiner la bulle de message
  public abstract void drawIt();
  
  // Méthode adaptant la taille du message pour l'afficher a l'ecran dans la bulle de texte
  // Renvoie le nombre de lignes utilisées par le texte lorsqu'il est affiché dans la bulle
  protected int wordWrap() {
    
    // Make an empty ArrayList
    StringList a = new StringList();
    float w = 0;    // Accumulate width of chars
    int i = 0;      // Count through chars
    int rememberSpace = 0; // Remember where the last space was
    int lastRememberedSpace = 0;
    
    // As long as we are not at the end of the String
    while (i < this.message.length()) {
      
      // Current char
      char c = this.message.charAt(i);
      w += textWidth(c); // accumulate width
//      System.out.println("char : " +c + ", totalWidth : " +w);

      if (c == ' ') rememberSpace = i; // Are we a blank space?
      
      if (w > this.maxWidth) {  // Have we reached the end of a line?
      
        String sub = this.message.substring(0,rememberSpace); // Make a substring
        // Chop off space at beginning
        if (sub.length() > 0 && sub.charAt(0) == ' ') sub = sub.substring(1,sub.length());
        // Add substring to the list
        a.append(sub);
        // Reset everything
        this.message = this.message.substring(rememberSpace,this.message.length());
        i = 0;
        w = 0;
      } 
      
      else {
        i++;  // Keep going!
      }
      
    }
  
    // Take care of the last remaining line
    if (this.message.length() > 0 && this.message.charAt(0) == ' ') this.message = this.message.substring(1,this.message.length());
    a.append(this.message);
    
    for (int ind = 0; ind < a.size(); ind++) {
     this.adaptedMessage += a.get(ind);
     this.adaptedMessage += "\n";
     //System.out.println(this.adaptedMessage);
    }
    
    //System.out.println(this.adaptedMessage);
    //System.out.println(a.size());
    
    return a.size();
  }
  
  
}
