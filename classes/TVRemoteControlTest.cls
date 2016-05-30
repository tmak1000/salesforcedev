@isTest
class TVRemoteControlTest {
    @isTest static void testVolumeIncrease(){
        TVRemoteControl rc = new TVRemoteControl(10);
        Integer newVolume = rc.increaseVolume(15);
        System.assertEquals(25, newVolume);
    }
    
    @isTest static void testVolumeDecrease(){
        TVRemoteControl rc = new TVRemoteControl(20);
        Integer newVolume = rc.decreaseVolume(15);
        System.assertEquals(5, newVolume);
    }
    
    @isTest static void testVolumeIncreaseOverMax(){
        TVRemoteControl rc = new TVRemoteControl(10);
        Integer newVolume = rc.increaseVolume(100);
        System.assertEquals(50,newVolume );
    }
    
    @isTest static void testVolumeDecreaseUnderMin(){
        TVRemoteControl rc = new TVRemoteControl(10);
        Integer newVolume = rc.decreaseVolume(100);
		System.assertEquals(0, newVolume);
    }
    
    @isTest static void testGetMenuOptions(){
        String menu = TVRemoteControl.getMenuOptions();
        System.assertNotEquals(null, menu);
        System.assertNotEquals('', menu);
    }
    
    @isTest static void testConstructOverMax(){
        TVRemoteControl rc = new TVRemoteControl(100);
        Integer firstVolume = rc.increaseVolume(10);
        System.assertEquals(50, firstVolume);
    }
    
    @isTest static void testConstructUnderMin(){
        TVRemoteControl rc = new TVRemoteControl(-1);
        Integer firstVolume = rc.decreaseVolume(10);
        System.assertEquals(0, firstVolume);
    }
}