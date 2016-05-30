@isTest
private class ClassWithDifferentDataAccess {
	@isTest(SeeAllData=true)
    static void testWithAllDataAccess(){
        
    }
    
    @isTest static void testWithOwnDataAccess(){
        User u = [SELECT UserName,Email FROM User LIMIT 1];
        System.debug('UserName:'+ u.UserName);
        SYstem.debug('Email:'+ u.Email);
        
        Account a = new Account(Name = 'Test Account');
        insert a;
        Account insertedAcct = [SELECT Id,Name FROM Account
                               WHERE Name='Test Account'];
        System.assert(insertedAcct != null);
    }
}