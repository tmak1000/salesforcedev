public class Toaster implements KitchenUtility{
    private String modelNumber;
    
    public void setModelNumber(String num){
        this.modelNumber = num;
    }
    
    public String getModelNumber(){
       return 'T'+modelNumber;
    }
}