/**
 * 手書きサインコントローラ
 */
public with sharing class DrawSignController {

    // 作業
    public Work__c work { get; set; }

    /**
     * コンストラクタ
     */
    public DrawSignController() {

        // 作業取得
        this.work = [
            SELECT
                 Id
                ,IsSign__c
                ,AccountSign__c
            FROM
                 Work__c
            WHERE
                 Id = :Apexpages.currentPage().getParameters().get( 'id' )
        ];

    }

    /**
     * メモ & 添付に登録
     */
    public PageReference getSign() {
        
        // セーブポイントの設定
        Savepoint sp = Database.setSavepoint();

        try{

            Attachment objAttachment = new Attachment();
            
            // ファイル名
            objAttachment.Name = 'sign1.png';
            
            // 本文
            objAttachment.Body = EncodingUtil.base64Decode(Apexpages.currentPage().getParameters().get('signPrm'));
        
            // 関連先
            objAttachment.ParentId = this.work.Id;
        
            // メモ&添付INSERT
            insert objAttachment;

            this.work.IsSign__c = true;
            this.work.AccountSign__c =  '<img alt=\"sign.png\"src="data:image/png;base64,'+Apexpages.currentPage().getParameters().get('signPrm') +'"style=\"\"></img>';
            update work;

        } catch ( Exception e ){
            
            // 失敗時はロールバック
            Database.rollback(sp);
            system.debug('エラー：[' + e + ']');
        }

        return null;
    
    }
}