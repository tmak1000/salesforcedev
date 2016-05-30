/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApplicantFeedPostBatchDao {

    /**
     * コンストラクタ
     */
    public ApplicantFeedPostBatchDao() {
        
    }

    /**
     * Chatter Group情報取得
     */
    public CollaborationGroup getCollaborationGroup(String groupName) {
        List<CollaborationGroup> chatterGroups = [SELECT Id,Name FROM CollaborationGroup
                                                                    WHERE Name =: groupName LIMIT 1];
        return chatterGroups.isEmpty() ? new CollaborationGroup() : chatterGroups[0];
    }
}