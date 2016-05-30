public class CandidateDetails {

    public Candidate__c merch { get; set; }
    
    public CandidateDetails() {
        this.merch = getCandidate();
    }

    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Candidate__c.FieldSets.test1.getFields();
    }

    private Candidate__c getCandidate() {
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id, Name FROM Candidate__c LIMIT 1';
        return Database.query(query);
    }
}