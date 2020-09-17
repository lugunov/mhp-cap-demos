namespace com.mhp.demo.chat; 

using {managed} from '@sap/cds/common'; 

// onboarded Uses with personal info and technical info about connection to client
 entity Users: managed {
        key ID        : Integer;
            nickname  : String not null;
            userID    : String not null;
            firstname : String;
            lastname  : String;
            email     : String;
            division  : String; 
            client    : Association to many Clients on userID = userID; 
            isActive  : Boolean;
}
//one onboarded user can have multiple connected clients 

entity Clients: managed {
    key clientID: Integer; 
        userID: String; 
        clientHost  : String; 
        clientPaired: Boolean;
        maxDeliveryAttempts: Integer;
        interval: Integer;
        sentMessages: Association to many MessageLog on sentMessages.senderClientId = clientID; 
        recievedMessages: Association to many MessageLog on recievedMessages.reciepentClientId = clientID;

}

// This entity contains messages which has to be sent to client
// The status can be "SENT"; "FAILED"; 
entity MessageLog: managed {
    key messageID: UUID;
        senderClientId: Integer;
        reciepentClientId: Integer;
        messageText: String; 
        status: String;
        createdOn: DateTime; 
        deliveryAttempts: Integer; 
        lastAttemptOn: DateTime;
        scheduled: Boolean;
        scheduleDateTime: DateTime;
}
