package edu.ucla.cs.cs144;

public class BidResult implements Comparable<BidResult> {
    private String bidderId;
    private String rating;
    private String location;
    private String country;
    private String time;
    private String amount;

    public BidResult() {}

    public BidResult(String id, String rating, String time, String amount) {
        this.bidderId = id;
        this.rating = rating;
        this.time = time;
        this.amount = amount;
    }


    public int compareTo(BidResult other) {
        return other.getBidTime().compareTo(this.getBidTime());
    }


    public String getBidderId() {
        return bidderId;
    }

    public String getBidderRating() {
        return rating;
    }

    public String getBidderLocation() {
        return location;
    }

    public void setBidderLocation(String location){
        this.location = location;
    }

    public String getBidderCountry() {
        return country;
    }

    public void setBidderCountry(String country){
        this.country = country;
    }


    public String getBidTime() {
        return time;
    }

    public String getBidAmount() {
        return amount;
    }
}