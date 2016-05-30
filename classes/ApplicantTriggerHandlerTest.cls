/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApplicantTriggerHandlerTest {
    
    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * 応募者登録時にメール自動返信
     * 1件
     */
    static testMethod void sendEmailTest1() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            // 1件作成
            Applicant__c applicant = CommonTester.createApplicant(true);
            
            Test.stopTest();
        }
    }

    /**
     * 応募者登録時にメール自動返信
     * 201件
     */
    static testMethod void sendEmailTest2() {
        
        System.runAs(testAdminUser) {

            Integer listSize = 201;

            List<Applicant__c> applicants = new List<Applicant__c>();
            for (Integer i = 0; i < listSize; i++) {
                Applicant__c applicant = CommonTester.createApplicant(false);
                applicants.add(applicant);
            }
            System.assertEquals(applicants.size(), listSize);

            Test.startTest();
            
            insert applicants;
            
            Test.stopTest();
        }
    }
}