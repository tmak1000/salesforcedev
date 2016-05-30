@isTest
private class RunasTest {
    static testMethod void mixeddmltest(){
        Account ac  = new Account(Name='TEST ACCOUNT');
        insert ac;
        
        User u1 = [SELECT Id FROM USER WHERE UserName='testadmin@acme.com'];
        System.runAs(u1){
            Test.startTest();
            
            delete ac;
            
            Test.stopTest();
                
        }
    }
}