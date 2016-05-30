public with sharing class ExportToExcelMultipleSheets {
public List<Account> accountList{get;set;}
public List<Contact> contactList{get;set;}
public String img{get;set;}
public String xlsHeader {
        get {
            String strHeader = '';
            strHeader += '<?xml version="1.0"?>';
            strHeader += '<?mso-application progid="Excel.Sheet"?>';
            return strHeader;
        }
    }
 
public ExportToExcelMultipleSheets(){
    accountList = [select id, name from Account LIMIT 50];
    contactList = [Select id, name, account.name, email from Contact LIMIT 50];
    String img = getImg();
}
 
public Pagereference exportAll(){
    return new Pagereference('/apex/exportAll');
 
 
}

public String getImg(){
        List<StaticResource> src = [SELECT Id, Body FROM StaticResource WHERE Name = 'imagesample'];
        String encoded = EncodingUtil.base64Encode(src[0].Body);   
        //Blob blo = EncodingUtil.base64Decode(encoded);    
        //return EncodingUtil.base64Decode(encoded);
        return encoded;
    }
 
}