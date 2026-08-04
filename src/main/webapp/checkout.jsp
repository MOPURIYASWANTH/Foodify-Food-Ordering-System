<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>
<%@ page import="com.food.model.User"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - Foodify</title>

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
    margin-bottom:25px;
}

.section{

    background:white;
    padding:20px;
    border-radius:10px;
    margin-bottom:20px;
    box-shadow:0 2px 8px lightgray;

}

.section h2{

    color:#fc8019;
    margin-bottom:15px;

}

table{

    width:100%;
    border-collapse:collapse;

}

table th,
table td{

    padding:12px;
    border-bottom:1px solid #ddd;
    text-align:center;

}

.total{

    text-align:right;
    font-size:22px;
    font-weight:bold;
    color:#fc8019;
    margin-top:20px;

}

.payment label{

    display:block;
    margin:12px 0;
    font-size:17px;

}

button{

    width:100%;
    padding:15px;
    background:#fc8019;
    color:white;
    border:none;
    border-radius:8px;
    font-size:18px;
    cursor:pointer;

}

button:hover{

    background:#e46e0d;

}

</style>

</head>
<body>

<div class="container">

<h1>Checkout</h1>

<%
User user=(User)session.getAttribute("loggedInUser");
Cart cart=(Cart)session.getAttribute("cart");

double grandTotal=0;
%>
<form action="placeOrder" method="post">
<!-- Delivery Details -->

<div class="section">

<h2>Delivery Address</h2>

<label>Full Name</label><br>
<input type="text" name="name" required><br><br>

<label>Mobile Number</label><br>
<input type="text" name="mobile" required><br><br>

<label>House / Flat No</label><br>
<input type="text" name="house" required><br><br>

<label>Street / Area</label><br>
<input type="text" name="street" required><br><br>

<label>City</label><br>
<input type="text" name="city" required><br><br>

<label>State</label><br>
<input type="text" name="state" required><br><br>

<label>Pincode</label><br>
<input type="text" name="pincode" required><br><br>

<label>Landmark (Optional)</label><br>
<input type="text" name="landmark"><br><br>

</div>

<!-- Order Summary -->

<div class="section">

<h2>Order Summary</h2>

<table>

<tr>

<th>Image</th>
<th>Item</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>

</tr>



<%

Map<Integer,CartItem> items=cart.getItems();

for(CartItem item:items.values()){

double total=item.getPrice()*item.getQuantity();

grandTotal+=total;

%>

<tr>

<td>

<img src="<%=item.getImagePath()%>"
     width="80"
     height="80"
     style="border-radius:10px;">

</td>

<td><%=item.getName()%></td>

<td>₹ <%=item.getPrice()%></td>

<td><%=item.getQuantity()%></td>

<td>₹ <%=total%></td>

</tr>

<%
}
%>

</table>

<%
double itemTotal = grandTotal;

float gst = (float)itemTotal * 0.05f;

double packingCharge = 20;

double deliveryCharge = 40;

double platformFee = 5;

double restaurantCharge = 15;

float finalAmount =(float)( itemTotal
        + gst
        + packingCharge
        + deliveryCharge
        + platformFee
        + restaurantCharge);
%>

<div class="section">

<h2>Bill Details</h2>

<table>

<tr>
<td>Item Total</td>
<td>₹ <%=itemTotal%></td>
</tr>

<tr>
<td>GST (5%)</td>
<td>₹ <%=gst%></td>
</tr>

<tr>
<td>Packing Charges</td>
<td>₹ <%=packingCharge%></td>
</tr>

<tr>
<td>Delivery Fee</td>
<td>₹ <%=deliveryCharge%></td>
</tr>

<tr>
<td>Platform Fee</td>
<td>₹ <%=platformFee%></td>
</tr>

<tr>
<td>Restaurant Charges</td>
<td>₹ <%=restaurantCharge%></td>
</tr>

<tr style="font-weight:bold;color:#fc8019;">
<td>Grand Total</td>
<td>₹ <%=finalAmount%></td>
</tr>

</table>

</div>

</div>

<!-- Payment -->

<div class="section payment">

<h2>Payment Method</h2>



<label>

<input type="radio"
       name="payment"
       value="Cash On Delivery"
       checked>

Cash On Delivery

</label>

<label>

<input type="radio"
       name="payment"
       value="UPI">

UPI

</label>

<label>

<input type="radio"
       name="payment"
       value="Card">

Credit / Debit Card

</label>

<br><br>

<button type="submit">

Place Order

</button>

</form>

</div>

</div>

</body>
</html>