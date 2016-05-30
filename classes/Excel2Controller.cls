public with sharing class Excel2Controller {

    public List<Account> account{get;set;}
    public String XmlVer{get;set;}
    public String XmlApp{get;set;}
    /** EXCEL名前 */
    public String excelName{get;set;}
    
    public Excel2Controller(){
        XmlVer = getXmlVer();
        XmlApp = getXmlApp();
        String title = '日本語';
        // ファイル名設定(日時)
        String excelName = EncodingUtil.urlEncode(title, 'UTF-8');
        // excelName = EncodingUtil.urlDecode(title, 'UTF-8');
         this.excelName = EncodingUtil.urlEncode(title,'UTF-8');
         //Apexpages.currentPage().getHeaders().put('Content-Disposition', 'attachment; filename="'+this.excelName+'.xml"');
        // Apexpages.currentPage().getHeaders().put('Content-Disposition', 'attachment; filename*="'+this.excelName+'.xml"');              
    }

   /** xml設定 */  
     public String getXmlVer() {
        
        return '<?xml version="1.0"?>' + '\r\n';   
    }
 
    public String getXmlApp() {
        
        return '<?mso-application progid="Excel.Sheet"?>' + '\r\n';   
    }

    public static String getBrowserName()
    {
        String userAgent = ApexPages.currentPage().getHeaders().get('User-Agent');
        if (userAgent.contains('Firefox'))
            return 'Firefox';
        if (userAgent.contains('Chrome'))
            return 'Chrome';
        return 'other';
    }

}