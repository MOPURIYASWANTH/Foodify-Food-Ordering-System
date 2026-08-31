<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Restaurant" %>
<%@ page import="com.food.model.User" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Foodify - Restaurants</title>

<style>

/* ==================================================
   GLOBAL
================================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

html {
    scroll-behavior: smooth;
}

body {
    background: #fc8019;
    color: #333;
}


/* ==================================================
   HEADER
================================================== */

header {
    background: #ffffff;
    display: flex;
    align-items: center;
    padding: 18px 60px;
    box-shadow: 0 3px 10px rgba(0,0,0,.1);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 32px;
    color: #fc8019;
    font-weight: bold;
    white-space: nowrap;
    margin-right: 40px;
}


/* ==================================================
   TOP SEARCH
================================================== */

.headerSearch {
    flex: 1;
    max-width: 600px;
}

.headerSearch form {
    width: 100%;
    display: flex;
    background: #ffffff;
    border: 1px solid #ccc;
    border-radius: 40px;
    overflow: hidden;
    transition: .3s;
}

.headerSearch form:focus-within {
    border-color: #fc8019;
    box-shadow: 0 3px 12px rgba(252,128,25,.25);
}

.headerSearch input {
    flex: 1;
    padding: 14px 20px;
    border: none;
    outline: none;
    font-size: 16px;
    background: #fafafa;
}

.headerSearch button {
    width: 60px;
    border: none;
    background: #fc8019;
    color: white;
    font-size: 19px;
    cursor: pointer;
}

.headerSearch button:hover {
    background: #e46e0d;
}


/* ==================================================
   NAVIGATION
================================================== */

nav {
    margin-left: auto;
    display: flex;
    align-items: center;
}

nav a {
    text-decoration: none;
    color: #333;
    margin-left: 25px;
    font-weight: bold;
}

nav a:hover {
    color: #fc8019;
}


/* ==================================================
   HERO WRAPPER
================================================== */

.heroWrapper {
    width: 92%;
    margin: 35px auto 45px;
    position: relative;
}


/* ==================================================
   HERO
================================================== */

.hero {
    min-height: calc(100vh - 150px);
    background: linear-gradient(
        135deg,
        #ffffff 0%,
        #fffaf5 60%,
        #fff0e3 100%
    );
    border-radius: 28px;
    display: flex;
    align-items: center;
    padding: 55px 6%;
    position: relative;
    overflow: hidden;
    box-shadow: 0 12px 35px rgba(0,0,0,.18);
}

.hero::before {
    content: "";
    position: absolute;
    width: 430px;
    height: 430px;
    border-radius: 50%;
    background: rgba(252,128,25,.09);
    right: -110px;
    top: -120px;
}

.hero::after {
    content: "";
    position: absolute;
    width: 300px;
    height: 300px;
    border-radius: 50%;
    background: rgba(252,128,25,.06);
    left: -120px;
    bottom: -140px;
}


/* ==================================================
   HERO LEFT
================================================== */

.heroContent {
    width: 50%;
    position: relative;
    z-index: 10;
}

.heroBadge {
    display: inline-block;
    padding: 9px 18px;
    border-radius: 30px;
    background: #fff0e4;
    color: #fc8019;
    font-size: 13px;
    font-weight: bold;
    margin-bottom: 24px;
}

.heroContent h1 {
    font-size: clamp(45px, 5vw, 67px);
    line-height: 1.07;
    color: #222;
    margin-bottom: 23px;
}

.heroContent h1 span {
    color: #fc8019;
}

.heroContent p {
    max-width: 520px;
    color: #666;
    font-size: 18px;
    line-height: 1.7;
    margin-bottom: 30px;
}

.exploreButton {
    display: inline-block;
    padding: 15px 28px;
    border-radius: 30px;
    background: #fc8019;
    color: white;
    text-decoration: none;
    font-weight: bold;
    box-shadow: 0 8px 22px rgba(252,128,25,.3);
    transition: .3s;
}

.exploreButton:hover {
    background: #e46e0d;
    transform: translateY(-3px);
}

.heroFeatures {
    display: flex;
    gap: 35px;
    margin-top: 38px;
}

.feature {
    display: flex;
    align-items: center;
    gap: 10px;
}

.featureIcon {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    background: #fff0e4;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
}

.feature strong {
    display: block;
    color: #333;
    font-size: 14px;
}

.feature small {
    color: #888;
}


/* ==================================================
   HERO FOOD IMAGE
================================================== */

.heroVisual {
    width: 50%;
    min-height: 520px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    z-index: 10;
    perspective: 1100px;
}

.foodGlow {
    position: absolute;
    width: 440px;
    height: 440px;
    border-radius: 50%;
    background: radial-gradient(
        circle,
        #ffd8b8 0%,
        #fff0e4 50%,
        transparent 72%
    );
    animation: glowAnimation 4s ease-in-out infinite;
}

@keyframes glowAnimation {
    0%, 100% {
        transform: scale(1);
    }

    50% {
        transform: scale(1.07);
    }
}

.heroFoodImage {
    width: 88%;
    max-width: 540px;
    max-height: 480px;
    object-fit: contain;
    position: relative;
    z-index: 10;
    filter: drop-shadow(0 28px 22px rgba(0,0,0,.20));
    animation: foodFloat 4s ease-in-out infinite;
    transition: transform .2s ease;
}

@keyframes foodFloat {
    0%,100% {
        transform: translateY(0) rotate(-1deg);
    }

    50% {
        transform: translateY(-20px) rotate(1deg);
    }
}


/* ==================================================
   FLOATING FOOD
================================================== */

.floatingFood {
    position: absolute;
    z-index: 20;
    font-size: 58px;
    filter: drop-shadow(0 10px 8px rgba(0,0,0,.16));
}

.chicken {
    left: 3%;
    top: 80px;
    animation: floatOne 4s ease-in-out infinite;
}

.fries {
    right: 2%;
    top: 90px;
    animation: floatTwo 4.5s ease-in-out infinite;
}

.burger {
    left: 5%;
    bottom: 70px;
    animation: floatTwo 5s ease-in-out infinite;
}

.drink {
    right: 5%;
    bottom: 70px;
    animation: floatOne 4.8s ease-in-out infinite;
}

@keyframes floatOne {
    0%,100% {
        transform: translateY(0) rotate(-5deg);
    }

    50% {
        transform: translateY(-22px) rotate(7deg);
    }
}

@keyframes floatTwo {
    0%,100% {
        transform: translateY(0) rotate(6deg);
    }

    50% {
        transform: translateY(20px) rotate(-6deg);
    }
}


/* ==================================================
   SCROLL TEXT
================================================== */

.scrollDown {
    position: absolute;
    bottom: 18px;
    left: 50%;
    transform: translateX(-50%);
    text-decoration: none;
    text-align: center;
    color: #777;
    font-size: 12px;
    z-index: 30;
}

.scrollDown span {
    display: block;
    margin-top: 4px;
    font-size: 24px;
    color: #fc8019;
    animation: bounce 1.8s infinite;
}

@keyframes bounce {
    0%,100% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(7px);
    }
}


/* ==================================================
   RESTAURANT SECTION
================================================== */

.restaurantSection {
    padding: 40px 4% 80px;
    background: #fc8019;
}

.sectionHeading {
    text-align: center;
    margin-bottom: 35px;
    color: white;
}

.sectionHeading h2 {
    font-size: 38px;
    color: white;
    margin-bottom: 10px;
}

.sectionHeading p {
    color: #ffffff;
    font-size: 16px;
}


/* ==================================================
   RESTAURANT GRID
================================================== */

.container {
    width: 100%;
    max-width: 1450px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(4, minmax(0,1fr));
    gap: 24px;
}


/* ==================================================
   RESTAURANT CARD
================================================== */

.card {
    background: #ffffff;
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0,0,0,.15);
    transition: .3s;
    opacity: 0;
    transform: translateY(35px);
}

.card.show {
    opacity: 1;
    transform: translateY(0);
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 25px rgba(0,0,0,.25);
}


/* ==================================================
   RESTAURANT IMAGE
================================================== */

.cardImage {
    width: 100%;
    height: 210px;
    position: relative;
    overflow: hidden;
}

.cardImage img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: .4s;
}

.card:hover .cardImage img {
    transform: scale(1.06);
}

.rating {
    position: absolute;
    top: 12px;
    right: 12px;
    background: #28a745;
    color: white;
    padding: 6px 10px;
    border-radius: 7px;
    font-size: 13px;
    font-weight: bold;
}

.deliveryTime {
    position: absolute;
    bottom: 12px;
    left: 12px;
    padding: 6px 10px;
    border-radius: 7px;
    background: rgba(0,0,0,.75);
    color: white;
    font-size: 12px;
    font-weight: bold;
}


/* ==================================================
   FAVORITE BUTTON
================================================== */

.favoriteForm {
    position: absolute;
    top: 12px;
    left: 12px;
    z-index: 30;
}

.favoriteButton {
    width: 43px;
    height: 43px;
    border: none;
    border-radius: 50%;
    background: rgba(255,255,255,.95);
    color: #fc8019;
    font-size: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0,0,0,.20);
    transition: .3s;
}

.favoriteButton:hover {
    background: #fc8019;
    color: white;
    transform: scale(1.12);
}


/* ==================================================
   DETAILS
================================================== */

.details {
    padding: 18px;
}

.details h2 {
    color: #333;
    font-size: 20px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.cuisine {
    margin-top: 10px;
    color: #666;
    font-size: 14px;
}

.address {
    margin-top: 8px;
    color: #777;
    font-size: 13px;
    line-height: 1.4;
    min-height: 38px;
}


/* ==================================================
   CARD BOTTOM
================================================== */

.cardBottom {
    margin-top: 15px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.status {
    color: #28a745;
    font-size: 13px;
    font-weight: bold;
    white-space: nowrap;
}

.viewMenuLink {
    flex: 1;
    text-decoration: none;
}

.menuButton {
    width: 100%;
    padding: 11px;
    border: none;
    background: #fc8019;
    color: white;
    font-size: 14px;
    font-weight: bold;
    border-radius: 8px;
    cursor: pointer;
}

.menuButton:hover {
    background: #e46e0d;
}


/* ==================================================
   PROFILE PANEL
================================================== */

.profilePanel {
    position: fixed;
    top: 0;
    right: -350px;
    width: 320px;
    height: 100%;
    background: white;
    box-shadow: -3px 0 15px rgba(0,0,0,.3);
    padding: 25px;
    transition: .4s;
    z-index: 3000;
}

.profilePanel.open {
    right: 0;
}

.profilePanel h2 {
    color: #fc8019;
    margin-top: 40px;
    margin-bottom: 10px;
}

.profilePanel p {
    margin-bottom: 20px;
    color: #666;
}

.profilePanel a {
    display: block;
    text-decoration: none;
    color: #333;
    font-size: 17px;
    padding: 9px 0;
}

.profilePanel a:hover {
    color: #fc8019;
}

.closeBtn {
    position: absolute;
    top: 20px;
    right: 20px;
    border: none;
    background: none;
    font-size: 22px;
    cursor: pointer;
}


/* ==================================================
   RESPONSIVE
================================================== */

@media(max-width:1100px) {

    .container {
        grid-template-columns: repeat(3,1fr);
    }
}

@media(max-width:850px) {

    header {
        flex-wrap: wrap;
        gap: 14px;
        padding: 15px 25px;
    }

    .headerSearch {
        order: 3;
        max-width: none;
        flex-basis: 100%;
    }

    .hero {
        flex-direction: column;
        text-align: center;
        padding: 70px 6% 100px;
    }

    .heroContent {
        width: 100%;
    }

    .heroContent p {
        margin-left: auto;
        margin-right: auto;
    }

    .heroFeatures {
        justify-content: center;
    }

    .heroVisual {
        width: 100%;
        margin-top: 35px;
    }

    .container {
        grid-template-columns: repeat(2,1fr);
    }
}

@media(max-width:550px) {

    header {
        padding: 14px 18px;
    }

    .logo {
        font-size: 26px;
    }

    nav a {
        margin-left: 12px;
        font-size: 13px;
    }

    nav a:first-child,
    nav a:nth-child(2) {
        display: none;
    }

    .heroWrapper {
        width: 94%;
        margin-top: 20px;
    }

    .hero {
        border-radius: 20px;
    }

    .heroContent h1 {
        font-size: 40px;
    }

    .heroContent p {
        font-size: 16px;
    }

    .heroFeatures {
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }

    .heroVisual {
        min-height: 390px;
    }

    .heroFoodImage {
        width: 95%;
    }

    .floatingFood {
        font-size: 43px;
    }

    .container {
        grid-template-columns: 1fr;
    }

    .cardImage {
        height: 220px;
    }
}

</style>
</head>

<body>

<%
User user = (User) session.getAttribute("loggedInUser");
%>


<!-- ==================================================
     HEADER
================================================== -->

<header>

    <div class="logo">
        🍔 Foodify
    </div>


    <div class="headerSearch">

        <form action="searchRestaurants" method="get">

            <input
                type="text"
                name="food"
                placeholder="Search Restaurants, Food..."
                required>

            <button type="submit">
                🔍
            </button>

        </form>

    </div>


    <nav>

        <a href="#home">
            Home
        </a>

        <a href="#restaurants">
            Restaurants
        </a>

        <a href="cart.jsp">
            Cart
        </a>

        <a
            href="#"
            onclick="openProfile(); return false;">
            Profile
        </a>

    </nav>

</header>


<!-- ==================================================
     PROFILE PANEL
================================================== -->

<div id="profilePanel" class="profilePanel">

    <button
        class="closeBtn"
        onclick="closeProfile()">
        ✖
    </button>


    <% if(user != null) { %>

        <h2>
            👤 <%= user.getName() %>
        </h2>

        <p>
            <%= user.getEmail() %>
        </p>

        <hr>
        <br>

        <a href="editProfile.jsp">
            ✏ Edit Profile
        </a>

        <a href="myOrders">
            📦 My Orders
        </a>

        <a href="favorites">
            ❤ Favorites
        </a>

        <a href="logout">
            🚪 Logout
        </a>

    <% } else { %>

        <h2>
            Welcome
        </h2>

        <p>
            Please Login
        </p>

        <a href="login.jsp">
            Sign In
        </a>

        <a href="signup.jsp">
            Sign Up
        </a>

    <% } %>

</div>


<!-- ==================================================
     HERO
================================================== -->

<div class="heroWrapper" id="home">

<section class="hero">

    <div class="heroContent">

        <div class="heroBadge">
            ⚡ FAST DELIVERY • FRESH FOOD
        </div>

        <h1>
            India's delicious
            <span>food delivery</span>
            experience
        </h1>

        <p>
            Experience fast & easy online ordering
            with Foodify. Discover your favourite
            restaurants and enjoy delicious food
            delivered right to your door.
        </p>

        <a href="#restaurants" class="exploreButton">
            Explore Restaurants →
        </a>


        <div class="heroFeatures">

            <div class="feature">

                <div class="featureIcon">
                    🚴
                </div>

                <div>
                    <strong>
                        Fast Delivery
                    </strong>

                    <small>
                        25-30 minutes
                    </small>
                </div>

            </div>


            <div class="feature">

                <div class="featureIcon">
                    🍽️
                </div>

                <div>
                    <strong>
                        Delicious Food
                    </strong>

                    <small>
                        Top restaurants
                    </small>
                </div>

            </div>

        </div>

    </div>


    <div class="heroVisual" id="heroVisual">

        <div class="foodGlow"></div>

        <div class="floatingFood chicken">
            🍗
        </div>

        <div class="floatingFood fries">
            🍟
        </div>

        <div class="floatingFood burger">
            🍔
        </div>

        <div class="floatingFood drink">
            🥤
        </div>

        <img
            id="heroFood"
            class="heroFoodImage"
            src="images/KFC.jpg"
            alt="Foodify Food">

    </div>


    <a href="#restaurants" class="scrollDown">
        Scroll to restaurants
        <span>↓</span>
    </a>

</section>

</div>


<!-- ==================================================
     RESTAURANTS
================================================== -->

<section
    class="restaurantSection"
    id="restaurants">


    <div class="sectionHeading">

        <h2>
            Popular Restaurants Near You
        </h2>

        <p>
            Explore delicious food from
            your favourite restaurants.
        </p>

    </div>


    <div class="container">


<%

List<Restaurant> allRestaurant =
    (List<Restaurant>) request.getAttribute("allRestaurant");


if(allRestaurant != null &&
   !allRestaurant.isEmpty()) {


    for(Restaurant restaurant : allRestaurant) {

%>


        <div class="card">


            <div class="cardImage">


                <img
                    src="<%= restaurant.getImagePath() %>"
                    alt="<%= restaurant.getRestaurantName() %>">


                <!-- FAVORITE BUTTON -->

                <form
                    action="favorite"
                    method="post"
                    class="favoriteForm">

                    <input
                        type="hidden"
                        name="restaurantId"
                        value="<%= restaurant.getRestaurantId() %>">

                    <input
                        type="hidden"
                        name="action"
                        value="add">

                    <button
                        type="submit"
                        class="favoriteButton"
                        title="Add to Favorites">
                        ♡
                    </button>

                </form>


                <div class="rating">
                    ★ <%= restaurant.getRating() %>
                </div>


                <div class="deliveryTime">
                    🚴 25-30 mins
                </div>


            </div>


            <div class="details">


                <h2>
                    <%= restaurant.getRestaurantName() %>
                </h2>


                <div class="cuisine">
                    <%= restaurant.getCuisineType() %>
                </div>


                <div class="address">
                    📍 <%= restaurant.getAddress() %>
                </div>


                <div class="cardBottom">


                    <div class="status">
                        ● Open
                    </div>


                    <a
                        class="viewMenuLink"
                        href="menu?restaurantId=<%= restaurant.getRestaurantId() %>">

                        <button
                            type="button"
                            class="menuButton">

                            View Menu

                        </button>

                    </a>


                </div>


            </div>


        </div>


<%

    }

} else {

%>


        <div
            style="
            grid-column:1/-1;
            text-align:center;
            color:white;
            padding:50px;">

            <h2>
                No Restaurants Available
            </h2>

        </div>


<%

}

%>


    </div>

</section>


<!-- ==================================================
     JAVASCRIPT
================================================== -->

<script>


/* PROFILE */

function openProfile() {

    document
        .getElementById("profilePanel")
        .classList
        .add("open");
}


function closeProfile() {

    document
        .getElementById("profilePanel")
        .classList
        .remove("open");
}


/* ==================================================
   RESTAURANT SCROLL ANIMATION
================================================== */

const cards =
    document.querySelectorAll(".card");


const observer =
    new IntersectionObserver(
        function(entries) {

            entries.forEach(
                function(entry) {

                    if(entry.isIntersecting) {

                        entry.target
                            .classList
                            .add("show");
                    }

                }
            );

        },
        {
            threshold: 0.12
        }
    );


cards.forEach(
    function(card) {
        observer.observe(card);
    }
);


/* ==================================================
   FOOD IMAGE 3D MOUSE EFFECT
================================================== */

const heroVisual =
    document.getElementById("heroVisual");


const heroFood =
    document.getElementById("heroFood");


if(heroVisual && heroFood) {

    heroVisual.addEventListener(
        "mousemove",
        function(event) {

            const rect =
                heroVisual.getBoundingClientRect();

            const x =
                event.clientX - rect.left;

            const y =
                event.clientY - rect.top;

            const centerX =
                rect.width / 2;

            const centerY =
                rect.height / 2;

            const rotateY =
                (x - centerX) / 35;

            const rotateX =
                -(y - centerY) / 40;

            heroFood.style.animation =
                "none";

            heroFood.style.transform =
                "rotateX(" +
                rotateX +
                "deg) " +
                "rotateY(" +
                rotateY +
                "deg) " +
                "scale(1.03)";
        }
    );


    heroVisual.addEventListener(
        "mouseleave",
        function() {

            heroFood.style.transform = "";

            heroFood.style.animation =
                "foodFloat 4s ease-in-out infinite";
        }
    );

}

</script>

</body>
</html>
