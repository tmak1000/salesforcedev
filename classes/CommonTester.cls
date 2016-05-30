/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class CommonTester {

    /**
     * テスト実行ユーザ取得
     */
    public static User getTestUser() {
        return new User(Id = UserInfo.getUserId());
    }
    
    /**
     * テスト実行ページ取得
     */
    public static PageReference getPageReference() {
        return new PageReference('PageReference');
    }

    /**
     * 応募者 テストデータ作成
     */
    public static Applicant__c createApplicant(Boolean isInsert) {

        Applicant__c applicant = new Applicant__c(
             LastName__c = 'Yoshikawa'
            ,FirstName__c = 'Taiki'
            ,Phone__c = '090-123-1234'
            ,Email__c = 'tyoshikawa@sfdchack2014.com.devjp'
            ,Birthday__c = date.newInstance(1900,1,1)
            ,Sex__c = '男'
            ,IsPost__c = false
            ,PostalCode__c = '100-7012'
            ,State__c = '東京都'
            ,City__c = '千代田区'
            ,Street__c = '丸の内2－7－2'
        );

        if (isInsert) {
            insert applicant;
        }
        
        return applicant;
    }

    /**
     * Chatterグループ テストデータ作成
     */
    public static CollaborationGroup createCollaborationGroup(String groupName, Boolean isInsert) {

        CollaborationGroup collaborationGroup = new CollaborationGroup(
             Name = groupName
            ,CollaborationType = 'Private'
        );

        if (isInsert) {
            insert collaborationGroup;
        }
        
        return collaborationGroup;
    }
    
    /**
     * Chatterグループ設定 テストデータ作成
     */
    public static ChatterGroupCtrl__c createChatterGroupCtrl(Boolean isInsert) {
        
        ChatterGroupCtrl__c chatterGroupCtrl = new ChatterGroupCtrl__c(
            GroupName__c = 'chatter_group_apex_test'
        );
        
        if (isInsert) {
            insert chatterGroupCtrl;
        }
        
        return chatterGroupCtrl;
    }
}