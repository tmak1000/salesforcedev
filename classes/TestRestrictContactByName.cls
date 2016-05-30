@isTest
public class TestRestrictContactByName {
    @isTest
    public static void test1(){
        Contact con = New Contact(LastName='Normal');
        insert con;
        try{
        con = New Contact(LastName='INVALIDNAME');
        insert con;
        }catch(Exception e){
            
        }
    }
}