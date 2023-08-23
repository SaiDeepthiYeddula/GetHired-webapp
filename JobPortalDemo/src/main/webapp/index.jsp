<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>GetHired Login Page</title>
    <style>
        h1 {text-align: center;}
        p {text-align: center;}
        div {text-align: center;}
    </style>
</head>
<body>
<h1 style="color:blue">GetHired</h1>
<div style="text-align:center">
<form action="LoginServlet" method="post" onsubmit="return validate()">
    Email: <input id="email" name="email" type="text" /> <br/><br/>
    Password: <input id="password" name="password" type="password" /> <br/><br/>
    <input type="submit" name="Login" value="Login"/> <br/> </br>
    <span id="error_msg"></span>
</form>

<p style="color:red">${error}</p>
</div>

</body>
<script>
    function validate() {
        var email = document.getElementById("email").value
        var password = document.getElementById("password").value
        const re_email = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(email === "") {
            document.getElementById("error_msg").innerHTML = "Please enter email."
            result = false;
        } else if(password === "") {
            document.getElementById("error_msg").innerHTML = "Please enter password."
            result = false
        } else {
            result = re_email.test(email)
            if(result===false) {
                document.getElementById("error_msg").innerHTML = "Email is not valid."
            }
            else {
                result=true
            }

        }
        return result
    }
</script>

</html>