@isTest(SeeAllData=true)
public class TestDataAccessClass {

    static testmethod void myTestMethod1(){
        Account a = [SELECT Id,Name FROM Account WHERE Name='Acme' LIMIT 1];
        System.assert(a != null);
        
        Account testAccount = a.clone();
        testAccount.Name = 'Acme Test';
        insert testAccount;
        
        Account testAccount2 = [SELECT Id,Name FROM Account
                               WHERE Name = 'Acme Test' LIMIT 1];
        
    }
    
    @isTest static void myTestMethod2(){
        
    }
    
}