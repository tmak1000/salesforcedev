public with sharing class EmpIchiranController {

    public EmpInfo__c empinfo{get;set;}
    public List<EmpInfo__c> target{get;set;}
    public List<EmpInfo__c> emps{get;set;}
    public String Lname{get;set;}
    public String WorkTime{get;set;}
    public String Hoge{get;set;}
    public String Word{get;set;} 
    String xmlContents{get;set;}

        
    public EmpIchiranController(){
        emps = [SELECT ID,EmpID__c,LastName__c,FirstName__c,Abbreviation__c,Post__c,Sex__c,
                RegistedYear__c FROM EmpInfo__c ORDER BY RegistedYear__c DESC];
         if(empinfo == null){empinfo = new EmpInfo__c();}
         
         emps = new List<EmpInfo__c>();
         
    }
    
     public void ichiran(){
           emps = [SELECT ID,EmpID__c,LastName__c,FirstName__c,Abbreviation__c,Post__c,Sex__c,
               RegistedYear__c FROM EmpInfo__c ORDER BY RegistedYear__c DESC];  
               emps[1].Post__c = null;
               emps[1].FirstName__c = '役職にnullをいれた';
           
    }
 
    public PageReference search(){
        /*
        List<String> target = this.Word.split('[\\s]+');
        List<EmpInfo__c> tmpList = New List<EmpInfo__c>();
        emps = New List<EmpInfo__c>(); 
        for(String t : target){
           tmpList = [SELECT ID,EmpID__c,LastName__c,FirstName__c,Abbreviation__c,Post__c,Sex__c,
                RegistedYear__c FROM EmpInfo__c WHERE LastName__c = :t];
            for(EmpInfo__c ei : tmpList){
              emps.add(ei);
            }
        }  */
      CaseReport__c cr = [SELECT Id,Name, MakeName__c ,Account__r.Name FROM CaseReport__c LIMIT 1];
      cr.MakeName__c = cr.Account__r.Name;  
      update cr;
      String backUrl = ApexPages.currentPage().getUrl();
      PageReference page = new PageReference('/'+cr.Id+'/e?retURL='+backUrl);
      page.setRedirect(false);

      return page;
        return null; 
      
                         
        }
  
     public PageReference NewRegist(){
            PageReference nextPage = Page.EmpRegist;
             nextPage.setRedirect(true);
             return nextPage;
        }
        
        
    
        public EmpInfo__c getEmpInfo() {
            return empinfo;
      }
      
       public void save(){               
           
           emps = [SELECT ID,EmpID__c,LastName__c,FirstName__c,Abbreviation__c,Post__c,Sex__c,
                RegistedYear__c FROM EmpInfo__c  
                WHERE  
                LastName__c = :empinfo.LastName__c 
                OR FirstName__c = :empinfo.FirstName__c
                OR SEX__c = :empinfo.Sex__c
                OR  Post__c = :empinfo.Post__c
                OR Abbreviation__c = :empinfo.Abbreviation__c
                OR RegistedYear__c = :empinfo.RegistedYear__c 
                OR SEX__c = :empinfo.Sex__c
                
                ];
                         
                                 
                        
                   // empinfo.LastName__c;
                 //必須入力が無いときに入力規則エラーを戻す。   
        /*  

             PageReference nextPage = Page.EmpIchiran;
             

             nextPage.setRedirect(true);
             return nextPage; */
               
      }
      
      public String getLname(){
          return Lname;
      }
      
      public String getWorkTime(){
          return 'work';
      }
    
      public List<String> getAnkens() {
         List<String> str = new List<String>();
         str.add('ISID');
         str.add('光文図書');
         str.add('社内作業');
         return str;
}
  
      
      public List<String> getStrings() {
//return new String[]{'ONE','TWO','THREE'};
         List<String> str = new List<String>();
           str.add('2');
         str.add('1');
         str.add('0.5'); 
         
         return str;
}

    public String getHoge(){
        return Hoge;
    }

   
      
        
}