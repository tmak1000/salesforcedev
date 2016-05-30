public class EmpRegistController{
    public EmpInfo__c empinfo {get;private set;}
 
    //現在のページのIDを取得して、空白なら新しくレコードを作る。その際に有効フラグはtrueにすること
    public EmpRegistController(){
        Id id = ApexPages.currentPage().getParameters().get('id');
        empinfo = (id == null) ? new EmpInfo__c( Effective__c = True)  :
        [SELECT EmpID__c,LastName__c,FirstName__c ,Abbreviation__c,Post__c,Sex__c,RegistedYear__c,Effective__c FROM EmpInfo__c WHERE Id = :id];
        }
        
        //登録処理　IDがあるなら更新、無いなら登録をUpsertで行う。
         public PageReference save(){
             try {     
             
                    //性別の入力が無い場合、例外を発生させる。                            
                    if(empinfo.Sex__c != '男性' && empinfo.Sex__c != '女性'){//性別が未入力ならば例外発                      
                       throw new MyException('性別が未入力です。');                                  
                    }   
                                             
                    upsert(empinfo);
                 //必須入力が無いときに入力規則エラーを戻す。   
                } catch(System.DMLException e) {
                   ApexPages.addMessages(e);
                   return null;
                }catch(Exception e){
                    ApexPages.addMessages(e);
                     return null;  
                }    

             PageReference nextPage = Page.EmpInfoDisp;
             nextPage.getParameters().put('id', empinfo.id);

             nextPage.setRedirect(true);
             return nextPage;
        }
        //現在のレコードIDを保持して登録画面へ遷移する。成功なら詳細画面EmpInfoDispへ
        public PageReference moveEdit(){
             PageReference nextPage = null;
             //idがnullなら初期登録画面
             if(empinfo.id == null){
                  nextPage = Page.EmpRegist;
             }else{
                  nextPage = Page.EmpRegist;
                  nextPage.getParameters().put('id', empinfo.id);
                  }
             nextPage.setRedirect(true);
             return nextPage;
        } 
        //現在はレコードのIDを保持して登録画面へ戻るだけ//後にかわるかも
        public PageReference back(){
             PageReference nextPage = Page.EmpInfoDisp;
             nextPage.getParameters().put('id', empinfo.id);
             nextPage.setRedirect(true);
             return nextPage;
        }
        
        public PageReference Ichiran(){
            PageReference nextPage = Page.EmpIchiran;
             nextPage.setRedirect(true);
             return nextPage;
        }
    
        //社員情報を取得する
         public EmpInfo__c getEmpInfo(){     
                 return empinfo;    
        }
        
       
        
}