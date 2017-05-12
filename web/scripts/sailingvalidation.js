/* 
 * SOURCE: MURACH BOOK APPLICATION "ch07emailValidatePlus"
 * Java Servlets and JSP, Official text book for HNC year
 */

function validate(form)
{
    /* */
    if (form.routeID.value==="")
    {
        alert("Please fill in your choice of route");
        form.routeID.focus();
    }
    else if (form.sailingDate.value==="")
    {
        alert("Please fill in your date of travel");
        form.sailingDate.focus();
    }
    else 
    {
        form.submit();
    }
}