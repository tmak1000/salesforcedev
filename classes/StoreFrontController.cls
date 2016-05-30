public class StoreFrontController {

    List<DisplayMerchandise> products;
    //List<DisplayMerchandise> l = new List<DisplayMerchandise>();
    Map<Id,DisplayMerchandise> shoppingCart = new Map<Id,DisplayMerchandise>();
    //
    public PageReference addToCart(){
       
        
        for(DisplayMerchandise p : products){
                
        system.debug('★★★★★' + p.qtyToBuy + '★★★★★');
        system.debug('★★★★★' + p.preQty + '★★★★★');
        if(0 < p.qtyToBuy){
            if(shoppingCart.containsKey(p.id)){                                             
                    p.qtyToBuy += shoppingCart.get(p.id).preQty;                     
                }
             shoppingCart.put(p.id,p);//整数であった。
             shoppingCart.get(p.id).preQty = shoppingCart.get(p.id).qtyToBuy;
             return null;
           }else{
                //if(shoppingCart.containsKey(p.id)){
                //    p.qtyToBuy = shoppingCart.get(p.id).preQty; //IDが存在する場合、自動でputされる？
                //}
                        system.debug('●●●●●' + p.qtyToBuy + '●●●●●');
        system.debug('●●●●●' + p.preQty + '●●●●●');
                return null;
                //put?
            }
        }

        return null;
    }
    
    public String getCartContents(){
        if(0 == shoppingCart.size()){
            return 'empty';
        }
        String msg = '<ul>\n';
        for(DisplayMerchandise p : shoppingCart.values()){
       
            msg += '<li>';
            msg += p.name + '(' + p.preQty + ')';
            msg += '</li>\n';
            
        }
        msg += '</ul>';
        
        return msg;
    }
    
    
    public List<DisplayMerchandise> getProducts(){
        if(products == null){
            products = new List<DisplayMerchandise>();
            for(Merchandise__c item :  [SELECT Id, Name, Condition__c, Price__c, Quantity__c FROM Merchandise__c]){
               
               products.add(new DisplayMerchandise(item));
                
            }
        }
        for(Integer i = 0;i < products.size();i++){
            if(products.get(i).qtyToBuy < 0 ){
                system.debug('■■■■■' + products.get(i).qtyToBuy + '■■■■■');
                system.debug('■■■■■' + products.get(i).preQty + '■■■■■');
                //products.remove(i);
            }
        }
        return products;
    }
    
    public class DisplayMerchandise {
        private Merchandise__c merchandise;
        
        public DisplayMerchandise(Merchandise__c item){
            this.merchandise = item;
        }
        
        public ID id{//加えて
            get {return merchandise.Id;}
        }
        
        public String name{
            get{ return merchandise.Name;}
        }
        
        public String condition {
            get {return merchandise.Condition__c;}
        }
        
        public Decimal price{
            get {return merchandise.Price__c;}
        }
      
        
        public Boolean inStock{
            get{return (0 < merchandise.Quantity__c);}
        }
        public Integer qtyToBuy {get; set;}
        public Integer preQty {get;set;}//加えて
    }
}