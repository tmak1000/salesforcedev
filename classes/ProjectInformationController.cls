public class ProjectInformationController{
    public List<ProjectInformation__c> pList {get;set;}
    public ProjectInformationController(){
        this.pList = [SELECT Name,DateTimeFiled__c,NumDateTIme__c ,FormulaFromDateTime__c FROM ProjectInformation__c]; 
    }
        
    
    
}