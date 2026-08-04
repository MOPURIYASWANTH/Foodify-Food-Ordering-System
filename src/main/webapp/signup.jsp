<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foodify - Sign Up</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:linear-gradient(135deg,#fc8019,#ffb347);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.container{

    width:420px;
    background:white;
    border-radius:15px;
    padding:35px;
    box-shadow:0 10px 25px rgba(0,0,0,.2);

}

.logo{

    text-align:center;
    font-size:35px;
    color:#fc8019;
    font-weight:bold;
    margin-bottom:10px;

}

h2{

    text-align:center;
    color:#333;
    margin-bottom:25px;

}

.input-box{

    margin-bottom:18px;

}

.input-box label{

    display:block;
    margin-bottom:6px;
    font-weight:bold;
    color:#555;

}

.input-box input,
.input-box textarea{

    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
    outline:none;

}

.input-box input:focus,
.input-box textarea:focus{

    border:1px solid #fc8019;

}

textarea{

    resize:none;
    height:80px;

}

button{

    width:100%;
    padding:14px;
    background:#fc8019;
    color:white;
    border:none;
    border-radius:8px;
    font-size:17px;
    cursor:pointer;
    margin-top:10px;

}

button:hover{

    background:#e46e0d;

}

.login{

    text-align:center;
    margin-top:20px;

}

.login a{

    text-decoration:none;
    color:#fc8019;
    font-weight:bold;

}

.login a:hover{

    text-decoration:underline;

}

</style>

</head>

<body>

<div class="container">

<div class="logo">🍔 Foodify</div>

<h2>Create Your Account</h2>

<form action="signup" method="post">

    <div class="input-box">
        <label>Name</label>
        <input type="text" name="name" placeholder="Enter your name" required>
    </div>

    <div class="input-box">
        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>
    </div>

    <div class="input-box">
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required>
    </div>

    <div class="input-box">
        <label>Phone Number</label>
        <input type="text" name="phone" placeholder="Enter your phone number" required>
    </div>

    <div class="input-box">
        <label>Address</label>
        <textarea name="address" placeholder="Enter your address" required></textarea>
    </div>

    <button type="submit">Register</button>

</form>

<div class="login">

Already have an account?
<a href="login.jsp">Sign In</a>

</div>

</div>

</body>
</html>