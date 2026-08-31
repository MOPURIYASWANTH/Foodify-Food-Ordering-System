<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Restaurant"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodify - Favorites</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,Helvetica,sans-serif;
}

body{
    background:#fc8019;
}


/* HEADER */

header{

    background:white;

    padding:18px 60px;

    display:flex;

    align-items:center;

    justify-content:space-between;

    position:sticky;

    top:0;

    z-index:1000;

    box-shadow:0 3px 10px rgba(0,0,0,.1);
}


.logo{

    color:#fc8019;

    font-size:32px;

    font-weight:bold;
}


nav a{

    text-decoration:none;

    color:#333;

    margin-left:25px;

    font-weight:bold;
}


nav a:hover{

    color:#fc8019;
}


/* HEADING */

.heading{

    text-align:center;

    padding:50px 20px 30px;

    color:white;
}


.heading h1{

    font-size:40px;

    margin-bottom:10px;
}


.heading p{

    font-size:16px;
}


/* GRID */

.container{

    width:90%;

    max-width:1450px;

    margin:auto;

    display:grid;

    grid-template-columns:
        repeat(4,minmax(0,1fr));

    gap:25px;

    padding-bottom:70px;
}


/* CARD */

.card{

    background:white;

    border-radius:18px;

    overflow:hidden;

    box-shadow:
        0 5px 15px rgba(0,0,0,.18);

    transition:.3s;
}


.card:hover{

    transform:translateY(-8px);

    box-shadow:
        0 12px 25px rgba(0,0,0,.25);
}


.imageBox{

    height:210px;

    position:relative;

    overflow:hidden;
}


.imageBox img{

    width:100%;

    height:100%;

    object-fit:cover;

    transition:.4s;
}


.card:hover img{

    transform:scale(1.06);
}


.rating{

    position:absolute;

    top:12px;

    right:12px;

    background:#28a745;

    color:white;

    padding:6px 10px;

    border-radius:7px;

    font-size:13px;

    font-weight:bold;
}


/* DETAILS */

.details{

    padding:18px;
}


.details h2{

    color:#333;

    font-size:20px;

    margin-bottom:10px;
}


.cuisine{

    color:#666;

    margin-bottom:10px;

    font-size:14px;
}


.address{

    color:#777;

    font-size:13px;

    min-height:40px;

    line-height:1.5;
}


/* BUTTONS */

.actions{

    display:flex;

    gap:10px;

    margin-top:18px;
}


.actions form{

    flex:1;
}


.viewMenu{

    flex:1;

    text-decoration:none;
}


.viewButton,
.removeButton{

    width:100%;

    padding:11px 8px;

    border:none;

    border-radius:8px;

    color:white;

    font-weight:bold;

    cursor:pointer;
}


.viewButton{

    background:#fc8019;
}


.viewButton:hover{

    background:#e46e0d;
}


.removeButton{

    background:#dc3545;
}


.removeButton:hover{

    background:#c82333;
}


/* EMPTY */

.empty{

    grid-column:1/-1;

    background:white;

    border-radius:20px;

    text-align:center;

    padding:70px 20px;

    color:#555;
}


.empty h2{

    margin-bottom:12px;
}


.explore{

    display:inline-block;

    margin-top:20px;

    padding:13px 25px;

    background:#fc8019;

    color:white;

    text-decoration:none;

    border-radius:25px;

    font-weight:bold;
}


/* RESPONSIVE */

@media(max-width:1100px){

    .container{

        grid-template-columns:
            repeat(3,1fr);
    }
}


@media(max-width:800px){

    header{

        padding:15px 25px;
    }


    .container{

        grid-template-columns:
            repeat(2,1fr);
    }
}


@media(max-width:550px){

    header{

        padding:14px 18px;
    }


    .logo{

        font-size:25px;
    }


    nav a{

        margin-left:10px;

        font-size:13px;
    }


    .container{

        grid-template-columns:1fr;
    }

}

</style>

</head>


<body>


<%

User user =
    (User) session.getAttribute("loggedInUser");

%>


<header>


    <div class="logo">

        🍔 Foodify

    </div>


    <nav>

        <a href="restaurant">

            Home

        </a>


        <a href="cart.jsp">

            Cart

        </a>


        <a href="myOrders">

            My Orders

        </a>

    </nav>


</header>


<div class="heading">

    <h1>

        ❤️ My Favorite Restaurants

    </h1>

    <p>

        All your favourite restaurants in one place.

    </p>

</div>


<div class="container">


<%

List<Restaurant> favoriteRestaurants =
    (List<Restaurant>)
    request.getAttribute("favoriteRestaurants");


if(favoriteRestaurants != null &&
   !favoriteRestaurants.isEmpty()){


    for(Restaurant restaurant :
        favoriteRestaurants){

%>


<div class="card">


    <div class="imageBox">


        <img
            src="<%=restaurant.getImagePath()%>"
            alt="<%=restaurant.getRestaurantName()%>">


        <div class="rating">

            ★ <%=restaurant.getRating()%>

        </div>


    </div>


    <div class="details">


        <h2>

            <%=restaurant.getRestaurantName()%>

        </h2>


        <div class="cuisine">

            <%=restaurant.getCuisineType()%>

        </div>


        <div class="address">

            📍 <%=restaurant.getAddress()%>

        </div>


        <div class="actions">


            <a
                class="viewMenu"
                href="menu?restaurantId=<%=restaurant.getRestaurantId()%>">


                <button
                    type="button"
                    class="viewButton">

                    View Menu

                </button>


            </a>


            <form
                action="favorite"
                method="post">


                <input
                    type="hidden"
                    name="restaurantId"
                    value="<%=restaurant.getRestaurantId()%>">


                <input
                    type="hidden"
                    name="action"
                    value="remove">


                <button
                    type="submit"
                    class="removeButton">

                    Remove ❤️

                </button>


            </form>


        </div>


    </div>


</div>


<%

    }

}
else{

%>


<div class="empty">


    <h2>

        No Favorites Yet ❤️

    </h2>


    <p>

        Add your favourite restaurants
        and they will appear here.

    </p>


    <a
        href="restaurant"
        class="explore">

        Explore Restaurants

    </a>


</div>


<%

}

%>


</div>


</body>

</html>