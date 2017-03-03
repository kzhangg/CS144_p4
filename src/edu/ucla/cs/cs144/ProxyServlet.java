package edu.ucla.cs.cs144;

import java.io.IOException;
import java.net.HttpURLConnection;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProxyServlet extends HttpServlet implements Servlet {
       
    public ProxyServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // your codes here
        String query = "";

        if (request.getParameter("q") != null){
        	query = request.getParameter("q");
        }

        try {

        	URL link = new URL("http://google.com/complete/search?output=toolbar&q=" + query);
            
        }
        catch(Exception e){

        }

        HttpURLConnection connection = (HttpURLConnection) link.openConnection();
       
    }
}
