@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
// Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
    // Optionally, only send a mock response for a specific endpoint
    // and method.
   // System.assertEquals('http://fmapitest.cloudapp.net/api/t_userinfo', req.getEndpoint());
    //System.assertEquals('GET', req.getMethod());
    // Create a fake response
    HttpResponse res = new HttpResponse();
    res.setHeader('Content-Type', 'application/json');
    res.setBody('{"UserID" : "idididid","LoginPassWord" : "99999","UserName" : "hoge","Authority" : 3,"Assignment" : 2} ');
    res.setStatusCode(200);
    return res;
    }
}