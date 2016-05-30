@isTest
private class OpportunityWrapperTest {
    static testmethod void test1(){
        
        OpportunityWrapper[] oppyList = new List<OpportunityWrapper>();
        Date closeDate = Date.today().addDays(10);
        oppyList.add(new OpportunityWrapper(new Opportunity(
            Name='Edge Installation',
            CloseDate=closeDate,
            StageName='Prospecting',
            Amount=50000
        )));
        oppyList.add( new OpportunityWrapper(new Opportunity(
            Name='United Oil Installations',
            CloseDate=closeDate,
            StageName='Needs Analysis',
            Amount=100000)));
        oppyList.add( new OpportunityWrapper(new Opportunity(
            Name='Grand Hotels SLA',
            CloseDate=closeDate,
            StageName='Prospecting',
            Amount=25000)));
		oppyList.sort();
        
        System.assertEquals('Grand Hotels SLA', oppyList[0].oppy.Name);
        System.assertEquals(25000, oppyList[0].oppy.Amount);
        System.assertEquals('Edge Installation', oppyList[1].oppy.Name);
        System.assertEquals(50000, oppyList[1].oppy.Amount);
        System.assertEquals('United Oil Installations', oppyList[2].oppy.Name);
        System.assertEquals(100000, oppyList[2].oppy.Amount);
        // Write the sorted list contents to the debug log.
        System.debug(oppyList);

        
    }
}