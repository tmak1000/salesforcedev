public class StringArrayTest {
    public static List<String> generateStringArray(Integer n){
        List<String> strList = New List<String>();
        Integer loopLimit = n;
        for(Integer i = 0; i < loopLimit;i++){
            strList.add('Test '+i);
        }
        return strList;
    }
}