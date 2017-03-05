package edu.ucla.cs.cs144;

public class UserResult {
   private String userId;
   private String rating;
   private String location;
   private String country;
   
   public UserResult(){}

   public UserResult(String userId,  String rating,  String location,  String country) {
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
   
   public String getLocation() {
      return location;
   }
   
   public String getCountry() {
      return country;
   }
}
