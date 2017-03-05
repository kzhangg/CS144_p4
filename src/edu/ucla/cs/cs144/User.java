package edu.ucla.cs.cs144;

public class User {
   private String userId;
   private String rating;
   private Location location;
   private String country;
   
   public User(){}

   public User(String userId,  String rating,  Location location,  String country) {
      this.userId = userId;
      this.rating = rating;
      this.location = location;
      this.country = country;
   }
   
   public String getUserId() {
      return userId;
   }
   
   public String getRating() {
      return rating;
   }
   
   public Location getLocation() {
      return location;
   }
   
   public String getCountry() {
      return country;
   }
}
