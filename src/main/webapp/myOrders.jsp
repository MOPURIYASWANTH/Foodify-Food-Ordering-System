<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Order"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,Helvetica,sans-serif;
}

body{
    background:#f5f5f5;
}

.container{

    width:80%;
    margin:30px auto;

}

h1{

    text-align:center;
    color:#fc8019;
    margin-bottom:30px;

}

.orderCard{

    background:white;
    border-radius:12px;
    padding:20px;
    margin-bottom:20px;
    box-shadow:0 2px 10px lightgray;

}

.orderCard h2{

    color:#fc8019;
    margin-bottom:15px;

}

.row{

    display:flex;
    justify-content:space-between;
    margin:10px 0;

}

.label{

    font-weight:bold;

}

.status{

    color:green;
    font-weight:bold;

}

button{

    margin-top:15px;
    padding:10px 20px;
    background:#fc8019;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;

}

button:hover{

    background:#e46e0d;

}

.empty{

    text-align:center;
    margin-top:100px;

}

.empty h2{

    color:#555;

}

.empty a{

    text-decoration:none;

}

</style>

</head>

<body>

<div class="container">

<h1>📦 My Orders</h1>

<%

List<Order> orders = (List<Order>)request.getAttribute("orders");

if(orders == null || orders.isEmpty()){

%>

<div class="empty">

<h2>No Orders Found</h2>

<br>

<a href="restaurant">

<button>Order Now</button>

</a>

</div>

<%

}else{

for(Order order : orders){

%>

<div class="orderCard">

<h2>Order #<%=order.getOrderId()%></h2>

<div class="row">

<span class="label">Order Date</span>

<span><%=order.getOrderDate()%></span>

</div>

<div class="row">

<span class="label">Restaurant ID</span>

<span><%=order.getRestaurantId()%></span>

</div>

<div class="row">

<span class="label">Total Amount</span>

<span>₹ <%=order.getTotalAmount()%></span>

</div>

<div class="row">

<span class="label">Status</span>

<span class="status"><%=order.getStatus()%></span>

</div>

<form action="orderDetails" method="get">

<input type="hidden"
       name="orderId"
       value="<%=order.getOrderId()%>">

<button type="submit">

View Details

</button>

</form>

</div>

<%

}

}

%>

</div>

</body>

</html>