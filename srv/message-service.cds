using { com.mhp.demo.chat as my } from '../db/schema'; 

service MessageService  @(path:'/msg-queue') { 
      @insertonly entity MessageQueue as projection on my.MessageQueue excluding { createdOn };

      @readonly entity MessageLog as projection on my.MessageLog; 

}