<%@ page import="edu.ucla.cs.cs144.ItemResult" %>
<%@ page import="edu.ucla.cs.cs144.BidResult" %>
<% ItemResult item = (ItemResult) request.getAttribute("Item"); %>
<!DOCTYPE html>
<html>
    <head>
        <title>eBay Item Info</title>

        <style type="text/css">
          #map_canvas {
            height: 100%;
            width: 70vw;
          }

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
        #orange{
          color: #fcba6f;
        }


        #results{
          display: flex;
          flex-direction: row;
          margin-top: 30px;
        }
        .column{
          margin-left: 10px;
          margin-right: 10px;
          width: 250px;
        }
        .column-big{
          width: 400px !important;
        }
        #results p{
          display: block;
          font-size: 20px;
          font-family: Roboto;
          color: #BFBFBF;
          text-decoration: none;
          letter-spacing: .5px;
          margin-top: -12px;
        }

        .result{
          transition: .8s;
        }

        .result-hidden{
          opacity: 0;
          margin-top: 30px;
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

        <script type="text/javascript"
            src="http://maps.google.com/maps/api/js?sensor=false">
        </script>
        <script type="text/javascript">

          var geocoder;

          function initialize() {
            var latitude = parseFloat(<%= item.getLatitude() %>);
            var longitude = parseFloat(<%= item.getLongitude() %>);

            geocoder = new google.maps.Geocoder();
            if (isNaN(latitude)) {
              latitude = 0.0;
              longitude = 0.0;
              zoom = 2;
            }

            var latlng = new google.maps.LatLng(latitude, longitude);
            var myOptions = {
              zoom: 10,
              center: latlng,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"),
                myOptions);

            var marker = new google.maps.Marker({
              position: latlng,
              map: map
            });


          }
          var appear = function(itemList, it, n){
            if(it < n){
              itemList[it].classList.add("result");
              itemList[it].classList.remove("result-hidden");
              it++;
              setTimeout(function(){ appear(itemList,it,n); },250);
            }
          }
          var listAnimation = function(){
              var listItems = document.getElementsByClassName("column");
              var l= listItems.length;
              appear(listItems,0,l);
          }
          window.onload = function () {
              listAnimation();
              initialize();
              var oTextbox = new AutoSuggestControl(document.getElementById("keyword-search"), new SuggestionProvider());
          }


        </script>



    </head>

    <body>

        <div id = "navbar">
          <form id="searchWrapper" action="./item" method="GET">
                <input id="searchInput" name="itemId" type="text" value="Input Item ID"/>
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



        <div id="map_canvas" style="width:100%; height:450px"></div>

        <div id = "wrapper">
            <div id = "header"><span id=orange style="size:32px; letter-spacing: 3px;"> <%= item.getName() %> </span><br></div>
              <div id = "results">
                  <div class="column result-hidden">
                    <% if (item.getBuyPrice() != "") { %>
                      <p>Buy Price: $<%= item.getBuyPrice() %> <a href="./paynow.jsp">Pay Now!</a></p>
                    <% } %>
                  </div>
                  <div class="column result-hidden">
                    <p><span id=orange>Categories:</span></p><br>
                    <% String [] categories = item.getCategories(); %>
                    <% Integer len = categories.length; %>
                    <% int it; %>
                    <% for (it = 0; it < len; it++) { %>
                      <p><%= categories[it] %></p>
                    <% } %>
                  </div>

                  <div class="column column-big result-hidden">
                      <p><span id=orange>Description: </span><%= item.getDescription() %> </p>
                  </div>


                  <div class="column result-hidden">
                    <p><span id=orange>Started: </span><%= item.getStarted() %> </p>
                    <p><span id=orange>Ends: </span><%= item.getEnds() %> </p>
                    <p><span id=orange>Currently: </span><%= item.getCurrently() %></p>
                    <p><span id=orange>First Bid: </span><%= item.getFirstBid() %></p>
                    <p><span id=orange>Number of Bids: </span><%= item.getNumberOfBids() %></p>
                  </div>


                  <div class="column result-hidden">
                    <p><span id=orange>Seller ID: </span><%= item.getSellerId() %></p>
                    <p><span id=orange>Seller Rating: </span><%= item.getSellerRating() %></p>
                  </div>

                  <div class="column result-hidden">
                    <% if (Integer.parseInt(item.getNumberOfBids()) != 0) { %>
                      <p><span id=orange>Bids: </span></p>
                      <% for (BidResult bid : item.getBids()) { %>
                        <p>
                          <%= bid.getBidTime() %> <br />
                          Amount: <%= bid.getBidAmount() %> <br />
                          Bidder: <%= bid.getBidderId() %> <br />
                          Bidder Rating: <%= bid.getBidderRating() %> <br />
                          Location: <%= bid.getBidderLocation() %> <br />
                          Country: <%= bid.getBidderCountry() %> <br />
                        </p><br>
                      <% } %>
                    <% } %>
                    </div>
                  </div>
            </div>
        </div>
    </body>
</html>
