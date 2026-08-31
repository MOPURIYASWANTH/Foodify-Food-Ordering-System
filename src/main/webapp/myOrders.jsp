<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Order"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodify - My Orders</title>

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


/* ================= CONTAINER ================= */

.container {

    width: 90%;
    max-width: 1050px;

    margin: auto;

    padding-bottom: 70px;
}


/* ================= ORDER CARD ================= */

.orderCard {

    background: white;

    border-radius: 18px;

    margin-bottom: 22px;

    overflow: hidden;

    box-shadow:
        0 5px 20px rgba(0,0,0,.08);

    transition: .3s;
}

.orderCard:hover {

    transform: translateY(-4px);

    box-shadow:
        0 10px 28px rgba(0,0,0,.13);
}


/* ================= CARD HEADER ================= */

.orderHeader {

    padding: 20px 24px;

    display: flex;
    align-items: center;
    justify-content: space-between;

    border-bottom: 1px solid #eee;
}

.orderNumber {

    display: flex;
    align-items: center;

    gap: 13px;
}

.orderIcon {

    width: 45px;
    height: 45px;

    border-radius: 50%;

    background: #fff1e6;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 21px;
}

.orderNumber h2 {

    color: #222;

    font-size: 20px;

    margin-bottom: 3px;
}

.orderNumber p {

    color: #888;

    font-size: 12px;
}


/* ================= STATUS ================= */

.status {

    display: inline-flex;

    align-items: center;

    gap: 6px;

    background: #effff3;

    color: #28a745;

    border: 1px solid #c9efd2;

    padding: 7px 12px;

    border-radius: 20px;

    font-size: 13px;

    font-weight: bold;
}


/* ================= DETAILS ================= */

.orderBody {

    padding: 22px 24px;
}

.orderInfo {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 18px;

    margin-bottom: 22px;
}

.infoBox {

    background: #fffaf6;

    border: 1px solid #f4e6da;

    border-radius: 12px;

    padding: 16px;
}

.infoLabel {

    color: #888;

    font-size: 12px;

    margin-bottom: 8px;
}

.infoValue {

    color: #333;

    font-size: 15px;

    font-weight: bold;

    word-break: break-word;
}

.amount {

    color: #fc8019;

    font-size: 18px;
}


/* ================= BOTTOM ================= */

.orderBottom {

    display: flex;

    align-items: center;
    justify-content: space-between;

    gap: 20px;

    padding-top: 18px;

    border-top: 1px solid #eee;
}

.orderMessage {

    color: #777;

    font-size: 13px;
}

.viewButton {

    border: none;

    background: #fc8019;

    color: white;

    padding: 11px 22px;

    border-radius: 9px;

    font-size: 14px;

    font-weight: bold;

    cursor: pointer;

    transition: .3s;
}

.viewButton:hover {

    background: #e46e0d;

    transform: translateY(-2px);

    box-shadow:
        0 6px 15px rgba(252,128,25,.25);
}


/* ================= EMPTY ORDERS ================= */

.empty {

    max-width: 700px;

    margin: 40px auto;

    background: white;

    text-align: center;

    padding: 65px 25px;

    border-radius: 22px;

    box-shadow:
        0 5px 25px rgba(0,0,0,.08);
}

.emptyIcon {

    font-size: 75px;

    margin-bottom: 20px;
}

.empty h2 {

    color: #333;

    font-size: 27px;

    margin-bottom: 10px;
}

.empty p {

    color: #777;

    margin-bottom: 25px;

    line-height: 1.6;
}

.orderNow {

    display: inline-block;

    padding: 13px 28px;

    background: #fc8019;

    color: white;

    text-decoration: none;

    border-radius: 25px;

    font-weight: bold;

    transition: .3s;
}

.orderNow:hover {

    background: #e46e0d;

    transform: translateY(-2px);
}


/* ================= CONTINUE SHOPPING ================= */

.continueSection {

    text-align: center;

    margin-top: 30px;
}

.continueLink {

    color: #fc8019;

    text-decoration: none;

    font-weight: bold;

    font-size: 14px;
}

.continueLink:hover {

    text-decoration: underline;
}


/* ================= RESPONSIVE ================= */

@media(max-width: 750px) {

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

    .orderInfo {

        grid-template-columns: 1fr;
    }

    .orderHeader {

        align-items: flex-start;

        gap: 15px;
    }

    .orderBottom {

        flex-direction: column;

        align-items: stretch;
    }

    .viewButton {

        width: 100%;
    }

}


@media(max-width: 500px) {

    .orderHeader {

        flex-direction: column;
    }

    .orderBody {

        padding: 18px;
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

        <a href="cart.jsp">
            🛒 Cart
        </a>

    </nav>


</header>


<!-- ================= PAGE TITLE ================= -->

<div class="pageTitle">


    <h1>

        My <span>Orders</span> 📦

    </h1>


    <p>

        View your previous orders and complete order details

    </p>


</div>


<!-- ================= CONTAINER ================= -->

<div class="container">


<%

List<Order> orders =
    (List<Order>)
    request.getAttribute("orders");


if(orders == null ||
   orders.isEmpty()) {

%>


<!-- ================= EMPTY ================= -->

<div class="empty">


    <div class="emptyIcon">

        📦

    </div>


    <h2>

        No Orders Yet

    </h2>


    <p>

        Looks like you haven't placed any orders yet.
        Explore restaurants and order something delicious.

    </p>


    <a
        href="restaurant"
        class="orderNow">

        Explore Restaurants →

    </a>


</div>


<%

}
else {


for(Order order : orders) {

%>


<!-- ================= ORDER CARD ================= -->

<div class="orderCard">


    <!-- HEADER -->

    <div class="orderHeader">


        <div class="orderNumber">


            <div class="orderIcon">

                🛍️

            </div>


            <div>


                <h2>

                    Order #<%=order.getOrderId()%>

                </h2>


                <p>

                    Foodify Order

                </p>


            </div>


        </div>


        <div class="status">

            ● <%=order.getStatus()%>

        </div>


    </div>


    <!-- BODY -->

    <div class="orderBody">


        <div class="orderInfo">


            <!-- DATE -->

            <div class="infoBox">


                <div class="infoLabel">

                    📅 ORDER DATE

                </div>


                <div class="infoValue">

                    <%=order.getOrderDate()%>

                </div>


            </div>


            <!-- RESTAURANT -->

            <div class="infoBox">


                <div class="infoLabel">

                    🍴 RESTAURANT ID

                </div>


                <div class="infoValue">

                    #<%=order.getRestaurantId()%>

                </div>


            </div>


            <!-- AMOUNT -->

            <div class="infoBox">


                <div class="infoLabel">

                    💰 TOTAL AMOUNT

                </div>


                <div class="infoValue amount">

                    ₹ <%=String.format(
                            "%.2f",
                            order.getTotalAmount())%>

                </div>


            </div>


        </div>


        <!-- BOTTOM -->

        <div class="orderBottom">


            <div class="orderMessage">

                📋 View items and complete bill information

            </div>


            <form
                action="orderDetails"
                method="get">


                <input
                    type="hidden"
                    name="orderId"
                    value="<%=order.getOrderId()%>">


                <button
                    type="submit"
                    class="viewButton">

                    View Order Details →

                </button>


            </form>


        </div>


    </div>


</div>


<%

}

%>


<div class="continueSection">


    <a
        href="restaurant"
        class="continueLink">

        ← Continue Exploring Restaurants

    </a>


</div>


<%

}

%>


</div>


</body>

</html>