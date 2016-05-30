@isTest
private class VisibleSampleClassTest {//後でpublic ,nasiにして試す
    static testmethod void test1(){
        VisibleSampleClass sample = new VisibleSampleClass();
        sample.recordNumber = 100;
        sample.areaCode = '(510)';
        
        VisibleSampleClass.Employee emp = 
            new VisibleSampleClass.Employee('Joe Smith','555-1212');
        
        String s = sample.privateMethod(emp);
        
        System.assert(s.contains('(510)') && s.contains('Joe Smith') &&s.contains('555-1212'));
    }
    
    static testmethod void test2(){
        try{
           	throw new VisibleSampleClass.MyException('Thrown from a test.');
        }catch(VisibleSampleClass.MyException e){
            
        }
    }
    
    static testmethod void test3(){
        VisibleSampleClass sample = new VisibleSampleClass();
        
        sample.publicMethod();
        Integer max = sample.maxRecords;
        System.assertEquals(1001, max);
    }    
}