public class SOQLController {
    public String name{
        get {return name;}
        set { name = value;}
    }
    public PageReference query(){
        String qryString = 'SELECT Id FROM Contact WHERE ' +
            '(IsDeleted = false and Name like \'%'+ name + '%\' )';
        //queryResult = Database.query(qryString);
        // comment
       return null;
    }
}