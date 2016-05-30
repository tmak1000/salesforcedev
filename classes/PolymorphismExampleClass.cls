public class PolymorphismExampleClass {
/*
    public static void processUser(User theUser){
        System.debug('Processed User');
    }
    
    public static void processGroup(Group theGroup){
        System.debug('Processed Group');
    }
    
    public static void processOwnersOfMerchandise(){
        List<Merchandise__c> merchandiesList = [SELECT TYPEOF Owner 
                                                WHEN User THEN LastName
                                                When Group THEN Email END
                                                FROM Merchandise__c
                                               ];
        for(Merchandise__c merch : merchandiseList){
            if(merch.Owner instanceof User){
                User userOwner = merch.Owner;
                processUser(userOwner);
            }else if{
                Group groupOwner = merch.Owner;
                processGroup(groupOwner);
            }
        }
        
        
    }
    
    */
    
    
}