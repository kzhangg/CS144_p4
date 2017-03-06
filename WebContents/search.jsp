<%@ page import="edu.ucla.cs.cs144.SearchResult" %>
<!DOCTYPE html>
<html>
    <head>
        <title>eBay Search Results</title>
         <style>

               body{
                 margin: 0;
               }

              #navbar{
                width: 100vw;
                background-color: #F6F6F6;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80px;
                border: none;
              }

              #searchWrapper{
                display: flex;
                align-items: center;
                justify-content: center;
                height: 80px;
              }

              #searchInput{
                border-radius: 0px !important;
                color: #BFBFBF;
                background: #fff;
                font-family: Roboto;
                font-size: 20px;
                text-align: center;
                letter-spacing: 1px;
                border: 1px solid #BFBFBF;
                border-radius: 16px !important;
                height: 30px;
                width: 260px;
                transition: .5s;

              }

              #searchInput:focus{
                outline: none !important;
                border: 1px solid #fcba6f;
                color: #fcba6f;
              }

              #searchButton{
                margin-left: 9px;
                width: 100px;
                height: 30px;
                background-color: #fcba6f;
                color: #fff;
                font-family: Roboto;
                font-size: 14px;
                letter-spacing: 1.5px;
                text-align: center;
                border-radius: 40px;
                border: 2px solid #fcba6f;
                cursor: pointer;
              }

             #wrapper{
               width: 100vw;
               margin-top: 40px;
               display: flex;
               align-items: center;
               justify-content: center;
               flex-direction: column;
               margin-bottom: 150px;
             }

             #header{
               height: 60px;
               font-size: 36px;
               font-family: Roboto;
               color: #979797;
               margin-bottom: 20px;
             }
             #query{
               color: #fcba6f;
               size: 36px;
             }


             #results{
               display: flex;
               flex-direction: row;
               margin-top: 30px;
             }
             .column{
               margin-left: 20px;
               margin-right: 20px;
             }
             #results a{
               display: block;
               font-size: 20px;
               font-family: Roboto;
               color: #BFBFBF;
               text-decoration: none;
               letter-spacing: .5px;
               margin-top: -12px;
             }

             .result{
               transition: .2s;
             }

             .result-hidden{
               opacity: 0;
               margin-left: 10px;
             }

             .result-visible{
               opacity: 1;
               margin-left: 0px;

             }


             .pageButton{
               width: 200px;
               height: 40px;
               background-color: #fff;
               color: #fcba6f;
               font-family: Roboto;
               font-size: 16px;
               letter-spacing: 2px;
               text-align: center;
               border-radius: 40px;
               border: 2px solid #fcba6f;
               cursor: pointer;
               margin-left: 4px;
               margin-right: 4px;
             }

             #nextWrapper{
                margin-top: 60px;
             }

             #noResults{
               font-size: 36px;
               font-family: Roboto;
               color: #fcba6f;
             }

        </style>
        <script type="text/javascript" src="suggest.js"></script>
        <script type="text/javascript">
            var appear = function(itemList, it, n){
              if(it < n){
                itemList[it].classList.add("result");
                itemList[it].classList.remove("result-hidden");
                setTimeout(function(){ appear(itemList,it+1,n); },50);
              }
            }
            var listAnimation = function(){
              var listItems = document.getElementsByClassName("result-hidden");
              var len = listItems.length;
              appear(listItems,0,len);
            }
            window.onload = function () {
                listAnimation();
                var oTextbox = new AutoSuggestControl(document.getElementById("keyword-search"), new SuggestionProvider());
            }
        </script>
    </head>

    <body>
         <% String query = request.getParameter("q");
          Integer numResultsToSkip = Integer.parseInt(request.getParameter("numResultsToSkip"));
          Integer numResultsToReturn = Integer.parseInt(request.getParameter("numResultsToReturn"));
          SearchResult[] results = (SearchResult[]) request.getAttribute("searchResults");
          Integer count = results.length;%>


          <div id = "navbar">
            <form id="searchWrapper" action="./search" method="GET">
                  <input id="searchInput" name="q" type="text" autocomplete="off"/>
                  <input name="numResultsToSkip" type="hidden" value="0" />
                  <input name="numResultsToReturn" type="hidden" value="20" />
                  <button id="searchButton" type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="13">
                      <g stroke-width="2" stroke="#fff" fill="none">
                        <path d="M11.29 11.71l-4-4"/>
                          <circle cx="5" cy="5" r="4"/>
                        </g>
                    </svg>
                  </button>

              </form>
        </div>

        <div id = "wrapper">

          <div id = "header">Results for <span id=query> <%= query %> </span><br></div>

              <div id = "results">
                <% if (count > 0) {%>
                  <div class="column">
                    <% for (SearchResult result : results) { %>
                      <a class="result-hidden" href="./item?id=<%= result.getItemId() %>"> <%=result.getName() %></a><br>
                    <% } %>
                  </div>
              <% } %>
              <% if (count <= 0) {%>
                <div id="noResults">
                  No Results.
                </div>
              <% } %>

          </div>

          <div id="nextWrapper">
            <% if (numResultsToSkip != 0) { %>
              <button onclick="window.location.href='/eBay/search?q=<%= query %>&amp;numResultsToSkip=<%= numResultsToSkip-20 %>&amp;numResultsToReturn=20'" class= "pageButton" type="submit">Prev</button>
            <% } %>
            <% if (results.length >= 20) { %>
              <button onclick="window.location.href='/eBay/search?q=<%= query %>&amp;numResultsToSkip=<%= numResultsToSkip+20 %>&amp;numResultsToReturn=20'"  class= "pageButton" type="submit">Next</button>
            <% } %>
          </div>

        </div>


    </body>
</html>