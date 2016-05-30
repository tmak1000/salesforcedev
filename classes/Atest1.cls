public class Atest1{

  
    public String sk{get;set;} //visualforceから入力された文字列
    public String tk{get;set;}//xmlのBodyを入れる変数
    public List<String> gk{get;set;}//xmlをリスト化するためのもの。
    public Integer i{get;set;}//ちゃんとif文に入れているかをチェックするための変数
//@future(callout=true)

    public void calloutHttpAccess(){
           
              
        HttpRequest req = new HttpRequest(); 
         req.setEndpoint('http://zip.cgis.biz/xml/zip.php?zn=' + sk);
         req.setMethod('GET'); 
         Http h = new Http(); 
         HttpResponse res = h.send(req);
          tk = res.getBody();
          
          
          XmlStreamReader vk = res.getXmlStreamReader();
          gk = new List<String>();//初期化
        i = 0; //初期化
        while(vk.hasNext()){
             
              if (vk.getEventType() == XmlTag.END_ELEMENT) {
                    break;
                } else if(vk.getEventType() == XmlTag.CHARACTERS) {
                    gk.add(vk.getText());
                    i++;
                    
                }
              
              vk.next();
          }
         
          
          
         return; 
    } 
    
}