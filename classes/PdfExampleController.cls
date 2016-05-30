public with sharing class PdfExampleController {
    public List<Account> accList{get;set;}
    public PdfExampleController (){
        accList = [select id,name,type,accountnumber,annualrevenue,Rating from account limit 10];
    }
}