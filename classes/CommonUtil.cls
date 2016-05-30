public without sharing class CommonUtil {

   /**
    * 指定したオブジェクト内の指定した選択リスト項目の設定値をすべて取得する。
    *
    * @param objName オブジェクト名
    * @param fld 項目名
    * @return 選択リスト
    */
   public static list<Schema.PicklistEntry> getPicklistValues(String objName, String fld){
       List<Schema.PicklistEntry> pickList;
       Schema.SObjectType sobjtype = (Schema.SObjectType)Schema.getGlobalDescribe().get(objName);
       if(sobjtype != null){
           Map<String, Schema.SObjectField> fieldmap = sobjtype.getDescribe().fields.getMap();
           Schema.SObjectField f = (Schema.SObjectField)fieldmap.get(fld);
           if(f != null){
               Schema.DescribeFieldResult r = f.getDescribe();
               pickList = r.getPicklistValues();
           }
       }
       return pickList;
   }

   /**
    * 指定したオブジェクトの全項目を取得するクエリを生成する
    *
    * @param objName オブジェクト名
    * @return 全項目取得用クエリ
    */
   public static String getSelectAllQuery(String objName) {
       return getSelectAllQuery(objName, new List<String> ());
   }

   /**
    * 指定したオブジェクトの全項目＋追加項目を
    * 取得するクエリを生成する
    *
    * @param objName オブジェクト名
    * @param addColumns 追加項目
    * @return 全項目取得用クエリ
    */
    public static String getSelectAllQuery(String objName, List<String> addColumns) {

        String fieldsString = '';
        String commaString = '';

        // SObject Describe
        Schema.DescribeSObjectResult obj = Schema.getGlobalDescribe().get(objName).getDescribe();

        // Fieldマップ取得
        Map<String, Schema.SObjectField> fieldMap = obj.fields.getMap();
        for(Schema.SObjectField item : fieldMap.values()) {
            if (item.getDescribe().getName() == 'BillingAddress' 
                || item.getDescribe().getName() == 'ShippingAddress'
                || item.getDescribe().getName() == 'OtherAddress'
                || item.getDescribe().getName() == 'MailingAddress'
                ){
                continue;
            }
            fieldsString += commaString + item.getDescribe().getName();
            commaString = ',';
        }

        // 追加項目
        for (String item : addColumns) {
            fieldsString += commaString + item;
        }

        return 'SELECT ' + fieldsString + ' FROM ' + objName;
    }



   /**
    * 指定したオブジェクトの全項目を取得するクエリを生成する
    *
    * @param objName オブジェクト名
    * @return 全項目取得用クエリ
    */
   public static String getSelectAll(String objName) {
       return getSelectAll(objName, new List<String> ());
   }

   /**
    * 参照項目のオブジェクト全項目を取得するクエリを生成する
    */
    public static String getSelectAll(String objName, List<String> addColumns) {

        String fieldsString = '';
        String commaString = '';

        // SObject Describe
        Schema.DescribeSObjectResult obj = Schema.getGlobalDescribe().get(objName).getDescribe();

        // Fieldマップ取得
        Map<String, Schema.SObjectField> fieldMap = obj.fields.getMap();
        for(Schema.SObjectField item : fieldMap.values()) {
            if (item.getDescribe().getName() == 'BillingAddress' 
                || item.getDescribe().getName() == 'ShippingAddress'
                || item.getDescribe().getName() == 'OtherAddress'
                || item.getDescribe().getName() == 'MailingAddress'
                ){
                continue;
            }
            fieldsString += commaString + item.getDescribe().getName();
            commaString = ',';
        }

        // 追加項目
        for (String item : addColumns) {
            fieldsString += commaString + item;
        }

        return 'SELECT ' + fieldsString;
    }

    /**
     * sObjectを指定した項目でソートをかける
     *
     * @param items SObject
     * @param sortField 項目名
     * @param order ソート順
     */
    public static void sortList(List<Sobject> items, String sortField, String order){
        List<Sobject> resultList = new List<Sobject>();
        Map<object, List<Sobject>> objectMap = new Map<object, List<Sobject>>();
        for(Sobject ob : items){
            if(objectMap.get(ob.get(sortField)) == null){
                objectMap.put(ob.get(sortField), new List<Sobject>());
            }
            objectMap.get(ob.get(sortField)).add(ob);
        }

        List<object> keys = new List<object>(objectMap.keySet());
        keys.sort();

        for(object key : keys){
            resultList.addAll(objectMap.get(key));
        }
        items.clear();
        if(order.toLowerCase() == 'asc'){
            for(Sobject ob : resultList){
                items.add(ob);
            }
        }
        else if(order.toLowerCase() == 'desc'){
            for(integer i = resultList.size()-1; i >= 0; i--){
                items.add(resultList[i]);
            }
        }
    }
    
}