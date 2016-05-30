public with sharing class BoxOAuthInitiateController {
  // 1.接続アプリケーションの「コンシューマ鍵」の値を設定
  public static final String CLIENT_ID = 'net6kfrrp5xvlm8cvyjkdbbhmkap0vwy';
  // 2.接続アプリケーションの「コンシューマの秘密」の値を設定
  public static final String CLIENT_SECRET = 'D8wy5hMS733wzAAcpQeDJiYaWA59QGQe';
  // 3.接続アプリケーションの「コールバックURL」の値を設定
  public static final String CALLBACK_URL = 'https://saitancom-developer-edition.ap0.force.com/apex/BoxOAuthCallback';
  
public PageReference initiate(){

    //'https://login.salesforce.com/services/oauth2/authorize';
  String authorizeUrl = 'https://app.box.com/api/oauth2/authorize';
  authorizeUrl += '?response_type=code';
  authorizeUrl += '&client_id=' + CLIENT_ID;
  authorizeUrl += '&redirect_uri=' + CALLBACK_URL;
  authorizeUrl += '&prompt=login consent';

  PageReference pref = new PageReference(authorizeUrl);
  pref.setRedirect(true);
  return pref;
}
}