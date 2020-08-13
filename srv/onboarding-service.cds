using { com.mhp.demo.chat as my } from '../db/schema';

service OnboardingService @(_requires:'admin') { 
    entity Users as projection on my.Users; 
    entity Clients as projection on my.Clients;
}