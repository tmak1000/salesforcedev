/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApplicantTriggerHandler {

    ApplicantTriggerHelper helper = new ApplicantTriggerHelper();

    /**
     * コンストラクタ
     */
    public ApplicantTriggerHandler() {
        
    }

    /**
     * 応募者登録時にメール自動返信
     */
    public void sendEmail(List<Applicant__c> newApplicants) {
        // 組織情報取得
        OrgWideEmailAddress orgWideEmailAddress = CommonDao.getOrgWideEmailAddress(System.Label.OrgWideEmailAddressDisplayName);
        // メール情報取得
        List<Messaging.SingleEmailMessage> emails = this.helper.getSendEmail(newApplicants, orgWideEmailAddress);
        // メール送信
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(emails, false);
        // 送信メールエラーログ
        List<SendEmailErrorLog__c> sendEmailErrorLogs = this.helper.getSendEmailErrorLogs(results);
        // 送信メールエラーログ登録
        insert sendEmailErrorLogs;
    }
}