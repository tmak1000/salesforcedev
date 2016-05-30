public with sharing class Yoyaku25Controller{
    public String id{get;set;}
    
    public LoginInfo__c li {get;private set;}
    
    public List<FacilityInfo__c> fi {get;private set;}
    

     
    //予約数
    public List<Integer> reserveds{get;set;}
 
    //現在のページのIDを取得して、空白なら新しくレコードを作る。その際に有効フラグはtrueにすること
    public Yoyaku25Controller(){
        String id = ApexPages.currentPage().getParameters().get('id');
       try{
        li = [SELECT 
                 LoginNumber__c,
                 LoginName__c,
                 MailAddress__c,
                 LoginID__c,
                 LoginPhone__c,
                 Bikou__c,
                 Option1__c,
                 Option2__c,
                 InputNumber__c,
                 FacilityID__c
                 FROM LoginInfo__c
                 //URLのidの乱数から登録されているIDと照合
                 WHERE LoginID__c = :id
                ];
                
                fi =   [SELECT 
                       FacilityID__c,
                       EventDate__c,
                       FacilityName__c,
                       FacilityAddress__c,
                       EventTime__c,
                       URL__c,
                       Capacity__c
                       FROM FacilityInfo__c   
                              ];
         }catch(Exception e){
              // ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'URLのIDが間違っています。' ));                               
          }
          
   }
    
           //現在のレコードIDを保持して登録画面へ遷移する。成功なら詳細画面EmpInfoDispへ
        public PageReference search(){
         String id = ApexPages.currentPage().getParameters().get('id');
             PageReference nextPage = null;
            try{    
                    //入力された無いようから採択番号を作成して、レコードのデータと比較suru..
                    
                     
                    String selectedNumber = li.Option1__c+'-'+li.Option2__c+'-'+li.InputNumber__c;
                    //以下のif文は採択番号が正しいかの処理
                    if(selectedNumber == li.LoginNumber__c){
             
                     //idがnullなら初期登録画面
                         if(li.FacilityID__c != null){
                              nextPage = Page.Yoyaku25Resisted;
                            }else{
                              nextPage = Page.Yoyaku25Reserve;
                              nextPage.getParameters().put('id', id);
                    }
                  
                    }else{
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '正しい採択番号を入力して下さい。' ));       
                    }
                
            }catch(Exception e){
               //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'エラーが発生しました。URLを確認の上、申し訳ありませんが、もう一度やり直してください。' ));        
            }
                  
             return nextPage;
        } 
        
        //登録処理　IDがあるなら完了画面、無いなら登録をUpdateで行う画面へ遷移。
         public PageReference resist(){
             //idを取得
             String id = ApexPages.currentPage().getParameters().get('id');
             try {     
                    update(li);
                 //必須入力が無いときに入力規則エラーを戻す。   
                } catch(System.DMLException e) {
                   ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'データの登録に失敗しました。申し訳ありませんが、やり直してください。' ));
                   return null;
                }catch(Exception e){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '予期せぬ例外が発生しました。申し訳ありませんが、はじめからやり直して下さい。' ));
                     return null;  
         }    

             PageReference nextPage = Page.Yoyaku25Finished;
             nextPage.getParameters().put('id', id);
             return nextPage;
        }
 
        
        //現在はレコードのIDを保持して登録画面へ戻るだけ//後にかわるかも
        public PageReference back(){
             PageReference nextPage = Page.Yoyaku25Search;
             nextPage.getParameters().put('id',id);
             return nextPage;
        }
        
        
        //ログイン情報を取得する。
         public LoginINfo__c getLoginInfo(){     
                 return li;    
        }
        
        //施設情報を取得する。
        public List<FacilityInfo__c> getFacilityInfos(){
            return fi;
        }
     
    // 
   public List<SelectOption> getOptions(){
    List<SelectOption> options = new List<SelectOption>();
    options.add(new SelectOption('２５創業','２５創業'));
    options.add(new SelectOption('２５第二','２５第二'));
    return options;
    } 
    
    public List<SelectOption> getOptions2(){
    List<SelectOption> options = new List<SelectOption>();
    options.add(new SelectOption('１','１'));
    options.add(new SelectOption('２','２'));
    return options;
    }      
        
        //予約する日程を出す。
        public List<SelectOption> getReserves() {
    List<SelectOption> reserves = new List<SelectOption>();
      fi =   [SELECT 
                       FacilityID__c,
                       //EventDate__c,
                       FacilityName__c,
                       FacilityAddress__c,
                       EventTime__c,
                       URL__c,
                       Capacity__c
                       FROM FacilityInfo__c   
                              ];
    for(FacilityInfo__c f : fi){
        //reserves.add(new SelectOption(String.valueOf(f.FacilityID__c),String.valueOf(f.EventDate__c)+String.valueOf(f.EventTime__c)));
    }
    return reserves;
   }

  
        
}