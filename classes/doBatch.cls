global class doBatch implements Schedulable{
     
    //1回のexecuteメソッドで処理される件数
    private final Integer BATCH_SIZE = 200;
     
    //バッチ実行
    global void execute(SchedulableContext ctx) {         
        //どのオブジェクトのレコードに対し処理を実行するのかSOQLを投げる
        Boolean checked = true;
        PerformeStoreInfoBatch b = new PerformeStoreInfoBatch(checked);
        Database.executeBatch(b, BATCH_SIZE);
    }
}