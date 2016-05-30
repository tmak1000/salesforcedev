/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApplicantFeedPostBatchHelperTest {

    private static ApplicantFeedPostBatchHelper helper = new ApplicantFeedPostBatchHelper();
    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * Chatter Post
     */
    @isTest(SeeAllData=true)
    static void postChatterMessageTest() {
        
        System.runAs(testAdminUser) {
            
            // Chatterグループ情報作成(SeeAllData=trueのため、INSERTは行わない)
            ChatterGroupCtrl__c chatterGroupCtrl = CommonTester.createChatterGroupCtrl(false);
            System.assertEquals(String.isNotEmpty(chatterGroupCtrl.GroupName__c), true);

            String groupName = chatterGroupCtrl.GroupName__c;
            CollaborationGroup collaborationGroup = CommonTester.createCollaborationGroup(groupName, true);
            System.assertEquals(String.isNotEmpty(collaborationGroup.Id), true);

            // 応募者情報作成
            Integer listSize = 100;
            List<Applicant__c> applicants = new List<Applicant__c>();
            for (Integer i = 0; i < listSize; i++) {
                Applicant__c applicant = CommonTester.createApplicant(false);
                applicant.IsPost__c = false;
                applicants.add(applicant);
            }
            System.assertEquals(applicants.size(), listSize);
            insert applicants;

            Test.startTest();
            
            Boolean isError = helper.postChatterMessage(applicants, collaborationGroup);
            System.assertEquals(isError, false);
            
            Test.stopTest();
        }
    }

    /**
     * 更新情報取得
     */
    static testMethod void getUpdateApplicantTest() {
        
        System.runAs(testAdminUser) {

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
            
            helper.getUpdateApplicant(applicants);
            System.assertEquals(applicants.size(), listSize);

            for (Applicant__c result : applicants) {
                System.assertEquals(result.IsPost__c, true);
            }
            
            Test.stopTest();
        }
    }
}