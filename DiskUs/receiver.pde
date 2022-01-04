// Receveur de messages grace à la reconnaissance vocale
void webSocketServerEvent(String msg){
 println("MESSAGE RECU");
 println(msg);
 creerMessage(msg);
}

// Ajout du message recu de la reconaissance vocale à la conversation
void creerMessage(String msg) {
  pageConv.listeMessagesConv.add(new BulleMessageConv(msg, #FFFFFF));
}
