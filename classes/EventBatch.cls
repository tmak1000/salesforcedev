global with sharing class EventBatch implements Database.Batchable<sObject>
{
  private String query;
  
  //コンストラクタ
  global EventBatch(String q){
      query = q;
  }
  
  //データ取得
  global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
  }
  
  //開始
  global void execute(Database.BatchableContext BC, List<sObject> scope){
  
      //バッチの処理を記述
      
  }
  
  //完了
  global void finish(Database.BatchableContext BC)
  {
      //完了後の処理があれば
  }
}