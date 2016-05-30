@isTest
private class DataUtil {
    static testmethod void testLoadData(){
        List<sObject> ls = Test.loadData(Account.sobjectType, 'testcsv');
        
        System.assert(ls.size() == 3);
        
        Account a1 = (Account)ls[0];
        String acctName = a1.Name;
        System.debug(acctName);
    }
}