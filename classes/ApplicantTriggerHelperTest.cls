/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApplicantTriggerHelperTest {

    private static ApplicantTriggerHelper helper = new ApplicantTriggerHelper();
    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * メール情報取得
     * 1件
     */
    static testMethod void getSendEmailTest1() {
        
        System.runAs(testAdminUser) {

            // 組織のアドレス
            OrgWideEmailAddress orgWideEmailAddress = CommonDao.getOrgWideEmailAddress(System.Label.OrgWideEmailAddressDisplayName);
            System.assertEquals(String.isNotEmpty(orgWideEmailAddress.Id), true);

            Integer listSize = 1;

            List<Applicant__c> applicants = new List<Applicant__c>();
            for (Integer i = 0; i < listSize; i++) {
                Applicant__c applicant = CommonTester.createApplicant(false);
                applicants.add(applicant);
            }
            System.assertEquals(applicants.size(), listSize);

            Test.startTest();
            
            List<Messaging.SingleEmailMessage> results = helper.getSendEmail(applicants, orgWideEmailAddress);
            System.assertEquals(results.size(), listSize);
            
            Test.stopTest();
        }
    }

    /**
     * メール情報取得
     * 201件
     */
    static testMethod void getSendEmailTest2() {
        
        System.runAs(testAdminUser) {

            // 組織のアドレス
            OrgWideEmailAddress orgWideEmailAddress = CommonDao.getOrgWideEmailAddress(System.Label.OrgWideEmailAddressDisplayName);
            System.assertEquals(String.isNotEmpty(orgWideEmailAddress.Id), true);

            Integer listSize = 201;

            List<Applicant__c> applicants = new List<Applicant__c>();
            for (Integer i = 0; i < listSize; i++) {
                Applicant__c applicant = CommonTester.createApplicant(false);
                applicants.add(applicant);
            }
            System.assertEquals(applicants.size(), listSize);

            Test.startTest();
            
            List<Messaging.SingleEmailMessage> results = helper.getSendEmail(applicants, orgWideEmailAddress);
            System.assertEquals(results.size(), listSize);
            
            Test.stopTest();
        }
    }

    /**
     * 送信メールエラーログ取得
     * 1件
     */
    static testMethod void getSendEmailErrorLogsTest1() {
        
        System.runAs(testAdminUser) {

            // 組織のアドレス
            OrgWideEmailAddress orgWideEmailAddress = CommonDao.getOrgWideEmailAddress(System.Label.OrgWideEmailAddressDisplayName);
            System.assertEquals(String.isNotEmpty(orgWideEmailAddress.Id), true);

            Integer listSize = 1;

            List<Applicant__c> applicants = new List<Applicant__c>();
            for (Integer i = 0; i < listSize; i++) {
                Applicant__c applicant = CommonTester.createApplicant(false);
                applicant.Email__c = 'tyoshikawaXsfdchack2014.com.devjp';
                applicants.add(applicant);
            }
            System.assertEquals(applicants.size(), listSize);

            // メール送信
            List<Messaging.SingleEmailMessage> emails = helper.getSendEmail(applicants, orgWideEmailAddress);
            List<Messaging.SendEmailResult> results = Messaging.sendEmail(emails, false);
            System.assertEquals(results.size(), listSize);

            Test.startTest();
            
            List<SendEmailErrorLog__c> sendEmailErrorLogs = helper.getSendEmailErrorLogs(results);
            System.assertEquals(sendEmailErrorLogs.size(), listSize);
            insert sendEmailErrorLogs;

            Test.stopTest();

            List<SendEmailErrorLog__c> resultSendEmailErrorLogs = [SELECT Id FROM SendEmailErrorLog__c];
            System.assertEquals(resultSendEmailErrorLogs.size(), listSize);
        }
    }

    /**
     * 送信メールエラーログ取得
     * 201件
     */
    static testMethod void getSendEmailErrorLogsTest2() {
        
        System.runAs(testAdminUser) {

            // 組織のアドレス
            OrgWideEmailAddress orgWideEmailAddress = CommonDao.getOrgWideEmailAddress(System.Label.OrgWideEmailAddressDisplayName);
            System.assertEquals(String.isNotEmpty(orgWideEmailAddress.Id), true);

            Integer listSize = 1;

            List<Applicant__c> applicants = new List<Applicant__c>();
            for (Integer i = 0; i < listSize; i++) {
                Applicant__c applicant = CommonTester.createApplicant(false);
                applicant.Email__c = 'tyoshikawaXsfdchack2014.com.devjp';
                applicants.add(applicant);
            }
            System.assertEquals(applicants.size(), listSize);

            // メール送信
            List<Messaging.SingleEmailMessage> emails = helper.getSendEmail(applicants, orgWideEmailAddress);
            List<Messaging.SendEmailResult> results = Messaging.sendEmail(emails, false);
            System.assertEquals(results.size(), listSize);

            Test.startTest();
            
            List<SendEmailErrorLog__c> sendEmailErrorLogs = helper.getSendEmailErrorLogs(results);
            System.assertEquals(sendEmailErrorLogs.size(), listSize);
            insert sendEmailErrorLogs;

            Test.stopTest();

            List<SendEmailErrorLog__c> resultSendEmailErrorLogs = [SELECT Id FROM SendEmailErrorLog__c];
            System.assertEquals(resultSendEmailErrorLogs.size(), listSize);
        }
    }
}