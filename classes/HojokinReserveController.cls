public with sharing class HojokinReserveController {
    //乱数のIDを保存、遷移ごとに渡していく
    public String id{get;set;}

    //ログインしているユーザ単独の情報
    public LoginInfo__c li{get;set;}
    //登録されている施設情報のリスト
    public List<FacilityInfo__c> filist{get;set;}
    
    //残枠数を加えた施設情報のリスト
    public List<CustomFacilityInfo> cfilist{get;set;}
    
    //分類
    public String classification{get;set;}
    
    //募集回
    public String wantedtime{get;set;}
    
    //予約数
    public List<Integer> reserveds{get;set;}
 
    //正式なユーザーか
    public Boolean isUser{get;set;}
 
    
    public  HojokinReserveController(){
        id = ApexPages.currentPage().getParameters().get('id');
        try{
                   
           
           li = [SELECT 
                 LoginNumber__c,
                 LoginName__c,
                 MailAddress__c,
                 LoginID__c,
                 LoginPhone__c,
                 Bikou__c,
                 FacilityID__c
                 FROM LoginInfo__c
                 //URLのidの乱数から登録されているIDと照合
                 WHERE LoginID__c = :ApexPages.currentPage().getParameters().get('id')
                ];
                      //登録されている施設情報全てをリストに取得
                   filist = [SELECT 
                                  FacilityID__c,
                                  //EventDate__c,
                                  FacilityName__c,
                                  FacilityAddress__c,
                                  //EventTime__c,
                                  URL__c,
                                  Capacity__c
                                  FROM FacilityInfo__c   
                              ];
                               

            
            //正式にユーザーである。
            isUser = true;         

          

        }catch(Exception e){
        //idからの取得に失敗したら例外処理
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'ＵＲＬを再確認してください。データを取得できません。' ));
          //正式なユーザで無いフラグ。
          isUser = false;
       }          
    }
    
    public PageReference search(){
       PageReference nextPage = null;      
 
                //施設IDがすでにあるなら完了画面
                 if(li.FacilityID__c == null){
                     
                      //各施設情報の残り枠数を計算するために、コンストラクタを使用。
                       List<CustomFacilityInfo> cfilist =  new List<CustomFacilityInfo>();         
                         for(FacilityInfo__c f : filist){
                             cfilist.add(new CustomFacilityInfo(f));
                         }
                     nextPage = Page.HojokinReserve;
                     nextPage.getParameters().put('id',id);
                     return nextPage;             
                 }else{
                 //空白ならば予約画面
                      nextPage = Page.HojokinResisted;                                        
             //乱数によるIDを遷移先でも特定に使用する。
             return nextPage;
    }
    }
    
    public PageReference resist(){
        PageReference nextPage = null;

            update(li);
            nextPage = Page.HojokinResisted;
                     nextPage.getParameters().put('id',id);
                     return nextPage; 
  }  

    
    
   public class CustomFacilityInfo{
       
       //残存数と日本語での日程をコントローラで追加する。ために作成
       private FacilityInfo__c fyi;
       
       
       //表示する残枠数
       //public String output{get;set;} 
       
       //コンストラクタで作った施設の残り枠数を設定する。
       public CustomFacilityInfo(FacilityInfo__c fi){
           this.fyi = fi;
           
           //List<AggregateResult> reserved = [SELECT COUNT(ID) cnt FROM LoginInfo__c WHERE FacilityID__c  = :fyi.FacilityID__c];
          // output = 'test';// String.valueOf(Integer.valueOf(fyi.Capacity__c) - Integer.valueOf(reserved[0].get('cnt'))+ '/'+fyi.Capacity__c); 
        
       } 
       
       public String FacilityName{
            get { return fyi.FacilityName__c; }
        }
             
       
   }
    
    
   public List<SelectOption> getOptions(){
    List<SelectOption> options = new List<SelectOption>();
    options.add(new SelectOption('25創業','25創業'));
    options.add(new SelectOption('25第二','25第二'));
    return options;
    }
    
    public List<SelectOption> getReserves() {
    filist = [SELECT 
                                  FacilityID__c,
                                 // EventDate__c,
                                  FacilityName__c,
                                  FacilityAddress__c,
                                 // EventTime__c,
                                  URL__c,
                                  Capacity__c
                                  FROM FacilityInfo__c   
                              ];    List<SelectOption> reserves = new List<SelectOption>();
    for(FacilityInfo__c f : filist){
       // reserves.add(new SelectOption(String.valueOf(f.FacilityID__c),String.valueOf(f.EventDate__c)+String.valueOf(f.EventTime__c)));
    }
    return reserves;
   }
   
   public List<CustomFacilityInfo> getcfilist() {
        
            cfilist = new List<CustomFacilityInfo>();
            for(FacilityInfo__c f : filist){                
                cfilist.add(new CustomFacilityInfo(f));
            }
        
    return cfilist;
    }

    
    
}