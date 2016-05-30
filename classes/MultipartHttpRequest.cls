public with sharing class MultipartHttpRequest {
    public String send(String reqEndpoint, String header, String boundary, Blob blobBody) {
        HttpRequest req = new HttpRequest();
        String tokenKey = 'Input Your Token';
        req.setHeader('Authorization', 'Token ' + tokenKey);
        req.setHeader('Content-Type','multipart/form-data; boundary=' + boundary);
        req.setMethod('POST');
        req.setEndpoint(reqEndPoint);
        req.setBodyAsBlob(this.getMultiPartBody(header, boundary, blobBody));
        req.setTimeout(120000);
  
        Http http = new Http();
        HTTPResponse res = http.send(req);
        return res.getBody();
    }
     
    public Blob getMultiPartBody(String header, String boundary, Blob file_body){
        String footer = '--'+boundary+'--';             
        String headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
        while(headerEncoded.endsWith('=')){
            header+=' ';
            headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
        }
        String bodyEncoded = EncodingUtil.base64Encode(file_body);
       
        Blob bodyBlob = null;
        String last4Bytes = bodyEncoded.substring(bodyEncoded.length()-4,bodyEncoded.length());
  
        if(last4Bytes.endsWith('==')) {
            last4Bytes = last4Bytes.substring(0,2) + '0K';
            bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
            // We have appended the \r\n to the Blob, so leave footer as it is.
            String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
            bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);
        } else if(last4Bytes.endsWith('=')) {
            last4Bytes = last4Bytes.substring(0,3) + 'N';
            bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
            // We have appended the CR e.g. \r, still need to prepend the line feed to the footer
            footer = '\n' + footer;
            String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
            bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);              
        } else {
            // Prepend the CR LF to the footer
            footer = '\r\n' + footer;
            String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
            bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);  
        }
        return bodyBlob;
    }   
}