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
}

// this entity contains messages which are send from Client A to Client B
entity MessageQueue: managed { 
    key messageID: UUID; 
        senderClientId: Integer;
        reciepentClientId: Integer;
        messageText: String; 
        createdOn: DateTime; 
        deliveryAttempts: Integer; 
        scheduled: Boolean;
        scheduleDateTime: DateTime

}
// After message was sent to client or failed, put header of message in log
// test of message is not saved
entity MessageLog: managed {
    key messageID: UUID;
        senderClientId: Integer;
        reciepentClientId: Integer;
        status: String;
        createdOn: DateTime; 
        deliveryAttempts: Integer; 
        lastAttemptOn: DateTime
}
