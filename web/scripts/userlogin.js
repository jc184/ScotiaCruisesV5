/*
 * SOURCE: MURACH BOOK APPLICATION "ch07emailValidatePlus"
 * Java Servlets and JSP, Official text book for HNC year
 */

function validate(form)
{
    if (form.loginName.value === "")
    {
        alert("Please fill in your login name");
        form.loginName.focus();
    } 
    else if (form.loginPasswd.value === "")
    {
        alert("Please fill in your login password");
        form.loginPasswd.focus();
    } 
    else
    {
        form.submit();
    }
}


