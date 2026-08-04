<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Menu"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foodify - Menu</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,Helvetica,sans-serif;
}

body{
    background:#fc8019;
}

/* Header */

header{
    background:#ffffff;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 60px;
    box-shadow:0 3px 10px rgba(0,0,0,.1);
    position:sticky;
    top:0;
    z-index:100;
}

.logo{
    font-size:32px;
    color:#fc8019;
    font-weight:bold;
}

nav a{
    text-decoration:none;
    color:#333;
    margin-left:25px;
    font-weight:bold;
}

nav a:hover{
    color:#fc8019;
}

/* Search */

.search{
    width:90%;
    margin:30px auto;
    display:flex;
    justify-content:center;
}

.search input{
    width:70%;
    padding:16px;
    border-radius:40px;
    border:1px solid #ccc;
    font-size:18px;
    outline:none;
}

/* Heading */

.heading{
    text-align:center;
    margin:20px;
}

.heading h1{
    color:#fc8019;
    font-size:40px;
}

.heading p{
    color:#666;
    margin-top:10px;
}

/* Cards */

.container{

    width:90%;
    margin:30px auto;

    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(300px,1fr));
    gap:25px;

    padding-bottom:40px;

}

.card{

    background:#fff;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
    transition:.3s;

}

.card:hover{

    transform:translateY(-8px);
    box-shadow:0 12px 25px rgba(0,0,0,.25);

}

.card img{

    width:100%;
    height:220px;
    object-fit:cover;

}

.details{

    padding:18px;

}

.details h2{

    color:#333;
    margin-bottom:10px;
    font-size:24px;

}

.desc{

    color:#666;
    margin-bottom:15px;
    height:45px;

}

.bottom{

    display:flex;
    justify-content:space-between;
    align-items:center;

}

.price{

    color:#fc8019;
    font-size:22px;
    font-weight:bold;

}

.status{

    display:inline-block;
    margin-top:12px;
    background:#28a745;
    color:white;
    padding:6px 14px;
    border-radius:20px;
    font-size:14px;

}

button{

    margin-top:18px;
    width:100%;
    padding:13px;
    border:none;
    background:#fc8019;
    color:white;
    font-size:17px;
    border-radius:8px;
    cursor:pointer;

}

button:hover{

    background:#e46e0d;

}
.profilePanel{

    position:fixed;
    top:0;
    right:-350px;

    width:320px;
    height:100%;

    background:white;

    box-shadow:-3px 0 15px rgba(0,0,0,.3);

    padding:25px;

    transition:0.4s;

    z-index:999;

}

.profilePanel h2{

    color:#fc8019;

    margin-bottom:10px;

}

.profilePanel p{

    margin-bottom:20px;

}

.profilePanel a{

    text-decoration:none;

    color:#333;

    font-size:18px;

}

.profilePanel a:hover{

    color:#fc8019;

}

.closeBtn{

    float:right;

    border:none;

    background:none;

    font-size:22px;

    cursor:pointer;

}
</style>

</head>

<body>

<header>

<div class="logo">🍔 Foodify</div>

<nav>

<a href="restaurant">Home</a>
<a href="#">Offers</a>
<a href="cart.jsp">Cart</a>
<a href="#" onclick="openProfile()">Profile</a>

</nav>
<%@ page import="com.food.model.User"%>

<%
User user = (User)session.getAttribute("loggedInUser");
%>

<div id="profilePanel" class="profilePanel">

<button class="closeBtn" onclick="closeProfile()">✖</button>

<% if(user != null){ %>

<h2>👤 <%=user.getName()%></h2>

<p><%=user.getEmail()%></p>

<hr><br>

<a href="editProfile.jsp">✏ Edit Profile</a><br><br>

<a href="myOrders">📦 My Orders</a><br><br>

<a href="#">❤ Favorites</a><br><br>

<a href="logout">🚪 Logout</a>

<% } else { %>

<h2>Welcome</h2>

<p>Please Login</p>

<br>

<a href="login.jsp">Sign In</a>

<% } %>

</div>

</header>

<div class="search">

<input type="text" placeholder="Search Food Items...">

</div>

<div class="heading">

<h1>Our Delicious Menu</h1>

<p>Choose your favourite food and add it to your cart.</p>

</div>

<div class="container">

<%

List<Menu> menus=(List<Menu>)request.getAttribute("menus");
for(Menu m:menus){

%>

<div class="card">

<img src="<%=m.getImagePath()%>" alt="Food Image">

<div class="details">

<h2><%=m.getItemName()%></h2>

<p class="desc"><%=m.getDescription()%></p>

<div class="bottom">

<span class="price">₹<%=m.getPrice()%></span>

</div>

<div class="status">

<%=m.isAvailable()?"Available":"Not Available"%>

</div>

<form action="cartServlet" method="post">

    <input type="hidden"
           name="menuId"
           value="<%=m.getMenuId()%>">

    <input type="hidden"
           name="restaurantId"
           value="<%=m.getRestaurantId()%>">

    <input type="hidden"
           name="quantity"
           value="1">

    <input type="hidden"
           name="action"
           value="add">

    <input type="submit"
           value="Add To Cart">

</form>

</div>

</div>

<%
}
%>
<script>

function openProfile(){

    document.getElementById("profilePanel").style.right="0";

}

function closeProfile(){

    document.getElementById("profilePanel").style.right="-350px";

}

</script>

</div>

</body>
</html>