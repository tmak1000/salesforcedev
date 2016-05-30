/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApplicantFeedPostScheduleConnect implements ApplicantFeedPostScheduleInterface.IScheduler {
    
    /**
     * execute
     */
    public void execute(SchedulableContext sc) {
        // ConnectAPIの実行制限を回避するためにバッチサイズを100とする
        Database.executeBatch(new ApplicantFeedPostBatch(), 100);
    }
}