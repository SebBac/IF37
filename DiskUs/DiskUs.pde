enum Page { MENU, CONV };
Page page = Page.MENU;

PFont FontTitle, Arial;

PageMenu pageMenu = new PageMenu();
PageConv pageConv = new PageConv();

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
      //pageConv.display();
      pageConv();
      break;
      
    default:
      break;
  }
}

void pageConv(){
  background(255);
  fill(0);
}

void mousePressed() {
    if (page == Page.MENU) {
      pageMenu.mouseAction();
    } else if(page == Page.CONV) {
      page = Page.MENU;
    }
  }
