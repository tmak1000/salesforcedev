public without sharing class controllerClass{


public string xmlheader {get;set;}


public string endfile{get;set;}

public string xml{get;set;}

public List<string> listString{get;set;}


 


public controllerClass() {


//VF page gives some issues directly using the below code there, so wrap up in variable


xmlheader ='<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?>';
    
this.xml = writeXml();
endfile = '</Workbook>';


listString = new List<string>();


listString.add('1');


listString.add('2');


}
    
    public String writeXml(){
        String xml = '<Worksheet ss:Name="Sheet2"><Table ss:ExpandedColumnCount="100"><Column ss:Width="100"/><Column ss:Width="180"/><Row><Cell ss:StyleID="s66"><Data ss:Type="String">Test Sheet2</Data></Cell></Row><Row><Cell ss:StyleID="s16"><Data ss:Type="String">Field1</Data></Cell></Row><apex:repeat value="{!listString}" var="row"><Row><Cell ss:StyleID="s23"><Data ss:Type="String">{!row}</Data></Cell></Row></apex:repeat></Table></Worksheet>';
        return xml;
    }


}