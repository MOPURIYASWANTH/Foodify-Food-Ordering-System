package com.food.servlets;
import java.util.*;
import java.io.IOException;
import java.util.List;

import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class Restaurentservlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		RestaurantDAOImpl RestaurantDAOImpl=new RestaurantDAOImpl();
		List<Restaurant> allRestaurant=RestaurantDAOImpl.getAllRestaurants();
		req.setAttribute("allRestaurant", allRestaurant);
		RequestDispatcher rd=req.getRequestDispatcher("restaurant.jsp");
		rd.forward(req, resp);
		
	}

}
