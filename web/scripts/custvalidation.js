/*
 * SOURCE: MURACH BOOK APPLICATION "ch07emailValidatePlus"
 * Java Servlets and JSP, Official text book for HNC year
 */

function validate(form)
{
    if (form.firstname.value==="")
    {
        alert("Please fill in your first name");
        form.firstname.focus();
    }
    else if (form.surname.value==="")
    {
        alert("Please fill in your last name");
        form.surname.focus();
    }
    else if (form.contactNo.value==="")
    {
        alert("Please fill in your contact no");
        form.contactNo.focus();
    }
    else if (form.emailAddress.value==="")
    {
        alert("Please fill in your email address");
        form.emailAddress.focus();
    }
    else if (form.loginName.value==="")
    {
        alert("Please fill in your login name");
        form.loginName.focus();
    }
    else if (form.loginPasswd.value==="")
    {
        alert("Please fill in your login password");
        form.loginPasswd.focus();
    }
    else
    {
        form.submit();
    }  
}