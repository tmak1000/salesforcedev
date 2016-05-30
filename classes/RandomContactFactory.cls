public class RandomContactFactory {

    
    public static List<Contact> generateRandomContacts(Integer param1,String param2){
        List<Contact> conList = New List<Contact>();
        for(Integer i = 1;i <= param1;i++){
            conList.add(New Contact(FirstName='Test  '+i,LastName=param2));
        }
        return conList;
    }
    
}