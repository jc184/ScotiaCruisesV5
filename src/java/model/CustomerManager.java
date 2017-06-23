/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import DAO.CustomerDataStore;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>This class is a Customer Manager for the Scotia Cruises Web Application</p>
 *
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public class CustomerManager implements Serializable {

    private static final long serialVersionUID = -2499886457273459528L;

    CustomerDataStore customerStore;

    public CustomerManager() {
        customerStore = new CustomerDataStore();
    }

    /* 
     *
     */
    public void addCustomer(String firstname, String surname, String contactNo, String emailAddress, String loginName, String loginPasswd, String countryOrig) {
        for (int newId = 1; newId < Integer.MAX_VALUE; newId++) {
            if (customerStore.getRecord(newId) == null) {
                CustomerBean customer = new CustomerBean(newId, firstname, surname, contactNo, emailAddress, loginName, loginPasswd, countryOrig);
                customerStore.createRecord(customer);
                return;
            }
        }
    }

    /* 
     *
     */
    public CustomerBean updateCustomer(int customerID, String firstname, String surname, String contactNo, String emailAddress, String loginName, String loginPasswd, String countryOrig) {
        CustomerBean newCustomer = new CustomerBean(customerID, firstname, surname, contactNo, emailAddress, loginName, loginPasswd, countryOrig);
        customerStore.removeRecord(customerID);
        customerStore.createRecord(newCustomer);
        return newCustomer;
    }

    /*
     *
     */
    public void removeCustomer(int id) {
        customerStore.removeRecord(id);
    }

    public List<CustomerBean> getFilteredCustomers(String emailAddress) {
        List<CustomerBean> rtnList = new ArrayList<>();
        for (CustomerBean customer : customerStore.getAllRecords()) {
            if (customer.getEmailAddress().equalsIgnoreCase(emailAddress)) { 
                rtnList.add(customer);
            }
        }
        return (rtnList);
    }

//    public Vector<CustomerBean> getFilteredCustomers(String emailAddress) {
//        Vector<CustomerBean> rtnVector = new Vector<CustomerBean>();
//        for (CustomerBean customer : customerStore.getAllRecords()) {
//            if (customer.getEmailAddress().equalsIgnoreCase(emailAddress)) {
//                rtnVector.add(customer);
//            }
//        }
//        return (rtnVector);
//    }
    public CustomerBean getCustomerByName(String loginName, String loginPasswd) {
        for (CustomerBean cb : customerStore.getAllRecords()) {
            if (cb.getLoginName().equals(loginName) && (cb.getLoginPasswd().equals(loginPasswd))) {
                return cb;
            }
        }
        return null;//???
    }

    public int getCustomerIdByAdd(String loginName, String loginPasswd) {
        int customerID = 0;
        for (CustomerBean cb : customerStore.getAllRecords()) {
            if (cb.getLoginName().equals(loginName) && (cb.getLoginPasswd().equals(loginPasswd))) {
                customerID = cb.getCustomerID();
            }
        }
        return customerID;
    }

    /*
     *
     */
    public List<CustomerBean> getAllCustomers() {
        return customerStore.getAllRecords();
    }

//    public Vector<CustomerBean> getAllCustomers() {
//        return customerStore.getAllRecords();
//    }
    public CustomerBean getCustomer(int id) {
        return customerStore.getRecord(id);
    }
}
