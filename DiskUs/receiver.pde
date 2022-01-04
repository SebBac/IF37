void webSocketServerEvent(String msg){
 println("MESSAGE RECU");
 println(msg);
 creerMessage(msg);
}

void creerMessage(String msg) {
  pageConv.listeMessagesConv.add(0, new BulleMessageConv(msg, #FFFFFF));
}
