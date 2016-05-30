public with sharing class OAuthInitiateController {
  // 1.接続アプリケーションの「コンシューマ鍵」の値を設定
  //public static final String CLIENT_ID = '3MVG9I1kFE5Iul2CkFP4mhMX5KvXYM34Hju3dqDe4ukn5d9Av5k2CBobQPqgjNEA2rAchaOuG4K2pmi6hIbmY';
  // 2.接続アプリケーションの「コンシューマの秘密」の値を設定
  //public static final String CLIENT_SECRET = '5817832932114248752';
  // 3.接続アプリケーションの「コールバックURL」の値を設定
  //public static final String CALLBACK_URL = 'https://saitancom-developer-edition.ap0.force.com/apex/OAuthCallback';
  // 1.接続アプリケーションの「コンシューマ鍵」の値を設定
  public static final String CLIENT_ID = 'net6kfrrp5xvlm8cvyjkdbbhmkap0vwy';
  // 2.接続アプリケーションの「コンシューマの秘密」の値を設定
  public static final String CLIENT_SECRET = 'D8wy5hMS733wzAAcpQeDJiYaWA59QGQe';
  // 3.接続アプリケーションの「コールバックURL」の値を設定
  public static final String CALLBACK_URL = 'https://saitancom-developer-edition.ap0.force.com/apex/OAuthCallback'; 
  
public PageReference initiate(){
  String authorizeUrl = 
   // 'https://login.salesforce.com/services/oauth2/authorize';
   'https://account.box.com/api/oauth2/authorize';
  authorizeUrl += '?response_type=code';
  authorizeUrl += '&client_id=' + CLIENT_ID;
  authorizeUrl += '&redirect_uri=' + CALLBACK_URL;
  //authorizeUrl += '&prompt=login consent';
  authorizeUrl += '&prompt=none';
 System.debug('★authorizeUrl:'+authorizeUrl);
  PageReference pref = new PageReference(authorizeUrl);
  pref.setRedirect(true);
  return pref;
}
  
  
  
}