function validateform1() {
    var username = document.stafflogin.username.value;
    var password = document.stafflogin.password.value;

    if (username === null || username === "") {
        alert("Please enter the admin username");
        document.stafflogin.username.focus();
        return false;
    } else if (password === null || password === "") {
        alert("Please enter the admin password");
        document.stafflogin.password.focus();
        return false;
    } else {
        document.stafflogin.submit();
    }
}


