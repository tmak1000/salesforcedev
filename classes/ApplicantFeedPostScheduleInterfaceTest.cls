/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApplicantFeedPostScheduleInterfaceTest {

    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * Schedule Batch
     * 起動のみ
     */
    static testMethod void ApplicantFeedPostScheduleInterfaceTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // コンストラクタ
            ApplicantFeedPostScheduleInterface cls = new ApplicantFeedPostScheduleInterface();
            // パラメータ
            String sch = '20 30 8 10 2 ?';
            // バッチスケジュール起動
            system.schedule('ApplicantFeedPostScheduleInterfaceJob',sch, cls);  
            
            Test.stopTest();
        }
    }
}