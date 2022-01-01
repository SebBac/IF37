import g4p_controls.*;
import java.awt.Font;
import guru.ttslib.*;
import websockets.*;

enum Page { MENU, CONV };
Page page = Page.MENU;

PFont FontTitle, Arial;

PageMenu pageMenu = new PageMenu();
PageConv pageConv = new PageConv();


public WebsocketServer socket;

GTextArea textArea;
String message;
int pixelMinMessages; //pixel minimum possible où l'on peut mettre une bulle de message dans la PageConv (utilisé pour les limites du scroll)
int pixelMaxMessages; //pixel maximum possible où l'on peut mettre une bulle de message dans la PageConv
int deplacementConvScroll;
boolean enterKeyAlreadyPressed;
TTS tts;

void setup(){
  socket = new WebsocketServer(this, 1337, "/p5websocket");
  size(360,640);
  FontTitle = createFont("Arial Bold", 72);
  Arial = createFont("Arial", 24);
 
  // text area
  textArea = new GTextArea(this, 9, 540, 290, 92);
  textArea.setText("");
  textArea.setFont(new Font("SansSerif", Font.PLAIN, 16));
  pixelMaxMessages = 530;
  deplacementConvScroll = 0;
  enterKeyAlreadyPressed = false;
  
  //messages
  pixelMaxMessages = 450;
  
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
      
    default:
      break;
  }
}

void mousePressed() {
    if (page == Page.MENU) {
      pageMenu.mouseAction();
    } else if(page == Page.CONV) {
      pageConv.mouseAction();
    }
}

// Evenement quand l'utilisateur appuie sur la touche "Entrer" dans la text Area
public void handleTextEvents(GEditableTextControl textcontrol, GEvent event) {
    if(textArea == textcontrol && event == GEvent.ENTERED){
      message = textArea.getText();
    }
  }
  
 public void mouseWheel(MouseEvent event) {
   if (page == Page.CONV) {
     if (event.getCount() == -1 && -(pixelMaxMessages - 390) > deplacementConvScroll) { //scroll vers le haut
       deplacementConvScroll +=20;       
     }
     else if (event.getCount() == 1 && deplacementConvScroll > 10) { //scroll vers le bas
       deplacementConvScroll -=20;
     }
     float e = event.getCount();
     println(e + " " + deplacementConvScroll + " pixelMaxMessages = " + pixelMaxMessages + "pixelMinMessages =" + pixelMinMessages);
     println("-(pixelMaxMessages - 450) = " + -(pixelMaxMessages - 450));
   }

 }
  
  
