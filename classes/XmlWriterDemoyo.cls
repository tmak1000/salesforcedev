public class XmlWriterDemoyo {
    public String getXml() {
        XmlStreamWriter w = new XmlStreamWriter();
        //
        w.writeStartDocument('UTF-8', '1.0');
        
        w.writeProcessingInstruction('target', 'data');
        //start library
        w.writeStartElement('m', 'Library', 'http://www.book.com');
        w.writeNamespace('m', 'http://www.book.com');
        w.writeComment('Book starts here');
        w.setDefaultNamespace('http://www.defns.com');
        w.writeCData('<Cdata><img src="https://c.ap0.content.force.com/servlet/servlet.ImageServer?id=01510000002vAfM&oid=00D10000000bnF2" width="50" height="40"/></Cdata>');
        //start book
        w.writeStartElement(null, 'book', null);
        w.writedefaultNamespace('http://www.defns.com');
        w.writeAttribute(null, null, 'author', 'Manoj');
        w.writeCharacters('<img src="https://c.ap0.content.force.com/servlet/servlet.ImageServer?id=01510000002vAfM&oid=00D10000000bnF2" width="50" height="40"/>');
        //end book  
        w.writeEndElement(); 
        w.writeEmptyElement(null, 'ISBN', null);
        //end library  
        w.writeEndElement();
        w.writeEndDocument();
        String xmlOutput = w.getXmlString();
        w.close();
        return xmlOutput;
    }
}