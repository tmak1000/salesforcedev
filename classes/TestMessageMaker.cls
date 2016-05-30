@isTest
public class TestMessageMaker {
    @isTest static void testhelloMessage(){
        String actual = MessageMaker.helloMessage();
        System.assertNotEquals(null, actual);
        System.assertNotEquals('', actual);
    }
}