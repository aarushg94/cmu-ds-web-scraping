package cmu.ds.project1.task2;

/*
 * This models the business logic for the web application. In this case, the
 * business logic involves making a request to cia.gov and then screen scraping
 * the HTML that is returned in order to fabricate an image, description and
 * country name.
 */

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FlagInformationServlet",
        urlPatterns = {"/getFlagInformation"})
public class FlagInformationServlet extends HttpServlet {

    /*
     * Defines the business model
     * Initiate this servlet by instantiating the model that it will use.
     */

    FlagInformationModel fim = null;

    @Override
    public void init() {
        fim = new FlagInformationModel();
    }

    /*
     * This servlet will reply to HTTP GET requests via this doGet method
     */

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        /*
         * Obtain the code of the country (2 digit) from the user input via flagCode
         */

        String flagCode = request.getParameter("flagCode");
        String ua = request.getHeader("User-Agent");
        boolean mobile;

        // Appropriate DOCTYPE for the view pages

        if (ua != null && ((ua.indexOf("Android") != -1) || (ua.indexOf("iPhone") != -1))) {
            mobile = true;
            request.setAttribute("doctype", "<!DOCTYPE html PUBLIC \"-//WAPFORUM//DTD XHTML Mobile 1.2//EN\" \"http://www.openmobilealliance.org/tech/DTD/xhtml-mobile12.dtd\">");
        } else {
            mobile = false;
            request.setAttribute("doctype", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
        }

        /*
          Declare the variable for the view to be rendered
         */

        String nextView;

        /*
         * Check if the user selected value parameter is present.
         * If there is a search parameter, then do the search and return the result
         * else display the same page again
         */

        if (flagCode != null) {
            // use model to do the search and choose the result view

            String[] countryDetails = fim.doFlagSearch(flagCode.toLowerCase());

            /*
             * Attributes on the request object can be used to pass data to
             * the view.  These attributes are name/value pairs, where the name
             * is a String object.  Here the countryDetails is passed to the view
             * after it is returned from the model interestingPictureSize method.
             */

            request.setAttribute("countryDescription", countryDetails[0]);
            request.setAttribute("countryName", countryDetails[1]);
            request.setAttribute("countryFlag", countryDetails[2]);

            /*
             * Pass the array of strings - countryDetails to the view which consists of
             * the country name, country flag image url and country description
             */

            nextView = "result.jsp";
        } else {

            // no user selected value parameter so choose the prompt view

            nextView = "index.jsp";
        }

        // Transfer control over the the correct "view"

        RequestDispatcher view = request.getRequestDispatcher(nextView);
        view.forward(request, response);

    }
}