<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderItem"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>

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

.card{

    display:flex;
    align-items:center;

    background:white;

    padding:20px;

    margin-bottom:15px;

    border-radius:12px;

    box-shadow:0 2px 10px lightgray;

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

    color:#333;

}

.price{

    color:#fc8019;

    font-weight:bold;

    margin-top:10px;

}

.bill{

    background:white;

    padding:20px;

    border-radius:12px;

    box-shadow:0 2px 10px lightgray;

    margin-top:25px;

}

.bill table{

    width:100%;

}

.bill td{

    padding:10px;

}

.total{

    color:#fc8019;

    font-size:22px;

    font-weight:bold;

}

.back{

    margin-top:25px;

    text-align:center;

}

button{

    padding:12px 25px;

    background:#fc8019;

    color:white;

    border:none;

    border-radius:5px;

    cursor:pointer;

}

button:hover{

    background:#e46e0d;

}

</style>

</head>

<body>

<div class="container">

<h1>Order Details</h1>

<%

List<OrderItem> items=(List<OrderItem>)request.getAttribute("orderItems");

double itemTotal=0;

for(OrderItem item:items){

double total=item.getPrice()*item.getQuantity();

itemTotal+=total;

%>

<div class="card">

<img src="<%=item.getImagePath()%>">

<div class="details">

<h2><%=item.getItemName()%></h2>

<p>Quantity : <%=item.getQuantity()%></p>

<p class="price">

₹ <%=item.getPrice()%>

</p>

<p>

Total : ₹ <%=total%>

</p>

</div>

</div>

<%

}

double gst=itemTotal*0.05;

double packing=20;

double delivery=40;

double platform=10;

double restaurantCharge=15;

double finalAmount=itemTotal+gst+packing+delivery+platform+restaurantCharge;

%>

<div class="bill">

<h2 style="color:#fc8019;">Bill Details</h2>

<table>

<tr>

<td>Item Total</td>

<td align="right">

₹ <%=itemTotal%>

</td>

</tr>

<tr>

<td>GST (5%)</td>

<td align="right">

₹ <%=gst%>

</td>

</tr>

<tr>

<td>Packing Charges</td>

<td align="right">

₹ <%=packing%>

</td>

</tr>

<tr>

<td>Delivery Fee</td>

<td align="right">

₹ <%=delivery%>

</td>

</tr>

<tr>

<td>Platform Fee</td>

<td align="right">

₹ <%=platform%>

</td>

</tr>

<tr>

<td>Restaurant Charges</td>

<td align="right">

₹ <%=restaurantCharge%>

</td>

</tr>

<tr class="total">

<td>Grand Total</td>

<td align="right">

₹ <%=finalAmount%>

</td>

</tr>

</table>

</div>

<div class="back">

<a href="myOrders">

<button>

Back To My Orders

</button>

</a>

</div>

</div>

</body>
</html>