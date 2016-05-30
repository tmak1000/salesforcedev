public with sharing class PerformeStoreInfoBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    public Boolean afterChecked {get; set;}
    private PerfomeStoreInfo__c perfomStore {get; set;}
    private Integer recordCount {get; set;}
    
    public PerformeStoreInfoBatch(Boolean checked) {
        this.afterChecked = checked;
        this.perfomStore = new PerfomeStoreInfo__c(
             recordCount__c = 0
            ,StartDateTime__c = dateTime.now()
        );
        insert this.perfomStore;
        this.recordCount = 0;
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id FROM Account';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<Account> scope) {
        for (Account account : scope) {
            account.Checked__c = this.afterChecked;
            this.recordCount++;
        }
        update scope;
    }
    
    public void finish(Database.BatchableContext BC) {
        this.perfomStore.recordCount__c = this.recordCount ;
        //this.perfomStore.EndDateTime__c = dateTime.now();
        update this.perfomStore;
        //CommonLimit.debugLimitsAll();
    }
}