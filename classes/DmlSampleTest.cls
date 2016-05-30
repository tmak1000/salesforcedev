@isTest
private class DmlSampleTest {
    public static testMethod void testUpsertLeads(){
        
        List<Lead> leads = new List<Lead>();
        
        for(Integer i = 0;i < 100;i++){
            leads.add(new Lead(LastName = 'testLead', Company = 'testCompany'));  
        }
        
        Test.startTest();
        
        List<Database.UpsertResult> results = DmlSamples.upsertLeads(leads);
        
        Test.stopTest();
        
        Set<Id> ids = new Set<Id>();
        
        for(Database.UpsertResult result : results){
            System.assert(result.isSuccess());
            ids.add(result.getId());
        }
        
        for(Lead  l :[SELECT Id,(SELECT Subject FROM Tasks) FROM Lead WHERE Id IN :ids]){
            System.assertEquals(1,l.tasks.size());
            
        }
        
    }
}