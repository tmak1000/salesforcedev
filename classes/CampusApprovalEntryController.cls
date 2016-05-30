/**
 * デジキャンホームページ
 */
public without sharing class CampusApprovalEntryController{

    public String head1 { get; set; }

    public String hed1 { get; set; }

    // commonスタイルシート
    public String commonCss {get;private set;}
    // baseスタイルシート
    public String baseCss {get;private set;}
    // pageスタイルシート
    public String pageCss {get;private set;}
    // functionライブラリ
    public String functionJs {get;private set;}
    public TestSetting__c ts {get;set;}
        // 取引先
    public transient Account account { get; private set; }
    // 取引先ID
    private transient Id accountId;
    
    // 申請
    public Candidate__c app{get; set;}

        /**
     * コンストラクタ
     */
    public CampusApprovalEntryController() {
    
        // ユーザーエージェント取得
        String userAgent = ApexPages.currentPage().getHeaders().get('User-Agent');

        // スマホ・タブレット端末である場合
        if(userAgent.contains('iPhone')
        || userAgent.contains('iPad')
        || userAgent.contains('Android')) {
            this.commonCss  = 'css/common_sp.css';
            this.baseCss    = 'css/base_sp.css';
            this.pageCss    = 'css/page_sp.css';
            this.functionJs = 'js/function_sp.js';
        } else {
        // それ以外である場合
            this.commonCss  = 'css/common.css';
            this.baseCss    = 'css/base.css';
            this.pageCss    = 'css/page.css';
            this.functionJs = 'js/function.js';
        }

    }
    
    /**
     * 初期処理
     */
    public PageReference init() {
        
        this.app = new Candidate__c();
       Map<String, TestSetting__c> mcs = TestSetting__c.getAll();    
       this.ts = TestSetting__c.getValues('test2');    
       return null;
    }
    
                public  Component.Apex.OutputText  getText(){
        Component.Apex.OutputText head1 = new Component.Apex.OutputText();
        head1.escape = false;
        String text = 'aaa';
        head1.value = '<tr><th>申請区分</th><td>' + text + '</td></tr>';
        head1.value += '<tr><th>申請区分</th><td>' + text + '</td></tr>';
        return head1;
    }            
    // 申請ボタン押下
    public PageReference entry(){
        
        this.accountId = [SELECT Id, AccountId FROM User WHERE Id = :UserInfo.getUserId()].AccountId;
        this.app.Account__c = this.accountId;
        this.app.Status__c = '申請中';
        // 申請登録
        insert app;
        Pagereference newPage = new Pagereference('/apex/CampusPetition');
        return newPage;
    }
    
    // 戻るボタン押下
    public PageReference back() {
        
        this.init();
        Pagereference newPage = new Pagereference('/apex/CampusPetition');
        return newPage;
    }
}