@isTest
private class TestWarehouseUtils {
    //test the constructor
    static testMethod void testClassConstructor(){
        Test.startTest();
        WarehouseUtils utils = new WarehouseUtils(null);
        Test.stopTest();
        
        //util is not null
        System.assert(utils != null);
    }
    
    
	//find near warehouse 20miles
    static testMethod void testFindWarehousesWithinTwentyMiles(){
        //test for close
        String myLat = '37.793731';
        String myLon = '-122.395002';
        //create data
        Warehouse__c closestWarehouse = createClosestTestWarehouse();
        Warehouse__c closeWarehouse = createCloseTestWarehouse();
        Warehouse__c tooFarWarehouse = createTooFarTestWarehouse();
        
        //perform the excution
        Test.startTest();
        List<Warehouse__c> nearbyWarehouses =
            WarehouseUtils.findNearbyWarehouses(myLat, myLon);
        Test.stopTest();
        
        // assert
        
        //expect
        System.assert(nearbyWarehouses.size() == 2);       
        
        //expect specific
        System.assert(nearbyWarehouses[0].Name == closestWarehouse.Name);
        System.assert(nearbyWarehouses[1].Name == closeWarehouse.Name);
        
        // We dont expect too far
        if(0 < nearbyWarehouses.size()){
            for(Warehouse__c wh : nearbyWarehouses){
                System.assert(wh.Name != tooFarWarehouse.Name);
            }
        }
    }
        
    //don't find
    static testMethod void testDontFindWarehousesFurtherThanTwentyMiles(){
        // test for far from here
        String myLat = '48.85837';
		String myLon = '2.294481';
        
        //createData
        Warehouse__c closestWarehouse = createClosestTestWarehouse();
        Warehouse__c closeWarehouse = createCloseTestWarehouse();
        Warehouse__c tooFarWarehouse = createTooFarTestWarehouse();
        //perform
        Test.startTest();
        List<Warehouse__c> nearbyWarehouses =
            WarehouseUtils.findNearbyWarehouses(myLat, myLon);
        Test.stopTest();
        //expect no 
        System.assert(nearbyWarehouses.size() == 0);
        
    }
    
    //create data
    static Warehouse__c createTestWarehouse(String name,Decimal lat,Decimal lon){
        Warehouse__c w = new Warehouse__c(
        	Name = name,
            Location__Latitude__s = lat,
            Location__Longitude__s = lon
        );
        insert w;
        return w;
    }
    
    static Warehouse__c createClosestTestWarehouse(){
        return(createTestWarehouse('Warehouse1',37.7927731, -122.4010922));
    }
    
    static Warehouse__c createCloseTestWarehouse(){
        return(createTestWarehouse('Warehouse2',37.783944, -122.401289));
    }
    
    static Warehouse__c createTooFarTestWarehouse(){
        return(createTestWarehouse('Warehouse3',43.879102, -103.459067));
    }
    
    //test default loc if tha lat or long is invalid
    static testMethod void testFindWarehousesDefaultLocation(){
        //Trigger the default
        String myLat = null;
        String myLon = null;
        
        //create test data
        Warehouse__c closestWarehouse = createClosestTestWarehouse();
        Warehouse__c closeWarehouse = createCloseTestWarehouse();
        Warehouse__c tooFarWarehouse = createTooFarTestWarehouse();
        
        //perform 
        Test.startTest();
        List<Warehouse__c> nearbyWarehouses =
            WarehouseUtils.findNearbyWarehouses(myLat, myLon);
        Test.stopTest();
        
        //make assert
        
        //expect two warehosue
        System.assert(nearbyWarehouses.size() == 2);
        //in order to proximity
        System.assert(nearbyWarehouses[0].Name == closestWarehouse.Name);
        System.assert(nearbyWarehouses[1].Name == closeWarehouse.Name);
        //far away
        if(0 < nearbyWarehouses.size()){
            for(Warehouse__c wh : nearbyWarehouses){
                System.assert(wh.Name != tooFarWarehouse.Name);
            }
        }
    }
    
    
}