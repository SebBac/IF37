enum Page { MENU, CONV };
Page page = Page.MENU;

PFont FontTitle, Arial;

PageMenu pageMenu = new PageMenu();
PageConv pageConv = new PageConv();

String message = "";

void setup(){
  size(360,640);
  FontTitle = createFont("Arial Bold", 72);
  Arial = createFont("Arial", 24);
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
  
void keyPressed(){
  if(page == Page.CONV){
    pageConv.inputMessage();
  }
}
