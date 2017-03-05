package edu.ucla.cs.cs144;

public class ItemResult {

    private String itemId;
    private String name;
    private String[] categories;
    private String currently;
    private String firstBid;
    private String buyPrice;
    private String numberOfBids;
    private BidResult[] bids;
    private String location;
    private String country;
    private String started;
    private String ends;
    private String longitude;
    private String latitude;
    private String sellerId;
    private String sellerRating;
    private String description;



    public ItemResult() {}

    public ItemResult(String itemId, String name, String currently, String firstBid, String numberOfBids,
                      String started, String ends, String sellerId, String sellerRating, String description) {
        this.itemId = itemId;
        this.name = name;
        this.currently = currently;
        this.firstBid = firstBid;
        this.numberOfBids = numberOfBids;
        this.started = started;
        this.ends = ends;
        this.sellerId = sellerId;
        this.sellerRating = sellerRating;
        this.description = description;
    }


    public String[] getCategories() {
        return categories;
    }

    public void setCategories (String[] categories) {
        this.categories = categories;
    }

    public BidResult[] getBids() {
        return bids;
    }

    public void setBids(BidResult[] bids) {
        this.bids = bids;
    }

    public String getItemId() {
        return itemId;
    }

    public String getName() {
        return name;
    }

    public String getCurrently() {
        return currently;
    }

    public String getFirstBid() {
        return firstBid;
    }

    public String getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice (String buyPrice) {
        if (buyPrice != null)
            this.buyPrice = buyPrice;
    }

    public String getNumberOfBids() {
        return numberOfBids;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location){
        this.location = location;
    }
    public String getCountry() {
        return country;
    }

    public void setCountry(String country){
        this.country = country;
    }

    public String getStarted() {
        return started;
    }

    public String getEnds() {
        return ends;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude){
        if(longitude != null){
            this.longitude = longitude;
        }
        else 
            this.longitude = "";
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude){
        if(latitude != null){
            this.latitude = latitude;
        }
        else 
            this.latitude = "";
                
    }

    public String getSellerId() {
        return sellerId;
    }

    public String getSellerRating() {
        return sellerRating;
    }

    public String getDescription() {
        return description;
    }

}