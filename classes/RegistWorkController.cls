public with sharing class RegistWorkController {

    // プロパティ
    /** 商談ID */
    private Id oppId;
    /** 活動ID */
    private Id eventId;
    /** 作業ID */
    private Id workId;

    /** 遷移元ID */
    public Id backId;

    /** 商談 */
    public Opportunity opp { get; private set; }
    /** 活動 */
    public Event event { get; private set; }
    /** 作業 */
    public Work__c work { get; private set; }

    /** 納入商品 */
    public Map<Id, Asset> assetMap { get; set; }
    /** 機種・機番セレクトリスト */
    public List<SelectOption> assets { get; set; }
    /** 累積枚数マップ */
    public Map<Id, Asset> totalCountMap { get; private set; }

    /**
     * コンストラクタ
     */
    public RegistWorkController () {

        // リクエストパラメータの取得
        this.workId  = ApexPages.currentPage().getParameters().get('workId');
    }


    /**
     * 初期処理
     */
    public PageReference init() {

        // リクエストパラメータチェック
        if (String.isBlank(this.workId)) return null; 

        // get work
        this.work = [SELECT 
        				Id,
        				Name,
        				AccountSign__c,
        				Note__c,
        				IsSign__c,
        				Staff__c,
        				ActivityId__c,
        				OpportunityId__c
        				FROM Work__c WHERE Id = :workid];



        return null;
    }

    /**
     * 保存処理
     */
    public PageReference save() {

        // バリデーションチェック

        upsert this.event;

        // 作業の保存
        upsert this.work;

        // 作業報告書画面へ遷移
        Pagereference newPage = new Pagereference('/apex/WorkReport');
        return newPage;
    }

    /**
     * 戻る処理
     */
    public PageReference back() {

        // 作業報告書画面へ遷移
        Pagereference newPage = new Pagereference('/' + this.workId);
        return newPage;
    }


    /**
     * 作業報告書再登録
     *
     */
    public PageReference reEdit() {

        // サイン受領フラグをoff
        this.work.IsSign__c = false;
        this.work.AccountSign__c = null;
        update this.work;

        // 作業報告登録画面へ遷移
        Pagereference newPage = new Pagereference('/apex/registWork');
        return newPage;
       
    }
       
}