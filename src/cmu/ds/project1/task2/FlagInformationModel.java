package cmu.ds.project1.task2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class FlagInformationModel {

    /**
     * Arguments.
     * @param searchTag The user selected country code.
     */

    public String[] doFlagSearch(String searchTag)
            throws IOException {

        String[] countryDetails = new String[3];
        searchTag = URLEncoder.encode(searchTag, "UTF-8");

        String response = "";

        // URL for the page to be screen scraped

        String webURL = "https://www.cia.gov/library/publications/the-world-factbook/geos/" + searchTag + ".html";

        // Fetch the page

        response = fetch(webURL);

        /*
         * Search the page to find the country details URL
         * flagTemp string is to be searched for in order to get close to the data needed
         * to be scraped from the website.
         * If not found, then no such photo is available.
         * Look for the "\"" quote & Snip out the part from positions cutLeftFlag to cutRightFlag
         * and prepend the protocol (i.e. https).
         */

        String flagTemp = "Accessing this modal will display a larger flag with the description'>              <img src=\"..";
        int cutLeftFlag = response.indexOf(flagTemp);
        if (cutLeftFlag == -1) {
            return null;
        }
        cutLeftFlag += flagTemp.length();
        int cutRightFlag = response.indexOf("\"", cutLeftFlag);


        /*
         * Search the URL to find the country description
         * flagURL string is to be searched for in order to get close to the data needed
         * to be scraped from the website.
         * If not found, then no description is available.
         * Look for the "descTemp" & "</div>" & Snip out the part from positions cutLeftFlag to cutRightFlag
         * and prepend the protocol (i.e. https).
         */

        String flagURL = "https://www.cia.gov/library/publications/the-world-factbook" + response.substring(cutLeftFlag, cutRightFlag);

        String descTemp = "<div id=\"field-flag-description\">      <div class='category_data subfield text'>        ";
        int cutLeftDesc = response.indexOf(descTemp);
        if (cutLeftDesc == -1) {
            return null;
        }
        cutLeftDesc += descTemp.length();
        int cutRightDesc = response.indexOf("</div>", cutLeftDesc);
        String description = response.substring(cutLeftDesc, cutRightDesc);

        /*
         * Search the URL to find the country name
         * Look for nameTemp & "</span>" & Snip out the part from positions cutLeftFlag to cutRightFlag
         * and prepend the protocol (i.e. https).
         */

        String nameTemp = "<span class=\"region_name1 countryName\">";
        int cutLeftName = response.indexOf(nameTemp);
        if (cutLeftName == -1) {
            return null;
        }
        cutLeftName += nameTemp.length();
        int cutRightName = response.indexOf("</span>", cutLeftName);
        String name = response.substring(cutLeftName, cutRightName);

        /*
         * Assign the description, flagURL and country name to an array
         */

        countryDetails[0] = description;
        countryDetails[1] = name;
        countryDetails[2] = flagURL;

        return countryDetails;
    }

    /*
     * Make an HTTP request to a given URL
     * @param urlString The URL of the request
     * @return A string of the response from the HTTP GET.
     */

    private String fetch(String urlString) {
        String response = "";
        try {
            URL url = new URL(urlString);
            /*
             * Create an HttpURLConnection.  This is useful for setting headers
             * and for getting the path of the resource that is returned (which
             * may be different than the URL above if redirected).
             * HttpsURLConnection (with an "s") can be used if required by the site.
             */            // Read all the text returned by the server

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();


            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String str;

            /*
             * Read each line of "in" until done, adding each to "response"
             * str is one line of text readLine() strips newline characters
             */

            while ((str = in.readLine()) != null) {
                response += str;
            }
            in.close();
        } catch (IOException e) {
            System.out.println("Country Details Not Found");
        }
        return response;
    }
}