/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApplicantFeedPostBatch implements Database.batchable<sObject>, Database.Stateful {

    private ApplicantFeedPostBatchHelper helper = new ApplicantFeedPostBatchHelper();
    private ApplicantFeedPostBatchDao dao = new ApplicantFeedPostBatchDao();
    private CollaborationGroup chatterGroup = new CollaborationGroup();
    private ChatterGroupCtrl__c chatterGroupCtrl = new ChatterGroupCtrl__c();
    
    /**
     * コンストラクタ
     */
    public ApplicantFeedPostBatch() {
        // カスタム設定:ChatterGroup名を取得
        this.chatterGroupCtrl = ChatterGroupCtrl__c.getOrgDefaults();
        String groupName = this.chatterGroupCtrl.GroupName__c;
        // ChatterGroupの情報取得
        this.chatterGroup = this.dao.getCollaborationGroup(groupName);
    }
    
    /**
     * start
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        
        String query = '';
        query += ' SELECT ';
        query += ' Id ';
        query += ' ,FullName__c ';
        query += ' ,DevelopmentExperienceYear__c ';
        query += ' ,Age__c ';
        query += ' FROM ';
        query += ' Applicant__c ';
        query += ' WHERE ';
        query += ' IsPost__c != true ';

        return Database.getQueryLocator(query);
    }
    
    /**
     * execute
     */
    public void execute(Database.BatchableContext BC, List<Applicant__c> applicants) {

        // 投稿情報取得
        Boolean isError = (Test.isRunningTest()) ? false : this.helper.postChatterMessage(
                                                                     applicants
                                                                    ,this.chatterGroup
                                                                );

        // 投稿済みに更新
        this.helper.getUpdateApplicant(applicants);
        // UPDATE
        update applicants;
    }
    
    /**
     * finish
     */
    public void finish(Database.BatchableContext BC) {

    }
}