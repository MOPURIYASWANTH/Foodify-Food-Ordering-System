<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User"%>

<%
User user = (User)session.getAttribute("loggedInUser");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,Helvetica,sans-serif;
}

body{

    background:#fff7f0;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;

}

.container{

    width:450px;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 5px 15px rgba(0,0,0,.2);

}

h1{

    text-align:center;
    color:#fc8019;
    margin-bottom:25px;

}

label{

    font-weight:bold;

}

input{

    width:100%;
    padding:10px;
    margin-top:5px;
    margin-bottom:18px;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:15px;

}

button{

    width:100%;
    padding:12px;
    border:none;
    background:#fc8019;
    color:white;
    font-size:18px;
    border-radius:6px;
    cursor:pointer;

}

button:hover{

    background:#e46e0d;

}

.back{

    margin-top:15px;
    text-align:center;

}

.back a{

    text-decoration:none;
    color:#fc8019;
    font-weight:bold;

}

</style>

</head>

<body>

<div class="container">

<h1>Edit Profile</h1>

<form action="updateProfile" method="post">

<input type="hidden"
       name="userId"
       value="<%=user.getUserId()%>">

<label>Name</label>

<input type="text"
       name="name"
       value="<%=user.getName()%>"
       required>

<label>Email</label>

<input type="email"
       name="email"
       value="<%=user.getEmail()%>"
       required>

<label>Phone</label>

<input type="text"
       name="phone"
       value="<%=user.getPhone()%>"
       required>

<label>Address</label>

<input type="text"
       name="address"
       value="<%=user.getAddress()%>"
       required>

<button type="submit">

Update Profile

</button>

</form>

<div class="back">

<a href="restaurant">

← Back to Home

</a>

</div>

</div>

</body>
</html>