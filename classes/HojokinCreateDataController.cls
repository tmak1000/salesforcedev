public class HojokinCreateDataController{

    public LoginInfo__c lif{get;set;}
    public FacilityInfo__c fi{get;set;}

    public HojokinCreateDataController(){
        lif = new LoginInfo__c();
        fi = new FacilityInfo__c();
    
      List<LoginInfo__c> lilist = [SELECT 
                                LoginNumber__c,
                                LoginName__c,
                                MailAddress__c,
                                LoginID__c,
                                LoginPhone__c,
                                Bikou__c,
                                FacilityID__c
                                FROM LoginInfo__c];
                                
       List<FacilityInfo__c> filist = [ SELECT 
                                  FacilityID__c,
                                  //EventDate__c,
                                  FacilityName__c,
                                  FacilityAddress__c,
                                 // EventTime__c,
                                  URL__c,
                                  Capacity__c
                                  FROM FacilityInfo__c     
       
                       ];                       
    }
    
    public PageReference createLoginInfo(){
    
        upsert lif;
        lif = new LoginInfo__c();
        return null;
    }
    
    public PageReference createFacilityInfo(){
        upsert fi;
        fi = new FacilityInfo__c();
        return null;
        
    }
    

        


}