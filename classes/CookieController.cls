public class CookieController {
	
    public CookieController(){
        //first cookie data get
        Cookie counter = ApexPages.currentPage().getCookies().get('counter');
    	
		//カウンタが0の場合、初回の場合
        if(counter == null){
            	//名前、代入される値、０以下の値でセッション取得、HTTPSのみ
            counter = new Cookie('counter','1',null,-1,false);
        }else{
            //初回以降
            Integer count = Integer.valueOf(counter.getValue());
            counter = new Cookie('counter',String.valueOf(count+1),null,-1,false);
        }
        //ページにクッキーをセット
        ApexPages.currentPage().setCookies(new Cookie[]{counter});         
    }
     //visualforceで使用されるメソッド
    public String getCount(){
            Cookie counter = ApexPages.currentPage().getCookies().get('counter');
            if(counter == null){
                return '0';
            }
            return counter.getValue();
        }  
    
}