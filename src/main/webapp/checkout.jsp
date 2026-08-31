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

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodify - Checkout</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #fff7f0;
    color: #333;
}


/* ================= HEADER ================= */

header {

    height: 75px;
    background: white;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 7%;

    position: sticky;
    top: 0;
    z-index: 1000;

    box-shadow: 0 3px 15px rgba(0,0,0,.08);
}

.logo {

    color: #fc8019;

    font-size: 30px;
    font-weight: bold;
}

nav {

    display: flex;
    align-items: center;
    gap: 28px;
}

nav a {

    text-decoration: none;

    color: #333;

    font-weight: bold;

    transition: .3s;
}

nav a:hover {

    color: #fc8019;
}


/* ================= TITLE ================= */

.pageTitle {

    text-align: center;

    padding: 42px 20px 30px;
}

.pageTitle h1 {

    font-size: 38px;

    color: #333;

    margin-bottom: 8px;
}

.pageTitle h1 span {

    color: #fc8019;
}

.pageTitle p {

    color: #777;

    font-size: 15px;
}


/* ================= MAIN LAYOUT ================= */

.checkoutContainer {

    width: 90%;
    max-width: 1250px;

    margin: auto;

    display: grid;

    grid-template-columns:
        minmax(0, 1.5fr)
        minmax(320px, .8fr);

    gap: 30px;

    align-items: start;

    padding-bottom: 70px;
}

.leftSide {

    display: flex;
    flex-direction: column;

    gap: 22px;
}


/* ================= SECTION ================= */

.section {

    background: white;

    border-radius: 18px;

    padding: 25px;

    box-shadow:
        0 5px 20px rgba(0,0,0,.08);
}

.sectionTitle {

    display: flex;
    align-items: center;

    gap: 12px;

    margin-bottom: 22px;
}

.sectionIcon {

    width: 42px;
    height: 42px;

    border-radius: 50%;

    background: #fff1e6;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 20px;
}

.sectionTitle h2 {

    font-size: 22px;

    color: #222;
}

.sectionTitle p {

    color: #888;

    font-size: 13px;

    margin-top: 3px;
}


/* ================= ADDRESS FORM ================= */

.formGrid {

    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 18px;
}

.formGroup {

    display: flex;
    flex-direction: column;

    gap: 7px;
}

.formGroup.full {

    grid-column: 1 / -1;
}

.formGroup label {

    font-size: 14px;

    color: #555;

    font-weight: bold;
}

.formGroup input {

    width: 100%;

    padding: 13px 14px;

    border: 1px solid #ddd;

    border-radius: 9px;

    font-size: 14px;

    outline: none;

    transition: .3s;

    background: #fff;
}

.formGroup input:focus {

    border-color: #fc8019;

    box-shadow:
        0 0 0 3px rgba(252,128,25,.10);
}

.formGroup input::placeholder {

    color: #aaa;
}


/* ================= ORDER ITEMS ================= */

.orderItem {

    display: flex;

    align-items: center;

    gap: 16px;

    padding: 15px 0;

    border-bottom: 1px solid #eee;
}

.orderItem:last-child {

    border-bottom: none;
}

.orderImage {

    width: 85px;
    height: 75px;

    border-radius: 12px;

    overflow: hidden;

    flex-shrink: 0;
}

.orderImage img {

    width: 100%;
    height: 100%;

    object-fit: cover;
}

.orderInfo {

    flex: 1;
}

.orderInfo h3 {

    font-size: 17px;

    margin-bottom: 6px;

    color: #222;
}

.orderInfo p {

    color: #777;

    font-size: 13px;
}

.orderPrice {

    text-align: right;
}

.orderPrice strong {

    color: #fc8019;

    font-size: 17px;
}

.orderPrice p {

    color: #888;

    font-size: 12px;

    margin-top: 5px;
}


/* ================= PAYMENT ================= */

.paymentOption {

    display: flex;

    align-items: center;

    gap: 14px;

    padding: 15px;

    border: 1px solid #eee;

    border-radius: 10px;

    margin-bottom: 12px;

    cursor: pointer;

    transition: .3s;
}

.paymentOption:hover {

    border-color: #fc8019;

    background: #fff9f4;
}

.paymentOption input {

    accent-color: #fc8019;

    width: 18px;
    height: 18px;

    cursor: pointer;
}

.paymentIcon {

    width: 38px;
    height: 38px;

    border-radius: 8px;

    background: #fff1e6;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 19px;
}

.paymentText {

    flex: 1;
}

.paymentText strong {

    display: block;

    font-size: 15px;

    margin-bottom: 3px;
}

.paymentText span {

    color: #888;

    font-size: 12px;
}


/* ================= BILL SUMMARY ================= */

.billSummary {

    background: white;

    border-radius: 18px;

    padding: 25px;

    box-shadow:
        0 5px 20px rgba(0,0,0,.08);

    position: sticky;

    top: 100px;
}

.billSummary h2 {

    font-size: 22px;

    margin-bottom: 22px;
}

.billLine {

    display: flex;

    justify-content: space-between;

    gap: 20px;

    color: #666;

    font-size: 14px;

    margin-bottom: 15px;
}

.billLine span:last-child {

    color: #333;

    font-weight: 500;
}

.divider {

    border: none;

    border-top: 1px solid #eee;

    margin: 20px 0;
}

.finalTotal {

    display: flex;

    justify-content: space-between;

    align-items: center;

    font-size: 20px;

    font-weight: bold;

    margin-bottom: 22px;
}

.finalTotal span:last-child {

    color: #fc8019;

    font-size: 23px;
}


/* ================= PLACE ORDER ================= */

.placeOrderButton {

    width: 100%;

    border: none;

    padding: 15px;

    border-radius: 10px;

    background: #fc8019;

    color: white;

    font-size: 17px;

    font-weight: bold;

    cursor: pointer;

    transition: .3s;
}

.placeOrderButton:hover {

    background: #e46e0d;

    transform: translateY(-2px);

    box-shadow:
        0 7px 18px rgba(252,128,25,.25);
}

.secureText {

    text-align: center;

    color: #888;

    font-size: 12px;

    margin-top: 14px;
}

.backCart {

    display: block;

    text-align: center;

    margin-top: 15px;

    color: #fc8019;

    text-decoration: none;

    font-size: 14px;

    font-weight: bold;
}


/* ================= RESPONSIVE ================= */

@media(max-width: 900px) {

    .checkoutContainer {

        grid-template-columns: 1fr;
    }

    .billSummary {

        position: static;
    }
}


@media(max-width: 650px) {

    header {

        padding: 0 20px;
    }

    .logo {

        font-size: 24px;
    }

    nav {

        gap: 12px;
    }

    nav a {

        font-size: 13px;
    }

    .pageTitle h1 {

        font-size: 30px;
    }

    .formGrid {

        grid-template-columns: 1fr;
    }

    .formGroup.full {

        grid-column: auto;
    }

    .section {

        padding: 20px;
    }

    .orderImage {

        width: 70px;
        height: 65px;
    }
}

</style>

</head>


<body>


<%

User user =
    (User) session.getAttribute("loggedInUser");

Cart cart =
    (Cart) session.getAttribute("cart");

double grandTotal = 0;

%>


<!-- ================= HEADER ================= -->

<header>

    <div class="logo">

        🍔 Foodify

    </div>


    <nav>

        <a href="restaurant">
            Home
        </a>

        <a href="cart.jsp">
            🛒 Cart
        </a>

        <a href="myOrders">
            My Orders
        </a>

    </nav>

</header>


<!-- ================= PAGE TITLE ================= -->

<div class="pageTitle">

    <h1>

        Secure <span>Checkout</span> 🛍️

    </h1>

    <p>

        Complete your delivery details and place your order

    </p>

</div>


<!-- ================= FORM START ================= -->

<form
    action="placeOrder"
    method="post">


<div class="checkoutContainer">


<!-- =================================================
                     LEFT SIDE
================================================== -->

<div class="leftSide">


<!-- ================= ADDRESS ================= -->

<div class="section">


    <div class="sectionTitle">

        <div class="sectionIcon">

            📍

        </div>


        <div>

            <h2>
                Delivery Address
            </h2>

            <p>
                Where should we deliver your order?
            </p>

        </div>

    </div>


    <div class="formGrid">


        <div class="formGroup">

            <label>
                Full Name
            </label>

            <input
                type="text"
                name="name"
                placeholder="Enter your full name"
                required>

        </div>


        <div class="formGroup">

            <label>
                Mobile Number
            </label>

            <input
                type="tel"
                name="mobile"
                placeholder="Enter mobile number"
                required>

        </div>


        <div class="formGroup">

            <label>
                House / Flat No
            </label>

            <input
                type="text"
                name="house"
                placeholder="House or flat number"
                required>

        </div>


        <div class="formGroup">

            <label>
                Street / Area
            </label>

            <input
                type="text"
                name="street"
                placeholder="Street or area"
                required>

        </div>


        <div class="formGroup">

            <label>
                City
            </label>

            <input
                type="text"
                name="city"
                placeholder="Enter city"
                required>

        </div>


        <div class="formGroup">

            <label>
                State
            </label>

            <input
                type="text"
                name="state"
                placeholder="Enter state"
                required>

        </div>


        <div class="formGroup">

            <label>
                Pincode
            </label>

            <input
                type="text"
                name="pincode"
                placeholder="Enter pincode"
                required>

        </div>


        <div class="formGroup">

            <label>
                Landmark
            </label>

            <input
                type="text"
                name="landmark"
                placeholder="Optional">

        </div>


    </div>


</div>


<!-- ================= ORDER ITEMS ================= -->

<div class="section">


    <div class="sectionTitle">

        <div class="sectionIcon">

            🍽️

        </div>


        <div>

            <h2>
                Your Order
            </h2>

            <p>
                Review the items you're ordering
            </p>

        </div>

    </div>


<%

if(cart != null &&
   cart.getItems() != null) {

    Map<Integer, CartItem> items =
        cart.getItems();


    for(CartItem item : items.values()) {

        double total =
            item.getPrice()
            * item.getQuantity();

        grandTotal += total;

%>


<div class="orderItem">


    <div class="orderImage">

        <img
            src="<%=item.getImagePath()%>"
            alt="<%=item.getName()%>">

    </div>


    <div class="orderInfo">

        <h3>

            <%=item.getName()%>

        </h3>


        <p>

            ₹ <%=String.format("%.2f",
                    item.getPrice())%>
            ×
            <%=item.getQuantity()%>

        </p>

    </div>


    <div class="orderPrice">

        <strong>

            ₹ <%=String.format("%.2f",
                    total)%>

        </strong>


        <p>

            Qty: <%=item.getQuantity()%>

        </p>

    </div>


</div>


<%

    }

}

%>


</div>


<!-- ================= PAYMENT ================= -->

<div class="section">


    <div class="sectionTitle">

        <div class="sectionIcon">

            💳

        </div>


        <div>

            <h2>
                Payment Method
            </h2>

            <p>
                Choose your preferred payment method
            </p>

        </div>

    </div>


    <!-- COD -->

    <label class="paymentOption">


        <input
            type="radio"
            name="payment"
            value="Cash On Delivery"
            checked>


        <div class="paymentIcon">

            💵

        </div>


        <div class="paymentText">

            <strong>
                Cash On Delivery
            </strong>

            <span>
                Pay when your order arrives
            </span>

        </div>


    </label>


    <!-- UPI -->

    <label class="paymentOption">


        <input
            type="radio"
            name="payment"
            value="UPI">


        <div class="paymentIcon">

            📱

        </div>


        <div class="paymentText">

            <strong>
                UPI
            </strong>

            <span>
                Google Pay, PhonePe, Paytm & more
            </span>

        </div>


    </label>


    <!-- CARD -->

    <label class="paymentOption">


        <input
            type="radio"
            name="payment"
            value="Card">


        <div class="paymentIcon">

            💳

        </div>


        <div class="paymentText">

            <strong>
                Credit / Debit Card
            </strong>

            <span>
                Visa, Mastercard and other cards
            </span>

        </div>


    </label>


</div>


</div>


<!-- =================================================
                     RIGHT SIDE
================================================== -->


<%

double itemTotal =
    grandTotal;

float gst =
    (float)itemTotal * 0.05f;

double packingCharge = 20;

double deliveryCharge = 40;

double platformFee = 5;

double restaurantCharge = 15;

float finalAmount =
    (float)(
        itemTotal
        + gst
        + packingCharge
        + deliveryCharge
        + platformFee
        + restaurantCharge
    );

%>


<div class="billSummary">


    <h2>
        Bill Details
    </h2>


    <div class="billLine">

        <span>
            Item Total
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    itemTotal)%>

        </span>

    </div>


    <div class="billLine">

        <span>
            GST (5%)
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    gst)%>

        </span>

    </div>


    <div class="billLine">

        <span>
            Packing Charges
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    packingCharge)%>

        </span>

    </div>


    <div class="billLine">

        <span>
            Delivery Fee
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    deliveryCharge)%>

        </span>

    </div>


    <div class="billLine">

        <span>
            Platform Fee
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    platformFee)%>

        </span>

    </div>


    <div class="billLine">

        <span>
            Restaurant Charges
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    restaurantCharge)%>

        </span>

    </div>


    <hr class="divider">


    <div class="finalTotal">

        <span>
            To Pay
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    finalAmount)%>

        </span>

    </div>


    <button
        type="submit"
        class="placeOrderButton">

        Place Order →

    </button>


    <div class="secureText">

        🔒 Safe and secure checkout

    </div>


    <a
        href="cart.jsp"
        class="backCart">

        ← Back to Cart

    </a>


</div>


</div>


</form>


</body>

</html>