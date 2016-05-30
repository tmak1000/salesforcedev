/*
For this challenge, you will need to create a class that has a method accepting two strings. 
The method searches for contacts that have a last name matching the first string and
a mailing postal code (API name: MailingPostalCode) matching the second. 
It gets the ID and Name of those contacts and returns them.
The Apex class must be called 'ContactSearch' and be in the public scope.
The Apex class must have a public static method called 'searchForContacts'.
The 'searchForContacts' method must accept two incoming strings as parameters, 
find any contact that has a last name matching the first, and mailing postal code matching the second string.
The method should return a list of Contact records with at least the ID and Name fields.
The return type for 'searchForContacts' must be 'List<Contact>'.

*/
public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName,String postalCode){
        List<Contact> contactList = [SELECT Name FROM Contact WHERE (LastName = :lastName AND MailingPostalCode = :postalCode)];

        return contactList;
    }
}