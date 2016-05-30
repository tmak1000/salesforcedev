public class AccountPDFController {

  public AccountPDFController(ApexPages.StandardController controller) {

    Account acc = (Account)controller.getRecord();

    String accNum = acc.AccountNumber;

    //ファイル名を"Account_[取引先番号].pdf"にする
    String fileName = 'Account_' + accNum + 'これは日本語';

    //Apexpages.currentPage().getHeaders().put('content-disposition', 'attachment; filename=' + fileName);
    fileName = EncodingUtil.urlEncode(filename, 'UTF-8');
     Apexpages.currentPage().getHeaders().put('content-disposition', 'attachemnt; filename=' + filename + '.pdf'); 
     Apexpages.currentPage().getHeaders().put('content-disposition', 'attachemnt; filename*=' + filename + '.pdf');           
    

  }

}