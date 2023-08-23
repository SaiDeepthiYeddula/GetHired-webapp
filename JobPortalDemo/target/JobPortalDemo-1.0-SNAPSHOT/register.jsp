<%--
  Created by IntelliJ IDEA.
  User: deepu
  Date: 4/24/2021
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GetHired Register Page</title>
</head>
<style>
    h1 {text-align: center;}
    p {text-align: center;}
    div {text-align: center;}
</style>
<body>
<h1 style="color:blue">Join GetHired</h1>
<br/>
<div style="text-align:center">
<form action="RegisterServlet" method="post" onsubmit="return validate()">
    First Name: <input id="fname" name="fname" type="text"/><br/><br/>
    Last Name: <input id="lname" name="lname" type="text"/><br/><br/>
    Email: <input id="email" name="email" type="email"/><br/><br/>
    Password: <input id="password" name="password" type="password"/><br/><br/>
    Confirm Password: <input id="cpwd" name="cpwd" type="password"/><br/><br/>
    Profession: <input id="prof" name="prof" type="text"/><br/><br/>
    <input type="submit" name="Register" value="Register"/><br/><br/>
    <span id="error_msg"></span>
</form>
<p style="color:red">${error}</p>
<p style="color:green">${message}</p>
</div>
</body>
<script>
    function validate() {
        var fname = document.getElementById("fname").value
        var lname = document.getElementById("lname").value
        var email = document.getElementById("email").value
        const re_email = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var password = document.getElementById("password").value
        var cpassword = document.getElementById("cpwd").value
        var profession = document.getElementById("prof").value
        if(fname === "") {
            document.getElementById("error_msg").innerHTML = "Please enter your first name."
            result = false;
        } else if(lname === "") {
            document.getElementById("error_msg").innerHTML = "Please enter your last name."
            result = false
        }
        else if(email === "") {
            document.getElementById("error_msg").innerHTML = "Please enter email."
            result = false;
        } else if(password === "") {
            document.getElementById("error_msg").innerHTML = "Please enter password."
            result = false
        }
        else if(cpassword === "") {
            document.getElementById("error_msg").innerHTML = "Please confirm your password."
            result = false
        }
        else if(password !== cpassword)
        {
            document.getElementById("error_msg").innerHTML = "Passwords do not match."
            result = false
        }
        else if(profession === "")
        {
            document.getElementById("error_msg").innerHTML = "Please enter your profession."
            result = false
        }
        else {
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
