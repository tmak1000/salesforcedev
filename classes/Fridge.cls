public class Fridge implements KitchenUtility{
	private String modelNumber;
    private Integer numberInStock;
	public static final Integer stockThreeshold = 5;    
    public Fridge(){
        modelNumber = 'XX-XX';
        numberInStock = 0;
    }
    
    public Fridge(String theModelNumber , Integer theNumberInStock){
        modelNumber = theModelNumber;
        numberInStock = theNumberInStock;
    }
    
    public Integer ecoRating{
        get {return ecoRating;}
        
        set {ecoRating = value; if (ecoRating < 0) ecoRating = 0;}
    }
    
    public void setModelNumber(String theModelNumber){
        modelNumber = theModelNumber;
    }
	
    public String getModelNumber(){
        return modelNumber;
    }
    
 	public Integer getnumberInStock(){
        return numberInStock;
    }
	    
    
    public void updateStock(Integer justSold){
        numberInStock = numberInStock - justSold;
    }
    
    public static void toDebug(Fridge aFridge){
        System.debug('ModelNumber = ' + aFridge.getModelNumber());
        System.debug('Number in Stock = ' + aFridge.getnumberInStock());
    }
    
}