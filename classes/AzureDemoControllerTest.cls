@isTest
private class AzureDemoControllerTest {

   @isTest static void test1() {

    System.Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
    AzureDemoController adc = new  AzureDemoController();
    
   // HttpResponse res = CalloutClass.getInfoFromExternalService();
    
    adc.gets();
    adc.ui.UserID__c = 'test1';
    adc.ui.UserName__c = 'test1';
    adc.ui.LoginPassWord__c = '12345678';
    adc.ui.Authority__c = 0;
    adc.ui.Assignment__c = 3;
    adc.submitAzure();
    }
    
    @isTest static void test2() {

    System.Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator_nothing());
    AzureDemoController adc = new  AzureDemoController();
    
   // HttpResponse res = CalloutClass.getInfoFromExternalService();
    
    adc.gets();
    adc.ui.UserID__c = 'test1';
    adc.ui.UserName__c = 'test1';
    adc.ui.LoginPassWord__c = '12345678';
    adc.ui.Authority__c = 0;
    adc.ui.Assignment__c = 3;
    adc.submitAzure();
    }
}