@isTest
global class MockHttpResponseGenerator_nothing implements HttpCalloutMock {
// Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
    // Optionally, only send a mock response for a specific endpoint
    // and method.
   // System.assertEquals('http://fmapitest.cloudapp.net/api/t_userinfo', req.getEndpoint());
    //System.assertEquals('GET', req.getMethod());
    // Create a fake response
    HttpResponse res = new HttpResponse();
    res.setHeader('Content-Type', 'application/json');
    res.setStatusCode(404);
    return res;
    }
}