/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
trigger ApplicantTrigger on Applicant__c (after insert) {

    ApplicantTriggerHandler handler = new ApplicantTriggerHandler();

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // 応募者登録時にメール自動返信
            handler.sendEmail(Trigger.new);
        }
    }
}