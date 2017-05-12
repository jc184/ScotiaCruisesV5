
package model;

import java.io.Serializable;

/**
 * <p>This class is a Customer Bean for the Scotia Cruises Web Application</p>
 * @author James Chalmers 08003323 BSc Computing
 * @version 5.0
 */
public class CustomerBean implements Serializable {

    private static final long serialVersionUID = 390331347431377959L;
    
    private int customerID;
    private String firstname;
    private String surname;
    private String contactNo;
    private String emailAddress;
    private String loginName;
    private String loginPasswd;
    private String countryOrig;

    /*
     * Constructor:
     */
    public CustomerBean(int customerID, String firstname, String surname, String contactNo, String emailAddress, String loginName, String loginPasswd, String countryOrig) {
        this.customerID = customerID;
        this.firstname = firstname;
        this.surname = surname;
        this.contactNo = contactNo;
        this.emailAddress = emailAddress;
        this.loginName = loginName;
        this.loginPasswd = loginPasswd;
        this.countryOrig = countryOrig;
    }

    /*
     * Getter methods:
     */
    public int getCustomerID() {
        return customerID;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getSurname() {
        return surname;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getLoginName() {
        return loginName;
    }

    public String getLoginPasswd() {
        return loginPasswd;
    }


    public String getCountryOrig() {
        return countryOrig;
    }

    /*
     * Setter methods:
     */
    public void setcustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public void setLoginPasswd(String loginPasswd) {
        this.loginPasswd = loginPasswd;
    }

    public void setCountryOrig(String countryOrig) {
        this.countryOrig = countryOrig;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CustomerBean other = (CustomerBean) obj;
        if (this.customerID != other.customerID) {
            return false;
        }
        if ((this.firstname == null) ? (other.firstname != null) : !this.firstname.equals(other.firstname)) {
            return false;
        }
        if ((this.surname == null) ? (other.surname != null) : !this.surname.equals(other.surname)) {
            return false;
        }
        if ((this.contactNo == null) ? (other.contactNo != null) : !this.contactNo.equals(other.contactNo)) {
            return false;
        }
        if ((this.emailAddress == null) ? (other.emailAddress != null) : !this.emailAddress.equals(other.emailAddress)) {
            return false;
        }
        if ((this.loginName == null) ? (other.loginName != null) : !this.loginName.equals(other.loginName)) {
            return false;
        }
        if ((this.loginPasswd == null) ? (other.loginPasswd != null) : !this.loginPasswd.equals(other.loginPasswd)) {
            return false;
        }
        if ((this.countryOrig == null) ? (other.countryOrig != null) : !this.countryOrig.equals(other.countryOrig)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + this.customerID;
        hash = 97 * hash + (this.firstname != null ? this.firstname.hashCode() : 0);
        hash = 97 * hash + (this.surname != null ? this.surname.hashCode() : 0);
        hash = 97 * hash + (this.contactNo != null ? this.contactNo.hashCode() : 0);
        hash = 97 * hash + (this.emailAddress != null ? this.emailAddress.hashCode() : 0);
        hash = 97 * hash + (this.loginName != null ? this.loginName.hashCode() : 0);
        hash = 97 * hash + (this.loginPasswd != null ? this.loginPasswd.hashCode() : 0);
        hash = 97 * hash + (this.countryOrig != null ? this.countryOrig.hashCode() : 0);
        return hash;
    }

    @Override
    public String toString() {
        StringBuilder toStringBuilder = new StringBuilder("Customer details:\n");
        toStringBuilder.append("\nCustomer ID: ");
        toStringBuilder.append(customerID);
        toStringBuilder.append("\nfirstname: ");
        toStringBuilder.append(firstname);
        toStringBuilder.append("\nsurname: ");
        toStringBuilder.append(surname);
        toStringBuilder.append("\ncontact no: ");
        toStringBuilder.append(contactNo);
        toStringBuilder.append("\nemail address: ");
        toStringBuilder.append(emailAddress);
        toStringBuilder.append("\nlogin name: ");
        toStringBuilder.append(loginName);
        toStringBuilder.append("\nlogin password: ");
        toStringBuilder.append(loginPasswd);
        toStringBuilder.append("\ncountry of origin: ");
        toStringBuilder.append(countryOrig);
        return toStringBuilder.toString();
    }

}
