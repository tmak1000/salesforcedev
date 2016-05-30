global with sharing class WarehouseUtils {
    public WarehouseUtils(ApexPages.StandardSetController controller){
        
    }
    //Find wahahouse ~ a geolocation
    @RemoteAction
    global static List<Warehouse__c> findNearbyWarehouses(String lat,String lon){
        // Init list
                List<Warehouse__c> results = new List<Warehouse__c>();
        
        //(If geoloc param are invalid)null bug fix
        if(String.isBlank(lat) || String.isBlank(lon)){
            lat = '37.793731';
            lon = '-122.395002';

        }
        
        //implements  
        String queryString =
            'SELECT Id,Name,Location__Longitude__s,Location__Latitude__s, ' +
                'Street_Address__c, Phone__c,City__c ' +
            'FROM Warehouse__c ' +
            'WHERE DISTANCE(Location__c,GEOLOCATION('+lat+','+lon+'),\'mi\') < 20' +
            'ORDER BY DISTANCE(Location__c,GEOLOCATION('+lat+','+lon+'),\'mi\')' +
            'LIMIT 10';
                results = database.Query(queryString);
        //return 
        return(results);
    }
   
}