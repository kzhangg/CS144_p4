package edu.ucla.cs.cs144;

public class Location {
   private String name;
   private String latitude;
   private String longitude;


   //default
   public Location(String name) {
      this.name = name;
      this.latitude = "null";
      this.longitude = "null";
   }

   public Location(String name, String latitude, String longitude) {
      this.name = name;
      this.latitude = latitude;
      this.longitude = longitude;
   }

   public String getName() {
      return name;
   }

   public String getLatitude() {
      if (latitude != "") {
         return latitude; 
      }
   }

   public void setLatitude(final String latitude) {
      this.latitude = latitude;
   }

   public String getLongitude() {
      if (longitude != "") {
         return longitude; 
      }
   }

   public void setLongitude(final String longitude) {
      this.longitude = longitude;
   }
}