public class Util {
    @future
    public static void insertUserWithRole(
        String uname,String al,String em,String lname){
            Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
            UserRole r = [SELECT Id FROM UserRole WHERE Name = 'COO'];
            
            User u = new User(alias = al,email = em,
                             emailencodingkey = 'UTF-8',lastname=lname,
                             languagelocalekey='en_US',
                             localesidkey='en_US',profileid=p.Id,userroleid=r.id,
                             timezonesidkey='America/Los_Angels',
                             username=uname);
            insert u;
        }
    
    @future
    public static void deleteGroup(String grNameSet){
        List<Group> grList =
            [SELECT Id,Name FROM Group WHERE Name = :grNameSet];
        if(grList.size() > 0){
            //delete grList[0];
        }
    }
}