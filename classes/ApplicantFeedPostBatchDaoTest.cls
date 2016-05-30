/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApplicantFeedPostBatchDaoTest {

    private static ApplicantFeedPostBatchDao dao = new ApplicantFeedPostBatchDao();
    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * メール情報取得
     * 引数なし
     */
    static testMethod void getCollaborationGroupTest1() {
        
        System.runAs(testAdminUser) {

            String groupName = '';

            Test.startTest();
            
            CollaborationGroup result = dao.getCollaborationGroup(groupName);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * メール情報取得
     * 引数あり
     */
    static testMethod void getCollaborationGroupTest2() {
        
        System.runAs(testAdminUser) {

            ChatterGroupCtrl__c chatterGroupCtrl = CommonTester.createChatterGroupCtrl(true);
            String groupName = chatterGroupCtrl.GroupName__c;

            Test.startTest();
            
            CollaborationGroup result = dao.getCollaborationGroup(groupName);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }
}