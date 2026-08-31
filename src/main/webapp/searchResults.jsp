<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Restaurant" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Foodify - Search Results</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #fc8019;
        }

        /* HEADER */

        header {
            background: white;

            display: flex;

            justify-content: space-between;

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

        /* SEARCH */

        .search {
            width: 90%;

            margin: 30px auto;

            display: flex;

            justify-content: center;
        }

        .search form {
            width: 75%;

            display: flex;

            gap: 10px;
        }

        .search input {
            flex: 1;

            padding: 16px 22px;

            border-radius: 40px;

            border: 1px solid #ddd;

            font-size: 18px;

            outline: none;
        }

        .search input:focus {
            border-color: #fc8019;

            box-shadow:
                0 3px 15px rgba(252,128,25,.25);
        }

        .search button {
            padding: 0 25px;

            border: none;

            border-radius: 40px;

            background: white;

            color: #fc8019;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;
        }

        .search button:hover {
            background: #e46e0d;

            color: white;
        }

        /* TITLE */

        .resultTitle {
            width: 90%;

            margin: 10px auto 25px;

            text-align: center;

            color: white;
        }

        .resultTitle h1 {
            font-size: 28px;
        }

        .resultTitle p {
            margin-top: 8px;

            font-size: 16px;
        }

        /* CARDS */

        .container {
            width: 90%;

            margin: auto;

            display: grid;

            grid-template-columns:
                repeat(auto-fill, 280px);

            justify-content: center;

            gap: 20px;

            padding-bottom: 50px;
        }

        .card {
            background: white;

            border-radius: 18px;

            overflow: hidden;

            box-shadow:
                0 5px 20px rgba(0,0,0,.12);

            transition: .3s;
        }

        .card:hover {
            transform: translateY(-8px);

            box-shadow:
                0 10px 25px rgba(0,0,0,.25);
        }

        .card img {
            width: 100%;

            height: 170px;

            object-fit: cover;
        }

        .details {
            padding: 18px;
        }

        .top {
            display: flex;

            justify-content: space-between;

            align-items: center;
        }

        .top h2 {
            font-size: 18px;
        }

        .rating {
            font-size: 14px;
        }

        .time {
            margin-top: 12px;

            font-weight: bold;

            color: #555;
        }

        .cuisine {
            margin-top: 10px;

            color: #777;
        }

        .address {
            margin-top: 8px;

            color: #555;
        }

        .status {
            margin-top: 15px;

            display: inline-block;

            padding: 6px 15px;

            background: #28a745;

            color: white;

            border-radius: 20px;
        }

        .menuButton {
            margin-top: 15px;

            width: 100%;

            padding: 10px;

            border: none;

            border-radius: 8px;

            background: #fc8019;

            color: white;

            font-size: 15px;

            cursor: pointer;
        }

        .menuButton:hover {
            background: #e46e0d;
        }

        /* NO RESULTS */

        .noResults {
            background: white;

            width: 400px;

            max-width: 90%;

            margin: 50px auto;

            padding: 40px;

            text-align: center;

            border-radius: 20px;

            box-shadow:
                0 5px 20px rgba(0,0,0,.15);
        }

        .noResults h2 {
            margin-bottom: 10px;
        }

        .noResults p {
            color: #666;

            margin-bottom: 20px;
        }

        .backButton {
            display: inline-block;

            padding: 10px 20px;

            background: #fc8019;

            color: white;

            text-decoration: none;

            border-radius: 8px;
        }

        /* MOBILE */

        @media (max-width: 768px) {

            header {
                padding: 15px 20px;

                flex-direction: column;

                gap: 15px;
            }

            nav {
                display: flex;

                flex-wrap: wrap;

                justify-content: center;

                gap: 12px;
            }

            nav a {
                margin-left: 0;

                font-size: 14px;
            }

            .search {
                width: 95%;
            }

            .search form {
                width: 100%;
            }

            .search input {
                font-size: 15px;
            }

            .container {
                grid-template-columns: 1fr;

                width: 90%;
            }

        }

    </style>

</head>


<body>


<!-- HEADER -->

<header>

    <div class="logo">
        🍔 Foodify
    </div>

    <nav>

        <a href="restaurant">
            Home
        </a>

        <a href="#">
            Offers
        </a>

        <a href="login.jsp">
            Sign In
        </a>

        <a href="signup.jsp">
            Sign Up
        </a>

        <a href="cart.jsp">
            Cart
        </a>

    </nav>

</header>


<!-- SEARCH AGAIN -->

<div class="search">

    <form action="searchRestaurants"
          method="get">

        <input
            type="text"
            name="food"
            value="<%= request.getAttribute("searchFood") %>"
            placeholder="Search food or restaurants..."
            required
        >

        <button type="submit">
            🔍 Search
        </button>

    </form>

</div>


<!-- RESULT TITLE -->

<%

String searchFood =
    (String) request.getAttribute("searchFood");

List<Restaurant> restaurants =
    (List<Restaurant>)
    request.getAttribute("restaurants");

%>


<div class="resultTitle">

    <h1>
        Restaurants serving "<%= searchFood %>"
    </h1>

    <p>
        <%= restaurants == null ? 0 : restaurants.size() %>
        restaurants found
    </p>

</div>


<!-- RESTAURANT CARDS -->

<%

if (restaurants == null ||
    restaurants.isEmpty()) {

%>


    <div class="noResults">

        <h2>
            😕 No restaurants found
        </h2>

        <p>
            We couldn't find restaurants
            serving "<%= searchFood %>".
        </p>

        <a href="restaurant"
           class="backButton">

            Explore Restaurants

        </a>

    </div>


<%

} else {

%>


    <div class="container">


    <%

        for (Restaurant restaurant : restaurants) {

    %>


        <div class="card">


            <img
                src="<%= restaurant.getImagePath() %>"
                alt="Restaurant"
            >


            <div class="details">


                <div class="top">

                    <h2>
                        <%= restaurant.getRestaurantName() %>
                    </h2>

                    <div class="rating">

                        ⭐
                        <%= restaurant.getRating() %>

                    </div>

                </div>


                <div class="time">

                    🚴 25-30 mins

                </div>


                <div class="cuisine">

                    <%= restaurant.getCuisineType() %>

                </div>


                <div class="address">

                    📍
                    <%= restaurant.getAddress() %>

                </div>


                <div class="status">

                    Open Now

                </div>


                <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>">

                    <button class="menuButton">

                        View Menu

                    </button>

                </a>


            </div>

        </div>


    <%

        }

    %>


    </div>


<%

}

%>


</body>

</html>