package edu.ucla.cs.cs144;

import java.util.*;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import org.w3c.dom.Text;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

public class MyParser {

    /* Non-recursive (NR) version of Node.getElementsByTagName(...)
 */
    static Element[] getElementsByTagNameNR(Element e, String tagName) {
        Vector< Element > elements = new Vector< Element >();
        Node child = e.getFirstChild();
        while (child != null) {
            if (child instanceof Element && child.getNodeName().equals(tagName))
            {
                elements.add( (Element)child );
            }
            child = child.getNextSibling();
        }
        Element[] result = new Element[elements.size()];
        elements.copyInto(result);
        return result;
    }

    /* Returns the first subelement of e matching the given tagName, or
     * null if one does not exist. NR means Non-Recursive.
     */
    static Element getElementByTagNameNR(Element e, String tagName) {
        Node child = e.getFirstChild();
        while (child != null) {
            if (child instanceof Element && child.getNodeName().equals(tagName))
                return (Element) child;
            child = child.getNextSibling();
        }
        return null;
    }

    /* Returns the text associated with the given element (which must have
     * type #PCDATA) as child, or "" if it contains no text.
     */
    static String getElementText(Element e) {
        if (e.getChildNodes().getLength() == 1) {
            Text elementText = (Text) e.getFirstChild();
            return elementText.getNodeValue();
        }
        else
            return "";
    }

    /* Returns the text (#PCDATA) associated with the first subelement X
     * of e with the given tagName. If no such X exists or X contains no
     * text, "" is returned. NR means Non-Recursive.
     */
    static String getElementTextByTagNameNR(Element e, String tagName) {
        Element elem = getElementByTagNameNR(e, tagName);
        if (elem != null)
            return getElementText(elem);
        else
            return "";
    }

    static String date(String str) {
        SimpleDateFormat forward = new SimpleDateFormat("MMM-dd-yy HH:mm:ss");
        SimpleDateFormat backward = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String reverse = "";
        try {
            Date original = forward.parse(str);
            reverse = backward.format(original);
        } catch (ParseException e) {
            System.out.println("ERROR: Cannot parse \"" + str + "\"");
        }
        return reverse;
    }

//start here
    static ItemResult convertToItem(Element item) throws Exception {
        Node n = item.getAttributes().getNamedItem("ItemID");

        String itemId = n.getNodeValue();
        String name = getElementTextByTagNameNR(item, "Name");
        String currently = getElementTextByTagNameNR(item, "Currently");
        String firstBid = getElementTextByTagNameNR(item, "First_Bid");
        String buyPrice = getElementTextByTagNameNR(item, "Buy_Price");
        String numberOfBids = getElementTextByTagNameNR(item, "Number_of_Bids");
        String location = getElementTextByTagNameNR(item, "Location");
        String country = getElementTextByTagNameNR(item, "Country");
        String started = date(getElementTextByTagNameNR(item, "Started"));
        String ends = date(getElementTextByTagNameNR(item, "Ends"));
        String longitude = getElementByTagNameNR(item, "Location").getAttribute("Longitude");
        String latitude = getElementByTagNameNR(item, "Location").getAttribute("Latitude");
        String sellerId = getElementByTagNameNR(item, "Seller").getAttribute("UserID");
        String sellerRating = getElementByTagNameNR(item, "Seller").getAttribute("Rating");
        String description = getElementTextByTagNameNR(item, "Description");
        if (description.length() > 4000) description = description.substring(0, 4000);

        //get categories    
        Element[] category = getElementsByTagNameNR(item, "Category");
        ArrayList<String> categories = new ArrayList<String>();

        for(int i = 0; i < category.length; i++){
            categories.add(category[i].getTextContent());
        }
        
        //convert to array form 
        String[] categoryFinal = new String[categories.size()];
        categoryFinal = categories.toArray(categoryFinal);

        //get bids

        Element[] bids = getElementsByTagNameNR(getElementByTagNameNR(item, "Bids"), "Bid");
        ArrayList<BidResult> bidList = new ArrayList<BidResult>();
             
        for(int i = 0; i < bids.length; i++){
            String bidderId = getElementByTagNameNR(bids[i], "Bidder").getAttribute("UserID");
            String bidderRating = getElementByTagNameNR(bids[i], "Bidder").getAttribute("Rating");
            String bidderLocation = getElementTextByTagNameNR(getElementByTagNameNR(bids[i], "Bidder"), "Location");
            String bidderCountry = getElementTextByTagNameNR(getElementByTagNameNR(bids[i], "Bidder"), "Country");
            String time = date(getElementTextByTagNameNR(bids[i], "Time"));
            String amount = getElementTextByTagNameNR(bids[i], "Amount");

            BidResult b = new BidResult(bidderId, bidderRating, time, amount);
            b.setBidderLocation(bidderLocation);
            b.setBidderCountry(bidderCountry);

            bidList.add(b);
            
        }
        
        Collections.sort(bidList);
        BidResult[] bidFinal = new BidResult[bidList.size()];
        bidFinal = bidList.toArray(bidFinal);

/*
         ItemResult(itemId, name, currently, firstBid, numberOfBids,
                      started, ends, sellerId, sellerRating, description) 

*/
        ItemResult i = new ItemResult(itemId, name, currently, firstBid, numberOfBids, started, ends, sellerId, sellerRating, description);
        i.setBuyPrice(buyPrice);
        i.setLocation(location);
        i.setCountry(country);
        i.setLongitude(latitude);
        i.setLatitude(longitude);
        i.setCategories(categoryFinal);
        i.setBids(bidFinal);

        return i;
    }
}