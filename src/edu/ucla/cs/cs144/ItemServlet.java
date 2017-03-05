package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ItemServlet extends HttpServlet implements Servlet {
       
    public ItemServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
     
		//intialize
		ItemResult item = null;
		String xmlData = "":

    	try{

    		if(request.getParameter("itemId") != null){
    			xmlData = AuctionSearch.getXMLDataForItemId(request.getParameter("itemId"));	
    		}

            //need to write XML --> Item class parser
            item = MyParser.parseItem(xmlData);

    	}
    	catch (Exception e){
    		System.out.println("Save me plox.");
    	}



    	request.setAttribute("item", item);
    	//need to write .jsp file
     	request.getRequestDispatcher("/item.jsp").forward(request, response);   
    }
}
