public with sharing class BoxUploadBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    public Boolean afterChecked {get; set;}
    private Integer recordCount {get; set;}
    private Id targetId {get;set;}
    private String viewApiToken {get;set;}
    
    public BoxUploadBatch(Boolean checked,Id targetId,String tokenId) {
        this.afterChecked = checked;
        this.targetId = targetId;
        this.viewApiToken = tokenId;
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query  = 'SELECT id, Body FROM Attachment WHERE id = '+this.targetId;
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<Attachment> scope) {
        for (Attachment atch : scope) {
 
        HttpRequest req = new HttpRequest();
        String tokenKey = 'Input Your Token';
        String boundary = 'boundary';
         
        req.setHeader('Authorization', 'Token ' + ' net6kfrrp5xvlm8cvyjkdbbhmkap0vwy');
        req.setHeader('Content-Type','multipart/form-data; boundary=' + boundary);
        req.setMethod('POST');
        req.setEndpoint('https://upload.box.com/api/2.0/files/content');
         
        String body = '--'+boundary+'\r\nContent-Disposition: form-data; name="file"; filename="hoge.pdf";\r\nContent-Type: application/pdf\r\nContent-Transfer-Encoding: base64\r\n\r\n' + 
        EncodingUtil.base64Encode(atch.Body) + '\r\n--' + boundary + '--';
         
        req.setBody(body);
        req.setTimeout(120000);
         
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        }
        update scope;
    }
    
    public void finish(Database.BatchableContext BC) {

    }
}