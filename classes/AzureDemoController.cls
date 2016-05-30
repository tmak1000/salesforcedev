public class AzureDemoController{

//UserInfoカスタムオブジェクトのgetset
public UserInfo__c ui{get;set;}
//UserInfoカスタムオブジェクトのListのgetset
public List<UserInfo__c> lui{get;set;}

    //初期画面で入力する器としてのカスタムオブジェクト作成とgetsメソッドでAzureにあるユーザデータの取得
    public AzureDemoController(){
       try{
         ui = new UserInfo__c();
         //lui = JsonToUserInfo();
         gets();
         }catch(Exception e){
         //getsメソッドで例外のキャッチのメッセージ設定を行う為、ここでの例外は設定しない。
            //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'jsonデータが取得できませんでした。' ));
         }
    }

    //Azureへのデータ送信メソッド
    public PageReference submitAzure(){
        try{
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint('http://fmapitest.cloudapp.net/api/t_userinfo');
       //接続するAzureのＵＲＬをカスタム表示ラベルから取得
        //req.setEndpoint(System.Label.AzureURL);
        //salesforceはデフォルトがＪＳＯＮのためＪＳＯＮを設定。
        req.setHeader('Content-Type', 'application/json');
        //入力したUserInfoをＪｓｏｎへ変換し、HttpのBody部分にセット。
        req.setBody(UserInfoToJson());
        req.setMethod('POST');
        //POSTで送信
        HttpResponse res = h.send(req);
        System.debug('******reqazure*****:'+req.getBody());
        System.debug('******resazure*****:'+res.getBody());
        
        //送信した内容が反映されたAzureのデータを再度読み込み。
        gets();

        }catch(Exception e){
            ApexPages.addMessages(e);
        }
        return null;
    }
    
    public PageReference gets(){
       try{
       //Azureから読み込んだ内容のJsonをカスタムユーザオブジェクトに変換して、コントローラ上のリストにセットする。
        lui = JsonToUserInfo();
              
        }catch(Exception e){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'jsonデータが取得できませんでした。' ));
            return null;
        }
        return null;
    }
    
    
     //AzureDemo画面から入力したデータをJsonに変換して返すメソッド。
    public String UserInfoToJson(){
        JSONGenerator gen = JSON.createGenerator(true);

        gen.writeStartObject();
        gen.writeFieldName('contents');
        gen.writeStartArray();
        gen.writeStartObject();
        gen.writeStringField('UserID',ui.UserID__c);
        gen.writeStringField('LoginPassWord',ui.LoginPassWord__c);
        gen.writeStringField('UserName',ui.UserName__c);
        gen.writeNumberField('Authority',ui.Authority__c);
        gen.writeNumberField('Assignment',ui.Assignment__c);
        gen.writeEndObject();
        gen.writeEndArray();
        gen.writeEndObject();
        String jstring = gen.getAsString();
        System.debug('debugdebu:contetns:'+jstring);
       return jstring;
    }
   
   //Azureから読み込んだJsonデータをUserInfoリスト型へ変換して返すメソッド。
    public List<UserInfo__c> JsonToUserInfo(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        // req.setEndpoint('http://fmapitest.cloudapp.net/api/t_userinfo');
       //接続するAzureのＵＲＬをカスタム表示ラベルから取得
        req.setEndpoint(System.Label.AzureURL);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        System.debug('jsontouserifno**contents**:'+res.getBody());
        JSONParser parser = JSON.createParser(res.getBody());
    
        List<FakeUser> list_user = new List<FakeUser>();
        
        while (parser.nextToken() != null) {
    
        //読み込んだJsonをFakeUser型に変換
        if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
             list_user = (List<FakeUser>)parser.readValueAs(List<FakeUser>.class);
             
        }
        
        
    }
    lui = new List<UserInfo__c>();
    
    //FakeUserリストからUserInfoカスタムオブジェクトリストへデータを代入する。
    
    for(FakeUser fu : list_user){
        UserInfo__c aui = new UserInfo__c();
        aui.UserName__c = fu.UserName;
        aui.UserID__c = fu.UserID;
        aui.LoginPassWord__c = fu.LoginPassWord;
        aui.Authority__c = fu.Authority;
        aui.AuthorityName__c = fu.AuthorityName;
        aui.Assignment__c = fu.Assignment;
        aui.AssignmentName__c = fu.AssignmentName;

        lui.add(aui);
    }
   
    return lui;
   
    }
         
    
   
   //jsonデータをカスタムオブジェクトにそのまま変換せずにJson->FakeUser->UserInfoとデータを変換するために作成。
   public class FakeUser{
        public String UserID;   //test1
        public String LoginPassWord;    //12345678
        public String UserName; //testUser1
        public Integer Authority;   //1
        public String AuthorityName;    //一般
        public Integer Assignment;  //3
        public String AssignmentName;   //システム開発部2部
    }

}