public with sharing class BoxOAuthCallbackController {

  // OAuthModel
  public OAuthModel oauthModel {get; set;}
  // Salesforceからのレスポンスを保持する
  public String resBody {get; set;}

  // Salesforceから戻されるアクセストークンなどの情報を保持する内部クラス
  public class OAuthModel {
    public String id {get; set;}
    public String issued_at {get; set;}
    public String refresh_token {get; set;}
    public String instance_url {get; set;}
    public String signature {get; set;}
    public String access_token {get; set;}
  }

  //コンストラクタ  
  public BoxOAuthCallbackController(){

    //　認証がエラーだった場合のメッセージ取得
    String error = ApexPages.currentPage().getParameters().get('error');
    String errorDescription = ApexPages.currentPage().getParameters().get('error_description');

    // エラーが無ければ。認証コードからトークンを取得
    if(String.isEmpty(error)){
      requestToken();
    }else{
      ApexPages.addMessage(
        new ApexPages.Message(
          ApexPages.Severity.ERROR, 'error:' + error + ' description:' + errorDescription
        )
      );
    }
  }

  // トークン取得
  private PageReference requestToken(){
    // アクセストークンを取得するためのリクエストボディを組立て
    String reqBody = '';
    reqBody += 'code=' + EncodingUtil.urlEncode(ApexPages.currentPage().getParameters().get('code'), 'UTF-8');
    reqBody += '&grant_type=' + EncodingUtil.urlEncode('authorization_code', 'UTF-8');
    reqBody += '&client_id=' + EncodingUtil.urlEncode(BoxOAuthInitiateController.CLIENT_ID, 'UTF-8');
    reqBody += '&client_secret=' + EncodingUtil.urlEncode(BoxOAuthInitiateController.CLIENT_SECRET, 'UTF-8');
    reqBody += '&redirect_uri=' + EncodingUtil.urlEncode(BoxOAuthInitiateController.CALLBACK_URL, 'UTF-8');
   
    // Setup->Security->Remote site settings. 
    //    endpoint の　設定もしておくこと
    String authorizeUrl = 'https://app.box.com/api/oauth2/token';
      // Calloutでアクセストークンを要求
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(authorizeUrl);
    req.setMethod('POST');
    req.setBody(reqBody);
    System.debug('★req:'+req);
    HttpResponse res = http.send(req);
    System.debug('★res:'+res);
    this.resBody = res.getBody();
   
    // Salesforceからのレスポンス（JSON）を解析し、OAuthModelに設定
    JSONParser parser = JSON.createParser(resBody);
    oauthModel = (OAuthModel)parser.readValueAs(BoxOAuthCallbackController.OAuthModel.class);
   
    // Salesforceからのレスポンスをデバッグ用にメッセージに設定
    ApexPages.addMessage(
      new ApexPages.Message(
        ApexPages.Severity.INFO, 'Http Status:ByAccessToken' + res.getStatusCode() + ' ' + res.getStatus()
      )
    );
    return null;
  }

  // リフレッシュトークンからアクセストークン再取得
  private PageReference refreshToken(){

    // アクセストークンを取得するためのリクエストボディを組立て
    String reqBody = '';
    reqBody += '&grant_type=' + EncodingUtil.urlEncode('refresh_token', 'UTF-8');
    reqBody += '&refresh_token=' + EncodingUtil.urlEncode('refresh_token', 'UTF-8');  
    reqBody += '&client_id=' + EncodingUtil.urlEncode(BoxOAuthInitiateController.CLIENT_ID, 'UTF-8');
    reqBody += '&client_secret=' + EncodingUtil.urlEncode(BoxOAuthInitiateController.CLIENT_SECRET, 'UTF-8');
   
    // Setup->Security->Remote site settings. 
    //    endpoint = https://login.salesforce.com/services/oauth2/token の設定もしておくこと
    //String authorizeUrl = 'https://login.salesforce.com/services/oauth2/token';
    String authorizeUrl = 'https://app.box.com/api/oauth2/token';
      // Calloutでアクセストークンを要求
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(authorizeUrl);
    req.setMethod('POST');
    req.setBody(reqBody);
    System.debug('★req:'+req);
    HttpResponse res = http.send(req);
    System.debug('★res:'+res);

    // Statusの確認
    if(res.getStatusCode() == 401){
      // リフレッシュトークンの有効期限が切れている場合、
      // アクセストークンを取得
       requestToken();
    }

    this.resBody = res.getBody();
   
    // Salesforceからのレスポンス（JSON）を解析し、OAuthModelに設定
    JSONParser parser = JSON.createParser(resBody);
    oauthModel = (OAuthModel)parser.readValueAs(BoxOAuthCallbackController.OAuthModel.class);
   
    // Salesforceからのレスポンスをデバッグ用にメッセージに設定
    ApexPages.addMessage(
      new ApexPages.Message(
        ApexPages.Severity.INFO, 'Http Status:byRefreshCode' + res.getStatusCode() + ' ' + res.getStatus()
      )
    );

    return null;
  }


  // API テストメソッド  
  public PageReference apicall(){
    refreshToken();
    // RestAPIのURLを組立て
    
    String restApiUrl = ' https://api.box.com/2.0/';
    /*
    // Callout
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    // ※Headerにアクセストークンを設定する    
    req.setHeader('Authorization', 'Bearer ' + oauthModel.access_token);

    // api　設定
    req.setEndpoint(restApiUrl+'folders/0');
    req.setMethod('GET');

    // 送信
    HttpResponse res = http.send(req);
   
    
    // Statusの確認
    if(res.getStatusCode() == 401){
      // アクセストークンの有効期限が切れている場合、
      // リフレッシュトークンを使ってアクセストークンを取得
       refreshToken();
    } */
    //this.resBody = res.getBody();   // レスポンスを解析し取引先のインスタンス生成とリストに追加
    //JSONParser parser = JSON.createParser(res.getBody());
        Http http = new Http();
    HttpRequest req = new HttpRequest();
    // ※Headerにアクセストークンを設定する    
    req.setHeader('Authorization', 'Bearer ' + oauthModel.refresh_token);

    // api　設定
    req.setEndpoint(restApiUrl+'folders/0');
    req.setMethod('GET');

    // 送信
    HttpResponse res = http.send(req);
    return null;
  }   
}