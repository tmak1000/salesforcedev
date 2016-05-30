public class JsonToUserInfo{
    public List<UserInfo> contents;
    
    public class UserInfo {
        public String UserID;   //test1
        public String LoginPassWord;    //12345678
        public String UserName; //testUser1
        public Integer Authority;   //1
        public String AuthorityName;    //一般
        public Integer Assignment;  //3
        public String AssignmentName;   //システム開発部2部
    }
    
    
    public  UserInfo parse(String json){
        return (UserInfo) System.JSON.deserialize(json, List<UserInfo>.class);
    }
/*
    static testMethod void testParse() {
        String json=        '{"contents":[{"UserID":"test1","LoginPassWord":"12345678","UserName":"testUser1","Authority":1,"AuthorityName":"一般","Assignment":3,"AssignmentName":"システム開発部2部"},{"UserID":"test2","LoginPassWord":"12345678","UserName":"testUser2","Authority":0,"AuthorityName":"管理者権限","Assignment":1,"AssignmentName":"事務所"},{"UserID":"test3","LoginPassWord":"09876543","UserName":"testUser3","Authority":0,"AuthorityName":"管理者権限","Assignment":2,"AssignmentName":"システム開発部1部"},{"UserID":"test4","LoginPassWord":"0900","UserName":"testUser4","Authority":1,"AuthorityName":"一般","Assignment":3,"AssignmentName":"システム開発部2部"},{"UserID":"test5","LoginPassWord":"12345678","UserName":"testUser5","Authority":1,"AuthorityName":"一般","Assignment":3,"AssignmentName":"システム開発部2部"},{"UserID":"test6","LoginPassWord":"12345678","UserName":"testUser6","Authority":1,"AuthorityName":"一般","Assignment":3,"AssignmentName":"システム開発部2部"},{"UserID":"test7","LoginPassWord":"12345678","UserName":"testUser7","Authority":1,"AuthorityName":"一般","Assignment":3,"AssignmentName":"システム開発部2部"},{"UserID":"test8","LoginPassWord":"12345678","UserName":"testUser8","Authority":1,"AuthorityName":"一般","Assignment":null,"AssignmentName":null},{"UserID":"test9","LoginPassWord":"12345678","UserName":"testUser9","Authority":1,"AuthorityName":"一般","Assignment":null,"AssignmentName":null}]}';
        UserInfo obj = parse(json);
        System.assert(obj != null);
        //System.assertEquals(obj.get(0).UserID,"test1");
    }
    */
}