public class TestDownloadController{

    

    public String fileName{get; set;}

    public String fileBody{get; set;}

   

    public PageReference init(){

        fileName = '/01510000004ZH3H'; //出力ファイル名設定

        //出力ファイルの内容を設定

        fileBody  = '\n';

        fileBody += '\n';

        return null;

    }

}