@isTest
private class DynamicSObjectCreationTest {
    static testmethod void testObjectCreation(){
        String typeName = 'account';
        String acctName = 'Acme';
        
        Account a = (Account)DynamicSObjectCreation.createObject(typeName);
        System.assertEquals(typeName,String.valueOf(a.getSobjectType()));
        
        a.Name = acctName;
        insert a;
        
        Account[] b = [SELECT Name FROM Account WHERE Name = :acctName];
        System.assert(b.size() > 0);
        
    }
}