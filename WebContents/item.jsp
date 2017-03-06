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
        #logo{
          position: fixed;
          left: 30px;
          top: 30px;
          width: 80px;
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
          <div id = "logo" onclick="window.location.href='/eBay'">
                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 viewBox="0 0 500 200" style="enable-background:new 0 0 500 200;" xml:space="preserve">
              <style type="text/css">
                .st0{fill:#fcba6f;}
              </style>
              <g>
                <path class="st0" d="M192.2,61.9c-18.4,0-31.3,9-36.6,18.9V9.2h-21.4v98.4c-8.1-17.4-24.2-28-47.1-28c-27.8,0-52.9,23.7-52.9,58.4
                  c0,37.5,26,59.1,55.7,59.1c20.4,0,35.7-9.7,44.3-23.4v1.9h21.4v-16.1c6.9,12,19.5,19.1,35.9,19.1c32.9,0,51.5-26,51.5-58.9
                  C243,87.6,225.8,61.9,192.2,61.9z M87.4,98.7c19.5,0,29.9,12.4,30.4,28.3H57.2C58.2,112.7,69.2,98.7,87.4,98.7z M121,155.8
                  c-4.1,12.4-13.1,22.3-31,22.3c-18.6,0-32.9-13.8-33.3-33.6h77.7v15.9L121,155.8z M188.3,159.4c-19.1,0-32.9-15.6-32.9-39.6
                  c0-23.9,13.8-38.9,32.9-38.9c20,0,32.7,14.9,32.7,38.9C220.9,143.7,208,159.4,188.3,159.4z"/>
                <path class="st0" d="M334.9,120.1c0-21.6-12.9-40.5-46-40.5c-23.9,0-43,14.7-45.3,35.9l20.7,4.8c1.4-12.9,9.9-22.3,25.1-22.3
                  c16.8,0,23.9,9,23.9,19.8c0,3.9-1.8,7.4-8.5,8.3l-29.9,4.4c-19.1,2.8-33.6,13.8-33.6,33.6c0,17.5,14.5,33.1,37,33.1
                  c19.8,0,30.8-10.6,35.6-18.4c0,8.1,0.7,12.2,1.2,15h21.2c-0.5-2.8-1.4-8.5-1.4-18.2V120.1z M313.3,146.3c0,24.1-14.3,32.7-32,32.7
                  c-11,0-17.9-7.8-17.9-16.1c0-9.9,6.9-15.2,16.1-16.6l33.8-5.1V146.3z"/>
                <path class="st0" d="M447.3,115.6c0-34.5-19.1-58-53.1-58c-27.8,0-52.9,23.7-52.9,58.4c0,37.5,26,59.1,55.7,59.1
                  c25.8,0,43.5-15.4,49.7-35l-18.6-6.4c-4.1,12.4-13.1,22.3-31,22.3c-18.6,0-32.9-13.8-33.3-33.6h83.3
                  C447,121.1,447.3,118.3,447.3,115.6z M364.2,105c0.9-14.3,12-28.3,30.1-28.3c19.5,0,29.9,12.4,30.4,28.3H364.2z"/>
              </g>
              </svg>
          </div>
          <form id="searchWrapper" action="./item" method="GET">
                <input id="searchInput" name="id" type="text" value="Input Item ID"/>
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
