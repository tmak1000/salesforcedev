public class XmlWriterDemo {

     public String getXml() {
          XmlStreamWriter w = new XmlStreamWriter();
          w.writeStartDocument(null, '1.0');
          w.writeProcessingInstruction('target', 'data');
          w.writeStartElement('m', 'Library', 'http://www.book.com');
          w.writeNamespace('m', 'http://www.book.com');
          w.writeComment('Book starts here');
          w.setDefaultNamespace('http://www.defns.com');
          w.writeCData('<Cdata> I like CData </Cdata>');
          w.writeStartElement(null, 'book', null);
          w.writedefaultNamespace('http://www.defns.com');
          w.writeAttribute(null, null, 'author', 'Manoj');
          w.writeCharacters('This is my book');
          w.writeEndElement(); //end book
          w.writeEmptyElement(null, 'ISBN', null);
          w.writeEndElement(); //end library
          w.writeEndDocument();
          String xmlOutput = w.getXmlString();
          w.close();
          return xmlOutput;
        }
}