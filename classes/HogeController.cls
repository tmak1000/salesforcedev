public  class HogeController {
  public List<CaseReport__c> stdObj{get;set;}
  public CaseReport__c cr{get;set;}
      public String param{
        get ;set;
    }
  public HogeController(){
    this.stdObj = [SELECT Id,Name, MakeName__c  FROM CaseReport__c];
  }

  public PageReference save(){
    /*
    if(xxxx == false){
      // 警告メッセージをセット
      ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.WARNING, 'error..');
      ApexPages.addMessage(msg);
    
     param = System.currentPageReference().getParameters().get('data');
     System.debug('caseid@@@'+param);
     cr = [SELECT Id,Name, MakeName__c ,Account__r.Name FROM CaseReport__c LIMIT 1];
     cr.MakeName__c = cr.Account__r.Name; */
           // 遷移先画面を指定
      String backUrl = ApexPages.currentPage().getUrl();
      PageReference page = new PageReference('a0X1000000C9FwN/e?retURL='+backUrl);
      page.setRedirect(false);

      return page;
    }
   

}