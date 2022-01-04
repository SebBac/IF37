import g4p_controls.*;
import java.awt.Font;
import guru.ttslib.*;
import websockets.*;

enum Page { MENU, CONV, FAV };
Page page = Page.MENU;

PFont FontTitle, Arial;

PageMenu pageMenu = new PageMenu();
PageConv pageConv = new PageConv();
PageFav pageFav = new PageFav();

public WebsocketServer socket;

GTextArea textArea;
String message;

int pixelMaxMessages; //pixel maximum possible où l'on peut mettre une bulle de message dans la PageConv et dans la PageFav (utilisé pour les limites du scroll et pour l'affichage des messages)
int pixelMaxFav;
int deplacementConvScroll;
int deplacementFavScroll;

boolean enterKeyAlreadyPressed;
TTS tts;

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
      
    case FAV:
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
     if (event.getCount() == -1 && -(pixelMaxMessages - 390) > deplacementConvScroll) { //scroll vers le haut
       deplacementConvScroll +=20;       
     }
     else if (event.getCount() == 1 && deplacementConvScroll > 10) { //scroll vers le bas
       deplacementConvScroll -=20;
     }
   }
   
   // Scroll dans la page Fav
   else if (page == Page.FAV) {
     if (event.getCount() == -1 && -(pixelMaxFav - 530) > deplacementFavScroll) { //scroll vers le haut
       deplacementFavScroll +=20;       
     }
     else if (event.getCount() == 1 && deplacementFavScroll > 10) { //scroll vers le bas
       deplacementFavScroll -=20;
     }
     
     System.out.println("scroll : " + deplacementFavScroll);
   }
 }
  
  
