<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>
<%@ page import="com.food.model.Menu"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<style>

body{
    margin:0;
    font-family:Arial,sans-serif;
    background:#f5f5f5;
}

h1{
    text-align:center;
    color:#fc8019;
    margin:20px;
}

.container{
    width:70%;
    margin:auto;
}

.card{
    display:flex;
    align-items:center;
    background:white;
    margin:15px 0;
    border-radius:10px;
    box-shadow:0 2px 8px lightgray;
    padding:15px;
}

.card img{
    width:120px;
    height:100px;
    border-radius:10px;
    margin-right:20px;
}

.details{
    flex:1;
}

.details h2{
    margin:0;
}

.price{
    color:#fc8019;
    font-size:20px;
    font-weight:bold;
}

button{
    background:#fc8019;
    color:white;
    border:none;
    padding:8px 15px;
    border-radius:5px;
    cursor:pointer;
}

.total{
    text-align:right;
    font-size:25px;
    font-weight:bold;
    margin:20px;
}

.checkout{
    text-align:center;
    margin-bottom:30px;
}

.checkout button{
    padding:12px 30px;
    font-size:18px;
}

</style>

</head>

<body>

<h1>My Cart</h1>

<div class="container">

<%
Cart cart=(Cart)session.getAttribute("cart");

double grandTotal=0;

if(cart == null || cart.getItems().isEmpty()){
%>
<h2>Your Cart is Empty</h2>

<p>Add your favorite food items to the cart.</p>
<a href="restaurant">
    <button>Browse Restaurants</button>
</a>

<%
}
else{

Map<Integer,CartItem> items = cart.getItems();

for(CartItem item : items.values()){

double total = item.getPrice() * item.getQuantity();

grandTotal += total;
%>

<div class="card">

<img src="<%=item.getImagePath()%>" alt="Food Image">

<div class="details">

<h2><%=item.getName()%></h2>

<p class="price">₹ <%=item.getPrice()%></p>

<div class="quantity">

    <form action="cartServlet" method="post" style="display:inline;">

        <input type="hidden" name="action" value="update">
        <input type="hidden" name="operation" value="minus">
        <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">

        <button type="submit">-</button>

    </form>

    <span style="padding:10px;"><%=item.getQuantity()%></span>

    <form action="cartServlet" method="post" style="display:inline;">

        <input type="hidden" name="action" value="update">
        <input type="hidden" name="operation" value="plus">
        <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">

        <button type="submit">+</button>

    </form>

</div>

<p>Total : ₹ <%=total%></p>

<form action="cartServlet" method="post">

    <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">

    <input type="hidden" name="action" value="delete">

    <button type="submit">Remove</button>

</form>

<form action="menu" method="get" style="display:inline;">

    <input type="hidden"
           name="restaurantId"
           value="<%=item.getRestaurantId()%>">

    <button type="submit">
        Add More Items
    </button>

</form>
</div>

</div>

<%
}
%>

<div class="total">

Grand Total : ₹ <%=grandTotal%>

</div>

<div class="checkout">

<form action="checkout" method="get">

    <button type="submit">
        Proceed To Checkout
    </button>

</form>

</div>
</div>

<%
}
%>


</div>

</body>
</html>