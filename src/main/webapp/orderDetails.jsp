<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderItem"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodify - Order Details</title>

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

    box-shadow:
        0 3px 15px rgba(0,0,0,.08);
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


/* ================= PAGE TITLE ================= */

.pageTitle {

    text-align: center;

    padding: 45px 20px 30px;
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


/* ================= MAIN ================= */

.mainContainer {

    width: 90%;
    max-width: 1200px;

    margin: auto;

    display: grid;

    grid-template-columns:
        minmax(0, 1.5fr)
        minmax(320px, .8fr);

    gap: 30px;

    align-items: start;

    padding-bottom: 70px;
}


/* ================= ORDER SECTION ================= */

.orderSection {

    background: white;

    border-radius: 18px;

    padding: 25px;

    box-shadow:
        0 5px 20px rgba(0,0,0,.08);
}

.sectionHeading {

    display: flex;
    align-items: center;

    gap: 12px;

    margin-bottom: 20px;
}

.sectionIcon {

    width: 43px;
    height: 43px;

    border-radius: 50%;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #fff1e6;

    font-size: 21px;
}

.sectionHeading h2 {

    color: #222;

    font-size: 22px;
}

.sectionHeading p {

    color: #888;

    font-size: 13px;

    margin-top: 3px;
}


/* ================= ITEM CARD ================= */

.itemCard {

    display: flex;
    align-items: center;

    gap: 18px;

    padding: 18px 0;

    border-bottom:
        1px solid #eee;

    transition: .3s;
}

.itemCard:last-child {

    border-bottom: none;
}

.itemImage {

    width: 120px;
    height: 105px;

    flex-shrink: 0;

    border-radius: 14px;

    overflow: hidden;

    background: #f5f5f5;
}

.itemImage img {

    width: 100%;
    height: 100%;

    object-fit: cover;

    transition: .4s;
}

.itemCard:hover .itemImage img {

    transform: scale(1.07);
}

.itemDetails {

    flex: 1;
}

.itemDetails h2 {

    color: #222;

    font-size: 20px;

    margin-bottom: 8px;
}

.quantity {

    color: #777;

    font-size: 14px;

    margin-bottom: 8px;
}

.price {

    color: #fc8019;

    font-size: 17px;

    font-weight: bold;
}


/* ITEM TOTAL */

.itemTotal {

    text-align: right;
}

.itemTotal p {

    color: #888;

    font-size: 12px;

    margin-bottom: 5px;
}

.itemTotal strong {

    color: #222;

    font-size: 18px;
}


/* ================= BILL ================= */

.bill {

    background: white;

    border-radius: 18px;

    padding: 25px;

    box-shadow:
        0 5px 20px rgba(0,0,0,.08);

    position: sticky;

    top: 100px;
}

.bill h2 {

    color: #222;

    font-size: 22px;

    margin-bottom: 22px;
}

.billRow {

    display: flex;

    justify-content: space-between;

    gap: 20px;

    margin-bottom: 15px;

    color: #666;

    font-size: 14px;
}

.billRow span:last-child {

    color: #333;

    font-weight: 500;
}

.divider {

    border: none;

    border-top: 1px solid #eee;

    margin: 20px 0;
}


/* ================= TOTAL ================= */

.grandTotal {

    display: flex;

    align-items: center;
    justify-content: space-between;

    font-size: 20px;

    font-weight: bold;

    margin-bottom: 22px;
}

.grandTotal span:last-child {

    color: #fc8019;

    font-size: 23px;
}


/* ================= STATUS ================= */

.orderStatus {

    background: #f0fff4;

    border: 1px solid #c7efd2;

    border-radius: 10px;

    padding: 12px;

    text-align: center;

    color: #28a745;

    font-size: 14px;

    font-weight: bold;

    margin-bottom: 20px;
}


/* ================= BACK BUTTON ================= */

.backButton {

    display: block;

    width: 100%;

    text-align: center;

    padding: 14px;

    background: #fc8019;

    color: white;

    border-radius: 10px;

    text-decoration: none;

    font-size: 16px;

    font-weight: bold;

    transition: .3s;
}

.backButton:hover {

    background: #e46e0d;

    transform: translateY(-2px);

    box-shadow:
        0 7px 18px rgba(252,128,25,.25);
}

.homeLink {

    display: block;

    text-align: center;

    margin-top: 15px;

    color: #fc8019;

    text-decoration: none;

    font-size: 14px;

    font-weight: bold;
}


/* ================= EMPTY ================= */

.emptyOrder {

    text-align: center;

    padding: 60px 20px;
}

.emptyOrder .icon {

    font-size: 65px;

    margin-bottom: 15px;
}

.emptyOrder h2 {

    color: #333;

    margin-bottom: 10px;
}

.emptyOrder p {

    color: #777;
}


/* ================= RESPONSIVE ================= */

@media(max-width: 900px) {

    .mainContainer {

        grid-template-columns: 1fr;
    }

    .bill {

        position: static;
    }
}


@media(max-width: 600px) {

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

    .orderSection {

        padding: 18px;
    }

    .itemCard {

        align-items: flex-start;
    }

    .itemImage {

        width: 90px;
        height: 85px;
    }

    .itemDetails h2 {

        font-size: 17px;
    }

    .itemTotal {

        display: none;
    }
}

</style>

</head>


<body>


<!-- ================= HEADER ================= -->

<header>


    <div class="logo">

        🍔 Foodify

    </div>


    <nav>

        <a href="restaurant">
            Home
        </a>

        <a href="favorites">
            ❤️ Favorites
        </a>

        <a href="myOrders">
            My Orders
        </a>

    </nav>


</header>


<!-- ================= TITLE ================= -->

<div class="pageTitle">


    <h1>

        Order <span>Details</span> 📦

    </h1>


    <p>

        Review your ordered items and complete bill details

    </p>


</div>


<%

List<OrderItem> items =
    (List<OrderItem>)
    request.getAttribute("orderItems");

double itemTotal = 0;

%>


<div class="mainContainer">


<!-- =================================================
                  LEFT SIDE
================================================== -->


<div class="orderSection">


    <div class="sectionHeading">


        <div class="sectionIcon">

            🍽️

        </div>


        <div>

            <h2>
                Ordered Items
            </h2>

            <p>
                Items included in this order
            </p>

        </div>


    </div>


<%

if(items != null && !items.isEmpty()) {


    for(OrderItem item : items) {


        double total =
            item.getPrice()
            * item.getQuantity();


        itemTotal += total;

%>


<!-- ================= ITEM ================= -->


<div class="itemCard">


    <div class="itemImage">


        <img
            src="<%=item.getImagePath()%>"
            alt="<%=item.getItemName()%>">


    </div>


    <div class="itemDetails">


        <h2>

            <%=item.getItemName()%>

        </h2>


        <div class="quantity">

            Quantity:
            <strong>
                <%=item.getQuantity()%>
            </strong>

        </div>


        <div class="price">

            ₹ <%=String.format("%.2f",
                    item.getPrice())%>

        </div>


    </div>


    <div class="itemTotal">


        <p>
            Item Total
        </p>


        <strong>

            ₹ <%=String.format("%.2f",
                    total)%>

        </strong>


    </div>


</div>


<%

    }

}
else {

%>


<!-- ================= EMPTY ================= -->


<div class="emptyOrder">


    <div class="icon">

        📦

    </div>


    <h2>

        No Order Items Found

    </h2>


    <p>

        We couldn't find items for this order.

    </p>


</div>


<%

}

%>


</div>


<!-- =================================================
                   BILL DETAILS
================================================== -->


<%

double gst =
    itemTotal * 0.05;

double packing = 20;

double delivery = 40;

double platform = 10;

double restaurantCharge = 15;


double finalAmount =
    itemTotal
    + gst
    + packing
    + delivery
    + platform
    + restaurantCharge;

%>


<div class="bill">


    <h2>

        Bill Details

    </h2>


    <div class="billRow">


        <span>
            Item Total
        </span>


        <span>

            ₹ <%=String.format("%.2f",
                    itemTotal)%>

        </span>


    </div>


    <div class="billRow">


        <span>
            GST (5%)
        </span>


        <span>

            ₹ <%=String.format("%.2f",
                    gst)%>

        </span>


    </div>


    <div class="billRow">


        <span>
            Packing Charges
        </span>


        <span>

            ₹ <%=String.format("%.2f",
                    packing)%>

        </span>


    </div>


    <div class="billRow">


        <span>
            Delivery Fee
        </span>


        <span>

            ₹ <%=String.format("%.2f",
                    delivery)%>

        </span>


    </div>


    <div class="billRow">


        <span>
            Platform Fee
        </span>


        <span>

            ₹ <%=String.format("%.2f",
                    platform)%>

        </span>


    </div>


    <div class="billRow">


        <span>
            Restaurant Charges
        </span>


        <span>

            ₹ <%=String.format("%.2f",
                    restaurantCharge)%>

        </span>


    </div>


    <hr class="divider">


    <div class="grandTotal">


        <span>

            Grand Total

        </span>


        <span>

            ₹ <%=String.format("%.2f",
                    finalAmount)%>

        </span>


    </div>


    <div class="orderStatus">

        ✓ Order Details Available

    </div>


    <a
        href="myOrders"
        class="backButton">

        ← Back To My Orders

    </a>


    <a
        href="restaurant"
        class="homeLink">

        Continue Exploring Restaurants

    </a>


</div>


</div>


</body>

</html>