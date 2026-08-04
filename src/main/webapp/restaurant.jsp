<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Foodify - Restaurants</title>

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
}

/* Cards */

.container{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns:repeat(auto-fill,280px);
    justify-content:center;
    gap:20px;
    padding-bottom:50px;
}
.card{

    background:#fff;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 5px 20px rgba(0,0,0,.12);
    transition:.3s;
}

.card:hover{

    transform:translateY(-8px);
    box-shadow:0 10px 25px rgba(0,0,0,.25);

}

.card img{
    width:100%;
    height:170px;
    object-fit:cover;
}

.details{

    padding:18px;

}

.top{

display:flex;
justify-content:space-between;
align-items:center;

}

.top h2{
    font-size:18px;
}

.rating{
    font-size:14px;
}

.time{

margin-top:12px;
font-weight:bold;
color:#555;

}

.cuisine{

margin-top:10px;
color:#777;

}

.address{

margin-top:8px;
color:#555;

}

.status{

margin-top:15px;
display:inline-block;
padding:6px 15px;
background:#28a745;
color:white;
border-radius:20px;

}

button{
    padding:10px;
    font-size:15px;
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

<a href="#">Home</a>
<a href="#">Offers</a>
<a href="login.jsp">Sign In</a>
<a href="signup.jsp">Sign Up</a>  
<a href="cart.jsp">Cart</a>
<a href="#" onclick="openProfile()">Profile</a>
</nav>

</header>
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
<div class="search">

<input type="text" placeholder="Search Restaurants, Food...">

</div>
<div class="container">
<%
List<Restaurant> allRestaurant = (List<Restaurant>) request.getAttribute("allRestaurant");
for(Restaurant restaurent:allRestaurant)
{
%>

<!-- Card 1 -->

<div class="card">

<img src="<%=restaurent.getImagePath() %>"alt="Restaurant">

<div class="details">

<div class="top">

<h2><%=restaurent.getRestaurantName() %></h2>

<div class="rating">★ <%=restaurent.getRating() %> </div>

</div>

<div class="time">🚴 25-30 mins</div>

<div class="cuisine"><%=restaurent.getCuisineType() %></div>

<div class="address"><%=restaurent.getAddress() %></div>

<div class="status">Open Now</div>

<a href="menu?restaurantId=<%=restaurent.getRestaurantId() %>">
    <button>View Menu</button>
</a>

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


</body>
</html>