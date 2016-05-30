public class TVRemoteControl {
	Integer volume;
    
    static final Integer MAX_VOLUME = 50;
    
    public TVRemoteControl(Integer v){
        if(v < 0){
            volume = 0;
        }else if(50 < v){
             volume = 50;
        }else{
            volume = v;
        }
    }
    
    
    public Integer increaseVolume(Integer amount){
        volume += amount;
        if(volume > MAX_VOLUME){
            volume = MAX_VOLUME;
        }
        return volume;
    }
    
    public Integer decreaseVolume(Integer amount){
        volume -= amount;
        if(volume < 0){
            volume = 0;
        }
        return volume;
    }
    
    public static String getMenuOptions(){
        return 'AUDIO SETTINGS - VIDEO SETTINGS';
    }
}