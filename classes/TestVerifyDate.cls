@isTest
public class TestVerifyDate {
    @isTest static void mytest1(){
        Date date1 = Date.today();
        Date date2 = Date.newInstance(date1.year(), date1.month(),1);
        //assertEquals(VerifyDate.CheckDates)
        VerifyDate.CheckDates(date1,date2);
    }
    
    @isTest static void mytest2(){
        Date date1 = Date.today();
        Date date2 = date1.addDays(31);
        //assertEquals(VerifyDate.CheckDates)
        VerifyDate.CheckDates(date2,date1);
    }    
}