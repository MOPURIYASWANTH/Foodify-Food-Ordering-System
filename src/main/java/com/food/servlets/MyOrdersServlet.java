package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.OrderDAOImpl;
import com.food.model.Order;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myOrders")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        // If user is not logged in
        if (user == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        OrderDAOImpl dao = new OrderDAOImpl();

        List<Order> orders = dao.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("myOrders.jsp")
               .forward(request, response);

    }
}