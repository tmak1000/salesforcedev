/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApplicantFeedPostBatchTest {

    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * Batch
     * 1件
     */
    static testMethod void ApplicantFeedPostBatchTest1() {
        
        System.runAs(testAdminUser) {

            ChatterGroupCtrl__c chatterGroupCtrl = CommonTester.createChatterGroupCtrl(true);
            String groupName = chatterGroupCtrl.GroupName__c;
            CollaborationGroup collaborationGroup = CommonTester.createCollaborationGroup(groupName, true);

            Applicant__c applicant = CommonTester.createApplicant(false);
            applicant.IsPost__c = false;
            insert applicant;

            Test.startTest();
            
            Database.executeBatch(new ApplicantFeedPostBatch(), 200);
            
            Test.stopTest();

            List<Applicant__c> results = [SELECT Id FROM Applicant__c WHERE IsPost__c = true];
            System.assertEquals(results.size(), 1);
        }
    }

    /**
     * Batch
     * 201件
     */
    static testMethod void ApplicantFeedPostBatchTest2() {
        
        System.runAs(testAdminUser) {

            // Chatterグループ情報作成
            ChatterGroupCtrl__c chatterGroupCtrl = CommonTester.createChatterGroupCtrl(true);
            String groupName = chatterGroupCtrl.GroupName__c;
            CollaborationGroup collaborationGroup = CommonTester.createCollaborationGroup(groupName, true);
            System.assertEquals(String.isNotEmpty(collaborationGroup.Id), true);

            // 応募者情報作成
            Integer listSize = 201;
            List<Applicant__c> applicants = new List<Applicant__c>();
            for (Integer i = 0; i < listSize; i++) {
                Applicant__c applicant = CommonTester.createApplicant(false);
                applicant.IsPost__c = false;
                applicants.add(applicant);
            }
            System.assertEquals(applicants.size(), listSize);
            insert applicants;

            Test.startTest();
            
            Database.executeBatch(new ApplicantFeedPostBatch(), 400);
            
            Test.stopTest();

            List<Applicant__c> results = [SELECT Id FROM Applicant__c WHERE IsPost__c = true];
            System.assertEquals(results.size(), listSize);
        }
    }
}