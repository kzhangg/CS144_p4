package edu.ucla.cs.cs144;

import java.net.URL;
import java.net.URI;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;

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
        try{
          URL url = new URL("http://google.com/complete/search?output=toolbar&q=" + request.getParameter("query"));
          HttpURLConnection c = (HttpURLConnection) url.openConnection();
          if (c.getResponseCode() == HttpURLConnection.HTTP_OK){

              response.setContentType("text/xml");
              BufferedReader br = new BufferedReader(new InputStreamReader(c.getInputStream()));
              String newLine;
              StringBuffer result = new StringBuffer();

              while((newLine = br.readLine()) != null){
                result.append(newLine);
              }
              br.close();

              System.out.println(result.toString());
              response.getWriter().write(result.toString());
          }
        } catch(Exception e){
          response.sendRedirect("badRequest.html");
        }
    }
}
