public class ImgController {

    public String sheet_name{get;set;}
    public String excelname{get;set;}
    public Blob img{get;set;}

    public ImgController(){
       img = getImg();
       excelname = getxslData();
    }
    
    public void setExcelName(){
        this.excelName += '返金明細書_' + datetime.now().format('yyyy/MM/dd HH:mm:ss');
        img = getImg();
    }
    
    public String getExcelData() {
        setExcelName();
        return '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?>';
    }
    public String getEOF() {
        return '</Workbook>';
    }
    public Blob getImg(){
        List<StaticResource> src = [SELECT Id, Body FROM StaticResource WHERE Name = 'imagesample'];
        String encoded = EncodingUtil.base64Encode(src[0].Body);   
        //encoded = EncodingUtil.base64Decode(encoded);    
        return EncodingUtil.base64Decode('iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAYAAAATx8MeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACSSURBVFhH7dYpDgIBEETRuiMKw/0wJGwhqJFkAmHCCQgJWwbM4Iat4ACIdnzR4rVo9WVpsNiZRsNybxqNlgfTaLw6mkbT9ck0mlVn02i+qU2TUVHMqGrbmEadbs80uj/fplHdtKbR5daaRtfvocmoqIyKyqiojIrKqKiMisqoKOae+vX8N+Ycbh8v06g/KcxS+AOtxGvQCylpngAAAABJRU5ErkJggg==');
    }
    

    
    public String getxslData(){
        return '<?xml version="1.0" ?>\r\n<?mso-application progid="Excel.Sheet"?>';
        }
}