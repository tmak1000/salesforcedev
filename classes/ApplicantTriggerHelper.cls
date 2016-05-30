/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApplicantTriggerHelper {

    /**
     * コンストラクタ
     */
    public ApplicantTriggerHelper() {
        
    }

    /**
     * メール情報取得
     */
    public List<Messaging.SingleEmailMessage> getSendEmail(List<Applicant__c> newApplicants, OrgWideEmailAddress orgWideEmailAddress) {

        List<Messaging.SingleEmailMessage> messagingEmails = new List<Messaging.SingleEmailMessage>();
        for (Applicant__c applicant : newApplicants) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            // 宛先
            email.setToAddresses(new String[] { applicant.Email__c });
            // 件名
            email.setSubject(System.Label.ApplicantEmailSetSubject);
            // 本文
            email.setPlainTextBody(applicant.FullName__c + ' ' + System.Label.Salutation + '\n' + System.Label.ApplicantEmailSetPlainTextBody);
            // 送信元になるようセット
            email.setOrgWideEmailAddressId(orgWideEmailAddress.Id);
            // リスト追加
            messagingEmails.add(email);
        }

        return messagingEmails;
    }

    /**
     * 送信メールエラーログ取得
     */
    public List<SendEmailErrorLog__c> getSendEmailErrorLogs(List<Messaging.SendEmailResult> results) {
        
        List<SendEmailErrorLog__c> sendEmailErrorLogs = new List<SendEmailErrorLog__c>();

        for (Messaging.SendEmailResult result : results) {
            if (!result.isSuccess()) {
                System.StatusCode statusCode = result.getErrors()[0].getStatusCode();
                String errorMessage = result.getErrors()[0].getMessage();
                String targetObjectId = result.getErrors()[0].getTargetObjectId();

                SendEmailErrorLog__c sendEmailErrorLog = new SendEmailErrorLog__c(
                     StatusCode__c = String.valueOf(statusCode)
                    ,Message__c = errorMessage
                    ,TargetObjectId__c = targetObjectId
                );
                sendEmailErrorLogs.add(sendEmailErrorLog);
            }
        }

        return sendEmailErrorLogs;
    }
}