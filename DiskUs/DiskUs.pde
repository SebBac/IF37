import g4p_controls.*;
import java.awt.Font;
import guru.ttslib.*;
import websockets.*;

// Pages
enum Page { MENU, CONV, FAV };
Page page = Page.MENU;
PageMenu pageMenu = new PageMenu();
PageConv pageConv = new PageConv();
PageFav pageFav = new PageFav();

// Serveur websocket pour la reconnaissance vocale
public WebsocketServer socket;
// Synthèse vocale
TTS tts;

// Polices d'écriture
PFont FontTitle, Arial;

// Messages et zones de texte
GTextArea textArea;
String message;
int pixelMaxMessages; //pixel maximum possible où l'on peut mettre une bulle de message dans la PageConv (utilisé pour les limites du scroll et pour l'affichage des messages)
int pixelMaxFav; //pixel maximum possible où l'on peut mettre une bulle de message dans la PageFav (utilisé pour les limites du scroll et pour l'affichage des messages)
int deplacementConvScroll; // deplacement du au scroll dans la page Conv
int deplacementFavScroll; // deplacement du au scroll dans la page Fav


void setup(){
  socket = new WebsocketServer(this, 1337, "/p5websocket");
  size(360,640);
  FontTitle = createFont("Arial Bold", 72);
  Arial = createFont("Arial", 24);
  link("https://codepen.io/getflourish/pen/NpBGqe");
 
  // text area
  textArea = new GTextArea(this, 9, 540, 290, 92);
  textArea.setText("");
  textArea.setFont(new Font("SansSerif", Font.PLAIN, 16));
  
  //messages
  pixelMaxMessages = 450;
  
  // favoris
  pixelMaxFav = 525;
  
  // Scroll
  deplacementConvScroll = 0;
  deplacementFavScroll = 0;
  
  // text to speech
  tts = new TTS();
}

void draw() {  
  switch (page) {
    case MENU:  // Menu
      pageMenu.display();
      break;
      
    case CONV:  // Conversation
      pageConv.display();
      break;
      
    case FAV: // Favoris
      pageFav.display();
      break;
      
    default:
      break;
  }
}

void mousePressed() {
    if (page == Page.MENU) {
      pageMenu.mouseAction();
    } else if(page == Page.CONV) {
      pageConv.mouseAction();
    } else if(page == Page.FAV) {
      pageFav.mouseAction();
    }
}
  
public void mouseWheel(MouseEvent event) {
  
   // Scroll dans la page Conv
   if (page == Page.CONV) {
     if (event.getCount() == -1 && 390 -pixelMaxMessages > deplacementConvScroll) { //scroll vers le haut
       deplacementConvScroll +=20;       
     }
     else if (event.getCount() == 1 && deplacementConvScroll > 10) { //scroll vers le bas
       deplacementConvScroll -=20;
     }
   }
   
   // Scroll dans la page Fav
   else if (page == Page.FAV) {
     if (event.getCount() == -1 && 440 - pixelMaxFav > deplacementFavScroll) { //scroll vers le haut
       deplacementFavScroll +=20;       
     }
     else if (event.getCount() == 1 && deplacementFavScroll > 10) { //scroll vers le bas
       deplacementFavScroll -=20;
     }
   }
 }
  
  
