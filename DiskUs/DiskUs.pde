import g4p_controls.*;
import java.awt.Font;

enum Page { MENU, CONV };
Page page = Page.MENU;

PFont FontTitle, Arial;

PageMenu pageMenu = new PageMenu();
PageConv pageConv = new PageConv();

GTextArea txf1;
String t0;
boolean enterKeyAlreadyPressed = false;

void setup(){
  size(360,640);
  FontTitle = createFont("Arial Bold", 72);
  Arial = createFont("Arial", 24);
  
  enterKeyAlreadyPressed = false;

  txf1 = new GTextArea(this, 9, 540, 290, 92);
  txf1.setText("");
  txf1.setFont(new Font("SansSerif", Font.PLAIN, 16));
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

public void handleTextEvents(GEditableTextControl textcontrol, GEvent event) {
    if(txf1 == textcontrol && event == GEvent.ENTERED){
      t0 = txf1.getText();
    }
  }
