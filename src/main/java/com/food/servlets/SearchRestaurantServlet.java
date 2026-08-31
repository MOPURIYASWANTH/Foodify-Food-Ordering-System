package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchRestaurants")
public class SearchRestaurantServlet extends HttpServlet {

    private RestaurantDAO restaurantDAO;

    @Override
    public void init() {

        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String foodName =
                request.getParameter("food");

        List<Restaurant> restaurants =
                restaurantDAO.searchRestaurantsByFood(foodName);

        request.setAttribute(
                "restaurants",
                restaurants
        );

        request.setAttribute(
                "searchFood",
                foodName
        );

        request.getRequestDispatcher(
                "searchResults.jsp"
        ).forward(request, response);
    }	
}
