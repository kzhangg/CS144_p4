package edu.ucla.cs.cs144;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.StringReader;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

public class ItemServlet extends HttpServlet implements Servlet {

    public ItemServlet() {}
    public static Document convertToDocument(String xmlData)
    {
        DocumentBuilderFactory sosMachine = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder convertor = sosMachine.newDocumentBuilder();
            StringReader string = new StringReader(xmlData);
            InputSource input = new InputSource();
            input.setCharacterStream(string);
            Document d = convertor.parse(input);
            return d;

        } catch (Exception e) {

        }

        return null;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {


        try{
            ItemResult item = null;
            String xmlData = AuctionSearch.getXMLDataForItemId(request.getParameter("id"));
            request.setAttribute("xml", xmlData);

            if(xmlData !="" && xmlData != null){
            Document d = convertToDocument(xmlData);
            Element x = d.getDocumentElement();
            item = MyParser.convertToItem(x);
            }
            request.setAttribute("Item", item);
            request.getRequestDispatcher("item.jsp").forward(request, response);
        }
        catch(Exception e){
          response.sendRedirect("itemSearch.html");
        }

    }

}
