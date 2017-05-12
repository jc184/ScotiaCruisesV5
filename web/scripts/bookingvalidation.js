/* 
 * SOURCE: MURACH BOOK APPLICATION "ch07emailValidatePlus"
 * Java Servlets and JSP, Official text book for HNC year
 */

function validate(form)
{
    /* */
    if (form.customerID.value==="")
    {
        alert("Please fill in your customer no");
        form.customerID.focus();
    } 
    else if (form.routeID.value==="")
    {
        alert("Please fill in your choice of route");
        form.routeID.focus();
    }
    else if (form.sailingDate.value==="")
    {
        alert("Please fill in your date of travel");
        form.sailingDate.focus();
    }
    else if (form.noAdults.value==="")
    {
        alert("Please fill in the no of adults in the party");
        form.noAdults.focus();
    }
    else if (form.noChildren.value==="")
    {
        alert("Please fill in the no of children in the party");
        form.noChildren.focus();
    }
    else 
    {
        form.submit();
    }
}