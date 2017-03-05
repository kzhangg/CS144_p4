package edu.ucla.cs.cs144;

public class ItemResult {
   private String itemId;
   private String name;
   private String[] categories;
   private String currently;
   private String buyPrice;
   private String firstBid;
   private String numberOfBids;
   private Bid[] bids;
   private String started;
   private String ends;
   private Location location;
   private String country;
   private User seller;
   private String description;

   public ItemResult() {}

   public ItemResult(final String itemId, String name, String[] categories, String currently, String buyPrice, String firstBid, String numberOfBids, Bid[] bids, String started, String ends, Location location, String country, User seller, String description ) {
      this.itemId = itemId;
      this.name = name;
      this.categories = categories;
      this.currently = currently;
      this.buyPrice = buyPrice;
      this.firstBid = firstBid;
      this.numberOfBids = numberOfBids;
      this.bids = bids;
      this.started = started;
      this.ends = ends;
      this.location = location;
      this.country = country;
      this.seller = seller;
      this.description = description;

   }

   public String getItemId() {
      return itemId;
   }

   public void setItemId(String itemId){
   		this.itemId = itemId;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String[] getCategories() {
      return categories;
   }

   public void setCategories(String[] categories) {
      this.categories = categories;
   }

   public String getCurrently() {
      return currently;
   }

   public void setCurrently(String currently) {
      this.currently = currently;
   }


   public String getBuyPrice() {
      return buyPrice;
   }

   public void setBuyPrice(String buyPrice) {
      this.buyPrice = buyPrice;
   }

   public String getFirstBid() {
      return firstBid;
   }

   public void setFirstBid(String firstBid) {
      this.firstBid = firstBid;
   }
   
   public String getNumberOfBids() {
      return numberOfBids;
   }

   public void setNumberOfBids(String numberOfBids) {
      this.numberOfBids = numberOfBids;
   }

   public Bid[] getBids() {
      return bids;
   }

   public void setBids(Bid[] bids) {
      this.bids = bids;
   }


   public String getStarted() {
      return started;
   }

   public void setStarted(String started) {
      this.started = started;
   }

   public String getEnds() {
      return ends;
   }

   public void setEnds(String ends) {
      this.ends = ends;
   }

   public Location getLocation() {
      return location;
   }

   public void setLocation(Location location) {
      this.location = location;
   }


   public String getCountry() {
      return country;
   }

   public void setCountry(String country) {
      this.country = country;
   }

   public User getSeller() { 
      return seller;
   }

   public void setSeller(User seller) { 
      this.seller = seller;
   }

   public String getDescription() {
      return description;
   }   
   
   public void setDescription(String description) {
      this.description = description;
   }

   
}