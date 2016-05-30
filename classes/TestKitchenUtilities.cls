@isTest
public class TestKitchenUtilities {
	
    @isTest static void Fridgedefault(){
        Fridge f = new Fridge();
        String modelnum = f.getModelNumber();
        Integer numstock = f.getnumberInStock();
        System.assertEquals('XX-XX', modelnum);
        System.assertEquals(0,numstock);
    }
    
    @isTest static void FridgeConst(){
        String num = '11-11';
        Integer stock = 100;
        Fridge f = new Fridge(num,stock);
         String modelnum = f.getModelNumber();
        Integer numstock = f.getnumberInStock();
        System.assertEquals(num, modelnum);
        System.assertEquals(stock,numstock);
    }
    
    @isTest static void FridgeSetModelNum(){
        Fridge f = new Fridge();
        String num = '22-22';
        f.setModelNumber(num);
        String actual = f.getModelNumber();
        System.assertEquals(num, actual);
    }
    
    @isTest static void FridgeecoRating(){
        Fridge f = new Fridge();
        f.ecoRating = 888;
        Integer eco = f.ecoRating;
        System.assertEquals(888, eco);
    }
    
    @isTest static void FridgeUpdateStock(){
        Fridge f = new Fridge('33-33',100);
        f.updateStock(20);
        Integer stock = f.getnumberInStock();
        System.assertEquals(80, stock);
    }
    
    @isTest static void ToastergetModelNum(){
        Toaster t = new Toaster();
        t.setModelNumber('44-44');
        String actual = t.getModelNumber();
        System.assertEquals('T'+'44-44', actual);
    }
}