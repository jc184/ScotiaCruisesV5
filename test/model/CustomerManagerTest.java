/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author james
 */
public class CustomerManagerTest {
    
    public CustomerManagerTest() {
    }

    /**
     * Test of addCustomer method, of class CustomerManager.
     */
    @Test
    public void testAddCustomer() {
        System.out.println("addCustomer");
        String firstname = "";
        String surname = "";
        String contactNo = "";
        String emailAddress = "";
        String loginName = "";
        String loginPasswd = "";
        String countryOrig = "";
        CustomerManager instance = new CustomerManager();
        instance.addCustomer(firstname, surname, contactNo, emailAddress, loginName, loginPasswd, countryOrig);
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateCustomer method, of class CustomerManager.
     */
    @Test
    public void testUpdateCustomer() {
        System.out.println("updateCustomer");
        int customerID = 0;
        String firstname = "";
        String surname = "";
        String contactNo = "";
        String emailAddress = "";
        String loginName = "";
        String loginPasswd = "";
        String countryOrig = "";
        CustomerManager instance = new CustomerManager();
        CustomerBean expResult = null;
        CustomerBean result = instance.updateCustomer(customerID, firstname, surname, contactNo, emailAddress, loginName, loginPasswd, countryOrig);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of removeCustomer method, of class CustomerManager.
     */
    @Test
    public void testRemoveCustomer() {
        System.out.println("removeCustomer");
        int id = 0;
        CustomerManager instance = new CustomerManager();
        instance.removeCustomer(id);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFilteredCustomers method, of class CustomerManager.
     */
    @Test
    public void testGetFilteredCustomers() {
        System.out.println("getFilteredCustomers");
        String emailAddress = "";
        CustomerManager instance = new CustomerManager();
        List<CustomerBean> expResult = null;
        List<CustomerBean> result = instance.getFilteredCustomers(emailAddress);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCustomerByName method, of class CustomerManager.
     */
    @Test
    public void testGetCustomerByName() {
        System.out.println("getCustomerByName");
        String loginName = "";
        String loginPasswd = "";
        CustomerManager instance = new CustomerManager();
        CustomerBean expResult = null;
        CustomerBean result = instance.getCustomerByName(loginName, loginPasswd);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCustomerIdByAdd method, of class CustomerManager.
     */
    @Test
    public void testGetCustomerIdByAdd() {
        System.out.println("getCustomerIdByAdd");
        String loginName = "";
        String loginPasswd = "";
        CustomerManager instance = new CustomerManager();
        int expResult = 0;
        int result = instance.getCustomerIdByAdd(loginName, loginPasswd);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllCustomers method, of class CustomerManager.
     */
    @Test
    public void testGetAllCustomers() {
        System.out.println("getAllCustomers");
        CustomerManager instance = new CustomerManager();
        List<CustomerBean> expResult = null;
        List<CustomerBean> result = instance.getAllCustomers();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCustomer method, of class CustomerManager.
     */
    @Test
    public void testGetCustomer() {
        System.out.println("getCustomer");
        int id = 0;
        CustomerManager instance = new CustomerManager();
        CustomerBean expResult = null;
        CustomerBean result = instance.getCustomer(id);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }
    
}
