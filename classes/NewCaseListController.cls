public class NewCaseListController {

    public NewCaseListController(ApexPages.StandardController controller) {

    }

    
    public List<Case> getNewCases(){
        List<Case> cases = New List<Case>();
        cases = [SELECT Id,CaseNumber,Status FROM Case WHERE Status = 'New'];
        return cases;
    }
}