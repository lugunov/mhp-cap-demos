using { com.mhp.demo.chat as my } from '../db/schema'; 

service MessageService  @(path:'/msg-queue') { 
      entity MessageLog as projection on my.MessageLog; 
}