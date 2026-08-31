<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Menu"%>
<%@ page import="com.food.model.User"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodify - Menu</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,Helvetica,sans-serif;
}

html{
    scroll-behavior:smooth;
}

body{
    background:#fff7f0;
    color:#333;
}


/* ================= HEADER ================= */

header{

    background:#ffffff;

    display:flex;

    align-items:center;

    padding:18px 60px;

    box-shadow:0 3px 12px rgba(0,0,0,.10);

    position:sticky;

    top:0;

    z-index:1000;
}


.logo{

    font-size:32px;

    color:#fc8019;

    font-weight:bold;

    white-space:nowrap;

    margin-right:45px;
}


/* ================= HEADER SEARCH ================= */

.headerSearch{

    flex:1;

    max-width:600px;
}


.headerSearch input{

    width:100%;

    padding:13px 22px;

    border-radius:30px;

    border:1px solid #ddd;

    outline:none;

    font-size:15px;

    background:#fafafa;

    transition:.3s;
}


.headerSearch input:focus{

    border-color:#fc8019;

    box-shadow:
        0 3px 12px rgba(252,128,25,.20);

    background:white;
}


/* ================= NAVIGATION ================= */

nav{

    margin-left:auto;

    display:flex;

    align-items:center;
}


nav a{

    text-decoration:none;

    color:#333;

    margin-left:25px;

    font-weight:bold;

    transition:.2s;
}


nav a:hover{

    color:#fc8019;
}


/* ================= MENU HERO ================= */

.menuHero{

    width:92%;

    max-width:1450px;

    margin:35px auto 20px;

    min-height:260px;

    border-radius:25px;

    background:
        linear-gradient(
            120deg,
            #fc8019,
            #ff9f4d
        );

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:45px 6%;

    position:relative;

    overflow:hidden;

    box-shadow:
        0 10px 30px rgba(252,128,25,.25);
}


.menuHero::before{

    content:"";

    position:absolute;

    width:350px;

    height:350px;

    border-radius:50%;

    background:rgba(255,255,255,.10);

    right:-100px;

    top:-160px;
}


.menuHero::after{

    content:"";

    position:absolute;

    width:230px;

    height:230px;

    border-radius:50%;

    background:rgba(255,255,255,.08);

    right:170px;

    bottom:-160px;
}


.heroText{

    position:relative;

    z-index:2;

    color:white;
}


.heroText .smallText{

    display:inline-block;

    padding:7px 15px;

    background:rgba(255,255,255,.18);

    border-radius:20px;

    font-size:13px;

    font-weight:bold;

    margin-bottom:15px;
}


.heroText h1{

    font-size:46px;

    margin-bottom:12px;
}


.heroText p{

    font-size:17px;

    line-height:1.6;

    max-width:600px;

    color:white;
}


.heroFoodIcons{

    position:relative;

    z-index:2;

    font-size:70px;

    display:flex;

    gap:15px;
}


.heroFoodIcons span{

    display:inline-block;

    animation:foodFloat 3s ease-in-out infinite;
}


.heroFoodIcons span:nth-child(2){

    animation-delay:.5s;
}


.heroFoodIcons span:nth-child(3){

    animation-delay:1s;
}


@keyframes foodFloat{

    0%,100%{
        transform:translateY(0);
    }

    50%{
        transform:translateY(-12px);
    }
}


/* ================= CATEGORY BAR ================= */

.categories{

    width:90%;

    max-width:1400px;

    margin:30px auto;

    display:flex;

    justify-content:center;

    flex-wrap:wrap;

    gap:12px;
}


.category{

    border:none;

    width:auto;

    margin:0;

    padding:10px 20px;

    border-radius:25px;

    background:white;

    color:#555;

    box-shadow:
        0 3px 10px rgba(0,0,0,.08);

    font-size:14px;

    cursor:pointer;

    transition:.3s;
}


.category:hover,
.category.active{

    background:#fc8019;

    color:white;

    transform:translateY(-2px);
}


/* ================= HEADING ================= */

.heading{

    width:90%;

    max-width:1400px;

    margin:40px auto 25px;
}


.heading h1{

    color:#222;

    font-size:34px;

    margin-bottom:8px;
}


.heading p{

    color:#777;

    font-size:15px;
}


/* ================= MENU GRID ================= */

.container{

    width:90%;

    max-width:1450px;

    margin:0 auto;

    display:grid;

    grid-template-columns:
        repeat(4,minmax(0,1fr));

    gap:25px;

    padding-bottom:70px;
}


/* ================= FOOD CARD ================= */

.card{

    background:#fff;

    border-radius:18px;

    overflow:hidden;

    box-shadow:
        0 5px 18px rgba(0,0,0,.10);

    transition:.3s;

    position:relative;
}


.card:hover{

    transform:translateY(-8px);

    box-shadow:
        0 14px 30px rgba(0,0,0,.17);
}


/* ================= IMAGE ================= */

.imageBox{

    width:100%;

    height:210px;

    overflow:hidden;

    position:relative;
}


.imageBox img{

    width:100%;

    height:100%;

    object-fit:cover;

    transition:.4s;
}


.card:hover .imageBox img{

    transform:scale(1.07);
}


.foodBadge{

    position:absolute;

    top:12px;

    left:12px;

    background:rgba(255,255,255,.94);

    color:#fc8019;

    padding:6px 11px;

    border-radius:18px;

    font-size:12px;

    font-weight:bold;
}


/* ================= DETAILS ================= */

.details{

    padding:18px;
}


.details h2{

    color:#222;

    margin-bottom:9px;

    font-size:20px;

    white-space:nowrap;

    overflow:hidden;

    text-overflow:ellipsis;
}


.desc{

    color:#777;

    font-size:14px;

    line-height:1.5;

    height:43px;

    overflow:hidden;

    margin-bottom:15px;
}


.foodInfo{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:12px;
}


.price{

    color:#222;

    font-size:21px;

    font-weight:bold;
}


.rating{

    background:#28a745;

    color:white;

    padding:5px 9px;

    border-radius:7px;

    font-size:12px;

    font-weight:bold;
}


.status{

    display:inline-block;

    color:#28a745;

    background:#ecf9ef;

    padding:6px 11px;

    border-radius:18px;

    font-size:12px;

    font-weight:bold;

    margin-bottom:14px;
}


.notAvailable{

    color:#dc3545;

    background:#fff0f0;
}


/* ================= ADD CART ================= */

.addCartForm{

    width:100%;
}


.addCartButton{

    width:100%;

    padding:12px;

    border:none;

    background:#fc8019;

    color:white;

    font-size:15px;

    font-weight:bold;

    border-radius:8px;

    cursor:pointer;

    transition:.3s;
}


.addCartButton:hover{

    background:#e46e0d;

    transform:translateY(-2px);
}


.addCartButton:disabled{

    background:#aaa;

    cursor:not-allowed;

    transform:none;
}


/* ================= PROFILE PANEL ================= */

.profilePanel{

    position:fixed;

    top:0;

    right:-350px;

    width:320px;

    height:100%;

    background:white;

    box-shadow:
        -3px 0 15px rgba(0,0,0,.3);

    padding:25px;

    transition:.4s;

    z-index:3000;
}


.profilePanel h2{

    color:#fc8019;

    margin-top:40px;

    margin-bottom:10px;
}


.profilePanel p{

    color:#666;

    margin-bottom:20px;
}


.profilePanel a{

    display:block;

    text-decoration:none;

    color:#333;

    font-size:17px;

    padding:9px 0;
}


.profilePanel a:hover{

    color:#fc8019;
}


.closeBtn{

    position:absolute;

    top:20px;

    right:20px;

    border:none;

    background:none;

    font-size:22px;

    cursor:pointer;

    width:auto;

    padding:0;

    margin:0;

    color:#333;
}


/* ================= NO MENU ================= */

.noMenu{

    grid-column:1/-1;

    text-align:center;

    background:white;

    padding:60px;

    border-radius:20px;

    color:#666;
}


/* ================= RESPONSIVE ================= */

@media(max-width:1100px){

    .container{

        grid-template-columns:
            repeat(3,1fr);
    }

}


@media(max-width:850px){

    header{

        flex-wrap:wrap;

        gap:15px;

        padding:15px 25px;
    }


    .headerSearch{

        order:3;

        max-width:none;

        flex-basis:100%;
    }


    .menuHero{

        flex-direction:column;

        text-align:center;

        gap:30px;
    }


    .heroText h1{

        font-size:38px;
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

        font-size:26px;
    }


    nav a{

        margin-left:12px;

        font-size:13px;
    }


    nav a:nth-child(2){

        display:none;
    }


    .menuHero{

        width:94%;

        padding:40px 20px;
    }


    .heroText h1{

        font-size:32px;
    }


    .heroFoodIcons{

        font-size:48px;
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
    (User)session.getAttribute("loggedInUser");

%>


<!-- ================= HEADER ================= -->

<header>


    <div class="logo">

        🍔 Foodify

    </div>


    <div class="headerSearch">

        <input
            type="text"
            id="menuSearch"
            placeholder="Search food items..."
            onkeyup="searchMenu()">

    </div>


    <nav>

        <a href="restaurant">

            Home

        </a>

        <a href="#">

            Offers

        </a>

        <a href="cart.jsp">

            Cart

        </a>

        <a href="#"
           onclick="openProfile(); return false;">

            Profile

        </a>

    </nav>


</header>


<!-- ================= PROFILE ================= -->

<div
    id="profilePanel"
    class="profilePanel">


    <button
        class="closeBtn"
        onclick="closeProfile()">

        ✖

    </button>


<% if(user != null){ %>


    <h2>

        👤 <%=user.getName()%>

    </h2>


    <p>

        <%=user.getEmail()%>

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


<% } %>


</div>


<!-- ================= MENU HERO ================= -->

<section class="menuHero">


    <div class="heroText">


        <div class="smallText">

            🍽️ FRESH • DELICIOUS • FAST

        </div>


        <h1>

            What's on your mind?

        </h1>


        <p>

            Discover delicious dishes from this restaurant
            and add your favourites directly to your cart.

        </p>


    </div>


    <div class="heroFoodIcons">

        <span>🍕</span>

        <span>🍔</span>

        <span>🍗</span>

    </div>


</section>


<!-- ================= CATEGORIES ================= -->

<div class="categories">

    <button
        class="category active"
        onclick="filterMenu('all',this)">

        All

    </button>

    <button
        class="category"
        onclick="filterMenu('biryani',this)">

        🍚 Biryani

    </button>

    <button
        class="category"
        onclick="filterMenu('pizza',this)">

        🍕 Pizza

    </button>

    <button
        class="category"
        onclick="filterMenu('burger',this)">

        🍔 Burger

    </button>

    <button
        class="category"
        onclick="filterMenu('chicken',this)">

        🍗 Chicken

    </button>

</div>


<!-- ================= HEADING ================= -->

<div class="heading">

    <h1>

        Recommended for you

    </h1>

    <p>

        Choose your favourite food and add it to your cart.

    </p>

</div>


<!-- ================= MENU ITEMS ================= -->

<div class="container">


<%

List<Menu> menus =
    (List<Menu>)request.getAttribute("menus");


if(menus != null && !menus.isEmpty()){


    for(Menu m : menus){

%>


<div
    class="card menuItem"
    data-name="<%=m.getItemName().toLowerCase()%>">


    <div class="imageBox">


        <img
            src="<%=m.getImagePath()%>"
            alt="<%=m.getItemName()%>">


        <div class="foodBadge">

            Foodify Choice

        </div>


    </div>


    <div class="details">


        <h2>

            <%=m.getItemName()%>

        </h2>


        <p class="desc">

            <%=m.getDescription()%>

        </p>


        <div class="foodInfo">


            <span class="price">

                ₹<%=m.getPrice()%>

            </span>


            <span class="rating">

                ★ 4.5

            </span>


        </div>


<% if(m.isAvailable()){ %>


        <div class="status">

            ● Available

        </div>


<% } else { %>


        <div class="status notAvailable">

            ● Not Available

        </div>


<% } %>


        <form
            class="addCartForm"
            action="cartServlet"
            method="post">


            <input
                type="hidden"
                name="menuId"
                value="<%=m.getMenuId()%>">


            <input
                type="hidden"
                name="restaurantId"
                value="<%=m.getRestaurantId()%>">


            <input
                type="hidden"
                name="quantity"
                value="1">


            <input
                type="hidden"
                name="action"
                value="add">


            <button
                type="submit"
                class="addCartButton"
                <%= !m.isAvailable() ? "disabled" : "" %>>


                <%= m.isAvailable()
                    ? "Add To Cart"
                    : "Currently Unavailable" %>


            </button>


        </form>


    </div>


</div>


<%

    }

} else {

%>


<div class="noMenu">

    <h2>No menu items available.</h2>

</div>


<%

}

%>


</div>


<script>


/* ================= PROFILE ================= */

function openProfile(){

    document
        .getElementById("profilePanel")
        .style.right = "0";

}


function closeProfile(){

    document
        .getElementById("profilePanel")
        .style.right = "-350px";

}


/* ================= SEARCH ================= */

function searchMenu(){

    const searchValue =
        document
        .getElementById("menuSearch")
        .value
        .toLowerCase();


    const items =
        document
        .querySelectorAll(".menuItem");


    items.forEach(function(item){

        const foodName =
            item.dataset.name;


        if(foodName.includes(searchValue)){

            item.style.display = "";

        }
        else{

            item.style.display = "none";

        }

    });

}


/* ================= CATEGORY FILTER ================= */

function filterMenu(category,button){


    const items =
        document
        .querySelectorAll(".menuItem");


    document
        .querySelectorAll(".category")
        .forEach(function(btn){

            btn.classList.remove("active");

        });


    button.classList.add("active");


    items.forEach(function(item){


        const name =
            item.dataset.name;


        if(
            category === "all" ||
            name.includes(category)
        ){

            item.style.display = "";

        }
        else{

            item.style.display = "none";

        }

    });

}


</script>


</body>

</html>