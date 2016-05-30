public class AccountData{
    public List<Account> accList{get;set;}
    public Integer excelRowCnt {get;set;}
    public String img{get;set;}
    public String excelname{get;set;}

    public AccountData(){
        accList = [Select Name,Type,SLA__c from Account];
        excelRowCnt = 4 + accList.size();
        img = getImg();
        // commment!
        //by cloud9
        System.debug('');

    }

    public String getImg(){
        List<StaticResource> src = [SELECT Id, Body FROM StaticResource WHERE Name = 'imagesample'];
        String encoded = EncodingUtil.base64Encode(src[0].Body);
        return encoded;
    }
        public void setExcelName(){
        this.excelName += '返金明細書_' + datetime.now().format('yyyy/MM/dd HH:mm:ss');
    }

    public String getExcelData() {
        setExcelName();
        return '<?xml version="1.0"?>';
    }
}