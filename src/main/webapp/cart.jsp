<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodify - My Cart</title>

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

    box-shadow: 0 3px 15px rgba(0,0,0,0.08);
}

.logo {
    font-size: 30px;
    font-weight: bold;
    color: #fc8019;
}

nav {
    display: flex;
    gap: 28px;
}

nav a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
    transition: 0.3s;
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
}


/* ================= MAIN ================= */

.cartWrapper {
    width: 90%;
    max-width: 1250px;

    margin: auto;
    padding-bottom: 70px;

    display: grid;
    grid-template-columns: 1fr 360px;
    gap: 30px;

    align-items: start;
}


/* ================= CART ITEMS ================= */

.cartItems {
    display: flex;
    flex-direction: column;
    gap: 18px;
}

.card {
    background: white;

    border-radius: 18px;

    padding: 18px;

    display: flex;
    gap: 20px;

    box-shadow: 0 5px 20px rgba(0,0,0,0.08);

    transition: 0.3s;
}

.card:hover {
    transform: translateY(-3px);

    box-shadow:
        0 10px 28px rgba(0,0,0,0.13);
}


/* FOOD IMAGE */

.foodImage {
    width: 160px;
    height: 140px;

    flex-shrink: 0;

    border-radius: 14px;
    overflow: hidden;
}

.foodImage img {
    width: 100%;
    height: 100%;

    object-fit: cover;

    transition: 0.4s;
}

.card:hover .foodImage img {
    transform: scale(1.06);
}


/* DETAILS */

.details {
    flex: 1;
}

.details h2 {
    font-size: 21px;
    margin-bottom: 9px;
    color: #222;
}

.price {
    color: #fc8019;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 15px;
}


/* QUANTITY */

.quantityRow {
    display: flex;
    align-items: center;
    gap: 14px;

    margin-bottom: 15px;
}

.quantityLabel {
    color: #666;
    font-size: 14px;
}

.quantityControl {
    display: flex;
    align-items: center;

    border: 1px solid #fc8019;
    border-radius: 8px;

    overflow: hidden;
}

.quantityControl form {
    margin: 0;
}

.quantityButton {
    width: 35px;
    height: 34px;

    border: none;

    background: white;
    color: #fc8019;

    font-size: 20px;
    font-weight: bold;

    cursor: pointer;

    transition: 0.2s;
}

.quantityButton:hover {
    background: #fc8019;
    color: white;
}

.quantityNumber {
    min-width: 40px;

    text-align: center;

    font-weight: bold;
}


/* ITEM TOTAL */

.itemTotal {
    font-size: 15px;
    color: #555;
    margin-bottom: 15px;
}

.itemTotal strong {
    color: #222;
}


/* ACTION BUTTONS */

.actions {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}

.actions form {
    margin: 0;
}

.removeButton,
.addMoreButton {

    border: none;
    border-radius: 8px;

    padding: 9px 15px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;
}

.removeButton {
    background: #fff0f0;
    color: #dc3545;
}

.removeButton:hover {
    background: #dc3545;
    color: white;
}

.addMoreButton {
    background: #fff2e7;
    color: #fc8019;
}

.addMoreButton:hover {
    background: #fc8019;
    color: white;
}


/* ================= ORDER SUMMARY ================= */

.summary {
    background: white;

    border-radius: 18px;

    padding: 25px;

    box-shadow: 0 5px 20px rgba(0,0,0,0.08);

    position: sticky;
    top: 100px;
}

.summary h2 {
    font-size: 22px;
    margin-bottom: 22px;
}

.summaryLine {
    display: flex;
    justify-content: space-between;

    margin-bottom: 16px;

    color: #666;
    font-size: 15px;
}

.summaryDivider {
    border: none;
    border-top: 1px solid #eee;

    margin: 20px 0;
}

.grandTotal {
    display: flex;
    justify-content: space-between;

    font-size: 20px;
    font-weight: bold;

    color: #222;

    margin-bottom: 22px;
}

.grandTotal span:last-child {
    color: #fc8019;
}


/* CHECKOUT */

.checkoutButton {
    width: 100%;

    padding: 15px;

    border: none;
    border-radius: 10px;

    background: #fc8019;
    color: white;

    font-size: 17px;
    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;
}

.checkoutButton:hover {
    background: #e46e0d;

    transform: translateY(-2px);
}

.continueShopping {
    display: block;

    text-align: center;

    margin-top: 16px;

    color: #fc8019;

    text-decoration: none;
    font-weight: bold;

    font-size: 14px;
}


/* ================= EMPTY CART ================= */

.emptyCart {
    width: 90%;
    max-width: 700px;

    margin: 50px auto;

    background: white;

    border-radius: 22px;

    padding: 60px 25px;

    text-align: center;

    box-shadow: 0 5px 25px rgba(0,0,0,0.08);
}

.emptyIcon {
    font-size: 75px;
    margin-bottom: 20px;
}

.emptyCart h2 {
    font-size: 28px;
    margin-bottom: 12px;
}

.emptyCart p {
    color: #777;
    margin-bottom: 25px;
}

.browseButton {
    display: inline-block;

    background: #fc8019;
    color: white;

    padding: 13px 28px;

    border-radius: 25px;

    text-decoration: none;
    font-weight: bold;

    transition: 0.3s;
}

.browseButton:hover {
    background: #e46e0d;

    transform: translateY(-2px);
}


/* ================= RESPONSIVE ================= */

@media(max-width: 900px) {

    .cartWrapper {
        grid-template-columns: 1fr;
    }

    .summary {
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

    .card {
        flex-direction: column;
    }

    .foodImage {
        width: 100%;
        height: 200px;
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
        Your <span>Cart</span> 🛒
    </h1>

    <p>
        Review your delicious choices before checkout
    </p>

</div>


<%

Cart cart =
    (Cart) session.getAttribute("cart");

double grandTotal = 0;


if(cart == null ||
   cart.getItems().isEmpty()) {

%>


<!-- ================= EMPTY CART ================= -->

<div class="emptyCart">

    <div class="emptyIcon">
        🛒
    </div>

    <h2>
        Your Cart is Empty
    </h2>

    <p>
        Looks like you haven't added any delicious food yet.
    </p>

    <a
        href="restaurant"
        class="browseButton">

        Explore Restaurants →

    </a>

</div>


<%

}
else {

Map<Integer, CartItem> items =
        cart.getItems();

%>


<div class="cartWrapper">


<!-- ================= LEFT SIDE ================= -->

<div class="cartItems">


<%

for(CartItem item : items.values()) {

    double total =
        item.getPrice() * item.getQuantity();

    grandTotal += total;

%>


<div class="card">


    <!-- IMAGE -->

    <div class="foodImage">

        <img
            src="<%=item.getImagePath()%>"
            alt="<%=item.getName()%>">

    </div>


    <!-- DETAILS -->

    <div class="details">


        <h2>
            <%=item.getName()%>
        </h2>


        <div class="price">

            ₹ <%=String.format("%.2f",
                    item.getPrice())%>

        </div>


        <!-- QUANTITY -->

        <div class="quantityRow">

            <span class="quantityLabel">
                Quantity
            </span>


            <div class="quantityControl">


                <!-- MINUS -->

                <form
                    action="cartServlet"
                    method="post">

                    <input
                        type="hidden"
                        name="action"
                        value="update">

                    <input
                        type="hidden"
                        name="operation"
                        value="minus">

                    <input
                        type="hidden"
                        name="menuId"
                        value="<%=item.getMenuId()%>">

                    <button
                        type="submit"
                        class="quantityButton">

                        −

                    </button>

                </form>


                <span class="quantityNumber">

                    <%=item.getQuantity()%>

                </span>


                <!-- PLUS -->

                <form
                    action="cartServlet"
                    method="post">

                    <input
                        type="hidden"
                        name="action"
                        value="update">

                    <input
                        type="hidden"
                        name="operation"
                        value="plus">

                    <input
                        type="hidden"
                        name="menuId"
                        value="<%=item.getMenuId()%>">

                    <button
                        type="submit"
                        class="quantityButton">

                        +

                    </button>

                </form>


            </div>

        </div>


        <!-- TOTAL -->

        <div class="itemTotal">

            Item Total:

            <strong>

                ₹ <%=String.format("%.2f", total)%>

            </strong>

        </div>


        <!-- ACTIONS -->

        <div class="actions">


            <!-- REMOVE -->

            <form
                action="cartServlet"
                method="post">

                <input
                    type="hidden"
                    name="menuId"
                    value="<%=item.getMenuId()%>">

                <input
                    type="hidden"
                    name="action"
                    value="delete">

                <button
                    type="submit"
                    class="removeButton">

                    🗑 Remove

                </button>

            </form>


            <!-- ADD MORE -->

            <form
                action="menu"
                method="get">

                <input
                    type="hidden"
                    name="restaurantId"
                    value="<%=item.getRestaurantId()%>">

                <button
                    type="submit"
                    class="addMoreButton">

                    + Add More Items

                </button>

            </form>


        </div>


    </div>


</div>


<%

}

%>


</div>


<!-- ================= RIGHT SIDE ================= -->

<div class="summary">


    <h2>
        Order Summary
    </h2>


    <div class="summaryLine">

        <span>
            Items
        </span>

        <span>
            <%=items.size()%>
        </span>

    </div>


    <div class="summaryLine">

        <span>
            Item Total
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    grandTotal)%>

        </span>

    </div>


    <hr class="summaryDivider">


    <div class="grandTotal">

        <span>
            Grand Total
        </span>

        <span>

            ₹ <%=String.format("%.2f",
                    grandTotal)%>

        </span>

    </div>


    <!-- CHECKOUT -->

    <form
        action="checkout"
        method="get">

        <button
            type="submit"
            class="checkoutButton">

            Proceed To Checkout →

        </button>

    </form>


    <a
        href="restaurant"
        class="continueShopping">

        ← Continue Shopping

    </a>


</div>


</div>


<%

}

%>


</body>

</html>