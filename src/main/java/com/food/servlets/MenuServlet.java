package com.food.servlets;
import java.util.List;
import java.io.IOException;
import com.food.model.*;
import com.food.daoimpl.MenuDAOImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class MenuServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

    	int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
    	

    	MenuDAOImpl dao = new MenuDAOImpl();

    	List<Menu> menus = dao.getMenusByRestaurantId(restaurantId);
    	
    	req.setAttribute("menus", menus);

    	RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
    	rd.forward(req, resp);
    }
}
