public with sharing class AccountHandler {
    public AccountHandler() {
        
    }

    public static Account insertNewAccount(String param){
        Account acc = New Account(Name=param);
        try{
            insert acc;
        }catch(Exception e){
            System.debug('Error Happen Param:'+e);
            acc = null;
        }
        return acc;
    }
}