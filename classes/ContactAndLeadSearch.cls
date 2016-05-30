public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String param){
        List<List<SObject>>  searchList = [FIND :param IN ALL FIELDS  RETURNING Lead(Salutation),Contact(FirstName,LastName)];
        return searchList;
    }
}