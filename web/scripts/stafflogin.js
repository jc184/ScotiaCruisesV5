

function validate(form)
{
    /* */
    if (form.username.value==="")
    {
        alert("Please enter the admin username");
        form.username.focus();
    }
    else if (form.password.value==="")
    {
        alert("Please enter the admin password");
        form.password.focus();
    }
    else 
    {
        form.submit();
    }
    
    
}

