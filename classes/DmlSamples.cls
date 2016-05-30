public class DmlSamples {
/* This method accepts a collection of lead records and
creates a task for the owner(s) of any leads that were
created as new, that is, not updated as a result of the upsert
operation */
public static List<Database.upsertResult> upsertLeads(List<Lead> leads) {
/* Perform the upsert. In this case the unique identifier for the
insert or update decision is the Salesforce record ID. If the
record ID is null the row will be inserted, otherwise an update
will be attempted. */
List<Database.upsertResult> uResults = Database.upsert(leads,false);
/* This is the list for new tasks that will be inserted when new
leads are created. */
List<Task> tasks = new List<Task>();
for(Database.upsertResult result:uResults) {
if (result.isSuccess() && result.isCreated())
tasks.add(new Task(Subject = 'Follow-up', WhoId = result.getId()));
}
/* If there are tasks to be inserted, insert them */
Database.insert(tasks);
return uResults;
}
}