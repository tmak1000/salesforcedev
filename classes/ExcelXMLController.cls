public class ExcelXMLController {

    public String sheet_name{get;set;}
    public String excelname{get;set;}
    public String img{get;set;}
    
    public ExcelXMLController(){
        System.debug('★①'+this.excelName);
        //this.excelName += '返金明細書_';
        this.excelName += '源泉税支払調書_';
       System.debug('★②'+this.excelName);
      // String time = '';
      // time += datetime.now().format('yyyy/MM/dd HH:mm:ss');
       System.debug('★③'+this.excelName);
       
        String encoded = EncodingUtil.urlEncode('返金明細書_', 'UTF-8');
       Apexpages.currentPage().getHeaders().put('content-disposition', 'attachemnt; filename='+encoded + datetime.now().format('yyyy/MM/dd HH:mm:ss')+'.xls');
       img = getImg();
    }
    
    public void setExcelName(){
        this.excelName += '返金明細書_' + datetime.now().format('yyyy/MM/dd HH:mm:ss');
    }
    
    public String getExcelData() {
        setExcelName();
        return '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?>';
    }
    public String getEOF() {
        return '</Workbook>';
    }
    public String getImg(){
        List<StaticResource> src = [SELECT Id, Body FROM StaticResource WHERE Name = 'imagesample'];
        String encoded = EncodingUtil.base64Encode(src[0].Body);       
        return '<image>data:image/png;base64,'+encoded+'</image>';
    }
    
    public String getxslData(){
        return '<?xml version="1.0" encoding="Shift_JIS"?>\r\n<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">';
    }

}