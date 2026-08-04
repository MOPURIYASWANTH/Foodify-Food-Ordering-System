<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foodify - Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#fc8019,#ffb347);
}

.container{

    width:400px;
    background:#fff;
    padding:35px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,.2);

}

.logo{

    text-align:center;
    font-size:34px;
    color:#fc8019;
    font-weight:bold;
    margin-bottom:10px;

}

h2{

    text-align:center;
    margin-bottom:25px;
    color:#333;

}

.input-box{

    margin-bottom:20px;

}

.input-box label{

    display:block;
    margin-bottom:6px;
    font-weight:bold;

}

.input-box input{

    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    font-size:15px;

}

.input-box input:focus{

    border-color:#fc8019;

}

button{

    width:100%;
    padding:13px;
    border:none;
    border-radius:8px;
    background:#fc8019;
    color:white;
    font-size:17px;
    cursor:pointer;

}

button:hover{

    background:#e46e0d;

}

.signup{

    margin-top:20px;
    text-align:center;

}

.signup a{

    color:#fc8019;
    text-decoration:none;
    font-weight:bold;

}

.signup a:hover{

    text-decoration:underline;

}

</style>

</head>

<body>

<div class="container">

<div class="logo">🍔 Foodify</div>

<h2>Login to Your Account</h2>
<%
String error = (String)request.getAttribute("error");

if(error != null){
%>

<p style="color:red;
          text-align:center;
          margin-bottom:15px;
          font-weight:bold;">

    <%=error%>

</p>

<%
}
%>

<form action="login" method="post">

<div class="input-box">

<label>Email</label>

<input type="email"
       name="email"
       placeholder="Enter your Email"
       required>

</div>

<div class="input-box">

<label>Password</label>

<input type="password"
       name="password"
       placeholder="Enter your Password"
       required>

</div>

<button type="submit">

Login

</button>

</form>

<div class="signup">

Don't have an account?

<a href="signup.jsp">

Register Now

</a>

</div>

</div>

</body>
</html>