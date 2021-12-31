void webSocketServerEvent(String msg){
 println("MESSAGE RECU");
 println(msg);
 creerMessage(msg);
}

void creerMessage(String msg) {
  pageConv.listeMessages.add(0, new BulleMessage(msg, #FFFFFF));
}
