public class CandidateController {
    public transient Candidate__c record {get; set;}
    // commonスタイルシート
    public String commonCss {get;private set;}
    // baseスタイルシート
    public String baseCss {get;private set;}
    // pageスタイルシート
    public String pageCss {get;private set;}
    // functionライブラリ
    public String functionJs {get;private set;}    private final Apexpages.Standardcontroller stdController;
    public String mode {get;set;}
    public String source_info,detail_Name;
    
    public List<SelectOption> recordTypeItems {get; set;}
    public String recordTypeId {get; set;}
    public List<RecordType> recordTypes {get;set;}

    public String getSource_info() 
    {
    return source_info;
    }
    
        public List<SelectOption> getSource_Items()
    {
    List<SelectOption> options3 = new List<SelectOption>();
    
    options3.add(new SelectOption('--Select--','--Select--'));
    options3.add(new SelectOption('test1','test1'));
    options3.add(new SelectOption('test2','test2'));
    return options3;
    }    
        public void setSource_info(String source_info) 
        {
        this.source_info= source_info;
        }
      public CandidateController(
               ApexPages.StandardController controller) {
        stdController = controller;

         // ユーザーエージェント取得
        String userAgent = ApexPages.currentPage().getHeaders().get('User-Agent');

        // スマホ・タブレット端末である場合
        if(userAgent.contains('iPhone')
        || userAgent.contains('iPad')
        || userAgent.contains('Android')) {
            this.commonCss  = 'css/common_sp.css';
            this.baseCss    = 'css/base_sp.css';
            this.pageCss    = 'css/page_sp.css';
            this.functionJs = 'js/function_sp.js';
        } else {
        // それ以外である場合
            this.commonCss  = 'css/common.css';
            this.baseCss    = 'css/base.css';
            this.pageCss    = 'css/page.css';
            this.functionJs = 'js/function.js';
        }        
        


            record = New Candidate__c();
            
            
            this.recordTypes = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Candidate__c' ORDER BY Name ASC LIMIT 50];
            this.recordTypeItems = getRecordTypeItems(recordTypes);
                      
    }
    
    public PageReference init(){
        this.record = New Candidate__c();
        return null;
    }
    
    private List<SelectOption> getRecordTypeItems(List<RecordType> recordTypes) {
        
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--なし--', '--なし--')); 
        
        for (RecordType r : recordTypes) {
            options.add(new SelectOption(String.valueOf(r.Id), r.Name)); 
        }
        
        return options; 
    }
    
    public pagereference redirect(){
            this.record = new Candidate__c();
            PageReference pageRef = ApexPages.currentPage();

            pageRef.setredirect(false);
            return pageRef;
        }
    
    public PageReference entry(){
        insert this.record;
        return null;
    }
}