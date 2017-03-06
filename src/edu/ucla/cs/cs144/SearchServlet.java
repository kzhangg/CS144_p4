package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchServlet extends HttpServlet implements Servlet {

    public SearchServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try{
    	//default values to set in case parameters don't return a valid number
        int defaultResultsToSkip = 0;
        int defaultResultsToReturn = 30;

        //initialize variables
        int numResultsToSkip = defaultResultsToSkip;
        int numResultsToReturn = defaultResultsToReturn;
        String query = "";
        SearchResult[] searchResults = null;

        //get parameters, if not empty
        if (request.getParameter("q") != null){
        	query = request.getParameter("q");
        }

       if (request.getParameter("numResultsToSkip") != null){
        	numResultsToSkip = Integer.parseInt(request.getParameter("numResultsToSkip"));
        }
       if (request.getParameter("numResultsToReturn") != null){
        	numResultsToReturn = Integer.parseInt(request.getParameter("numResultsToReturn"));
       }

        //check for invalid numbers, set to default if negative number
        if(numResultsToSkip < 0){
            numResultsToSkip = defaultResultsToSkip;
        }
        if(numResultsToReturn < 0){
            numResultsToReturn = defaultResultsToReturn;
        }

        searchResults = AuctionSearch.basicSearch(query, numResultsToSkip, numResultsToReturn);
        
        request.setAttribute("searchResults", searchResults);

      //need to write searchResults.jsp
        request.getRequestDispatcher("search.jsp").forward(request, response);
        }
        catch(Exception e){
            response.sendRedirect("keywordSearch.html");
        }
    }
}
