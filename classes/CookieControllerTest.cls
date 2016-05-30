@isTest
private class CookieControllerTest {

    static testMethod void testCounter(){
        
        //first access
        CookieController ccl = new CookieController();
        System.assert(ccl.getCount() == '1');
    
    	//after first
    	ccl = new CookieController();
        System.assert(ccl.getCount() == '2');
    }
    
}