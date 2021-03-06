public class SendEmail {

    private static final String SUBJECT = 'Sample Email';

    private static final String BODY = 'Hi, This is a sample email.';

    public void send(Id targetObjId) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject(SUBJECT);
        mail.setPlainTextBody(BODY);
        mail.setTargetObjectId(targetObjId);
        mail.setSaveAsActivity(false);
        // 送信者の氏名を変更する
        mail.setSenderDisplayName('hoge');

        // 送信
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage> { mail });
    }
}