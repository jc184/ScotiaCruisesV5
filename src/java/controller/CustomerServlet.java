package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomerBean;
import model.CustomerManager;

/**
 * <p>
 * This class is a Customer Servlet for the Scotia Cruises Web Application</p>
 *
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public class CustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 499360602703276329L;

    CustomerManager customerManager;

    @Override
    public void init() throws ServletException {
        customerManager = new CustomerManager();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.jsp";

        String submit = request.getParameter("submit");
        if (submit != null && submit.length() > 0) {
            if (submit.equals("add")) {
                String firstname = request.getParameter("firstname");
                String surname = request.getParameter("surname");
                String contactNo = request.getParameter("contactNo");
                String emailAddress = request.getParameter("emailAddress");
                String loginName = request.getParameter("loginName");
                String loginPasswd = request.getParameter("loginPasswd");
                String countryOrig = request.getParameter("countryOrig");
                String regex = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
                if (firstname.equalsIgnoreCase("") || surname.equalsIgnoreCase("") || contactNo.equalsIgnoreCase("") || emailAddress.equalsIgnoreCase("") || !emailAddress.matches(regex) || loginName.equalsIgnoreCase("") || loginPasswd.equalsIgnoreCase("")) {
                    url = "/scotiavalidation.jsp";
                } else {
                    customerManager.addCustomer(firstname, surname, contactNo, emailAddress, loginName, loginPasswd, countryOrig);
                    int customerID = customerManager.getCustomerIdByAdd(loginName, loginPasswd);
                    request.setAttribute("customerID", customerID);
                    url = "/scotiaregconfirmation.jsp";
                }
            } else if (submit.equals("add new")) {
                url = "/addCustomer.jsp";

            } else if (submit.equals("register")) {
                url = "/addCustomer.jsp";

            } else if (submit.equals("home")) {
                url = "/HomePage.jsp";

            } else if (submit.equals("view all")) {
                String filter = request.getParameter("filter");
                if (filter == null || filter.length() < 1) {
                    request.setAttribute("customerStore", customerManager.getAllCustomers());
                } else {
                    request.setAttribute("customerStore", customerManager.getFilteredCustomers(filter));
                }
                url = "/displayAllCustomersStaff.jsp";

            } else if (submit.equals("enter email")) {
                String filter = request.getParameter("emailAddress");
                if (filter.equalsIgnoreCase("")) {
                    url = "/scotiavalidation.jsp";
                } else {
                    request.setAttribute("customerStore", customerManager.getFilteredCustomers(filter));
                    url = "/displayCustomer.jsp";
                }

            } else if (submit.equals("email address")) {
                String filter = request.getParameter("filter");
                if (filter == null || filter.length() < 1) {
                    request.setAttribute("customerStore", customerManager.getAllCustomers());
                } else {
                    request.setAttribute("customerStore", customerManager.getFilteredCustomers(filter));
                }
                url = "/displayAllCustomersStaff.jsp";

            } else if (submit.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                CustomerBean customer = customerManager.getCustomer(id);
                request.setAttribute("customer", customer);
                url = "/updateCustomer.jsp";

            } else if (submit.equals("edit")) {
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                String firstname = request.getParameter("firstname");
                String surname = request.getParameter("surname");
                String contactNo = request.getParameter("contactNo");
                String emailAddress = request.getParameter("emailAddress");
                String loginName = request.getParameter("loginName");
                String loginPasswd = request.getParameter("loginPasswd");
                String countryOrig = request.getParameter("countryOrig");
                String regex = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
                if (firstname.equalsIgnoreCase("") || surname.equalsIgnoreCase("") || contactNo.equalsIgnoreCase("") || emailAddress.equalsIgnoreCase("") || !emailAddress.matches(regex)|| loginName.equalsIgnoreCase("") || loginPasswd.equalsIgnoreCase("")) {
                    url = "/scotiavalidation.jsp";
                } else {
                    customerManager.updateCustomer(customerID, firstname, surname, contactNo, emailAddress, loginName, loginPasswd, countryOrig);
                    request.setAttribute("customerStore", customerManager.getAllCustomers());
                    request.setAttribute("customerID", customerID);
                    url = "/scotiaregconfirmation.jsp";
                }
            } else if (submit.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                customerManager.removeCustomer(id);
                request.setAttribute("customerStore", customerManager.getAllCustomers());
                url = "/deleteConfirmation.jsp";

            } 
        }
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);//THIS WAS MISSING. PRESUMABLY SHOULD HAVE BEEN THERE. 10-04-2017
    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,
            IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    } // </editor-fold>

}
