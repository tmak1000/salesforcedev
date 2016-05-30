public class VisibleSampleClass {
	@TestVisible private Integer recordNumber = 0;
    @TestVisible private String areaCode = '(415)';
    
    public Integer maxRecords = 1000;
    
    @TestVisible class Employee {
        String fullName;
        String phone;
        
        @TestVisible Employee(String s, String ph){//ここで@TestVisibleにする意味は
            fullName = s;
            phone = ph;
        }
    }
    
    @TestVisible private String privateMethod(Employee e){
        System.debug('I am private.');
        recordNumber++;
        String phone = areaCode + ' ' + e.phone;
        String s = e.fullName + '\'s phone number is ' + phone;
        System.debug(s);
        return s;
    }
    
    public void publicMethod(){
        maxRecords++;
        System.debug('I am public.');
    }
    
    @TestVisible private class MyException extends Exception{}
}