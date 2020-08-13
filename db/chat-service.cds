namespace com.mhp.talk; 

using {Country,managed} from '@sap/cds/common'; 

// onboarded Uses with personal info and technical info about connection to client
 entity Users: managed {
        key ID        : UUID;
            nickname  : String not null;
            userId : String not null;
            firstname : String;
            lastname  : String;
            email     : String;
            division  : String; 
            client    : Association to many Clients on userId = userId; 
            isActive  : Boolean;
}
//one onboarded user can have multiple connected clients 

entity Clients: managed {
    key clientId: UUID; 
        userId: String; 
        clientHost  : String; 
        clientPaired: Boolean;
        maxDeliveryAttempts: Integer;
}

// this entity contains messages which are send from Client A to Client B
entity MessageQueue: managed { 
    key messageID: UUID; 
        senderClientId: String;
        reciepentClientId: String;
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
        senderClientId: String;
        reciepentClientId: String;
        status: String;
        createdOn: DateTime; 
        deliveryAttempts: Integer; 
        lastAttemptOn: DateTime
}
