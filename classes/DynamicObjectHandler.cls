public class DynamicObjectHandler {

    // This class acts as a controller for the DynamicObjectViewer component
    
    private String objType;
    private List<String> accessibleFields;

    public sObject obj { 
        get; 
        set {
              setObjectType(value);
              discoverAccessibleFields(value);
              obj = reloadObjectWithAllFieldData();
        } 
    }
    
    // The sObject type as a string
    public String getObjectType() {
          return(this.objType);
    }
    public String setObjectType(sObject newObj) {
        this.objType = newObj.getSObjectType().getDescribe().getName();
        return(this.objType);
    }
    
    // List of accessible fields on the sObject
    public List<String> getAccessibleFields() {
        return(this.accessibleFields);
    }
    
    private void discoverAccessibleFields(sObject newObj) {
        this.accessibleFields = new List<String>();
        Map<String, Schema.SobjectField> fields = 
            newObj.getSObjectType().getDescribe().fields.getMap();
        for (String s : fields.keySet()) {
            if ((s != 'Name') && (fields.get(s).getDescribe().isAccessible())) {
                this.accessibleFields.add(s);
            }
        }
    }
    
    private sObject reloadObjectWithAllFieldData() {
        String qid = ApexPages.currentPage().getParameters().get('id');
        String theQuery = 'SELECT ' + joinList(getAccessibleFields(), ', ') + 
                          ' FROM ' + getObjectType() + 
                          ' WHERE Id = :qid';
                          System.debug('@@@'+getObjectType());
        return(Database.query(theQuery));       
    }
    
    // Join an Apex List of fields into a SELECT fields list string
    private static String joinList(List<String> theList, String separator) {

        if (theList == null)   { return null; }
        if (separator == null) { separator = ''; }

        String joined = '';
        Boolean firstItem = true;
        for (String item : theList) {
            if(null != item) {
                if(firstItem){ firstItem = false; }
                else { joined += separator; }
                joined += item;
            }
        }
        return joined;
    }
}