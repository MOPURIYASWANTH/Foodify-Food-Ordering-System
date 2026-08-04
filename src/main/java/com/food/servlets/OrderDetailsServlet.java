package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.OrderDAOImpl;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        int orderId =
                Integer.parseInt(request.getParameter("orderId"));

        OrderDAOImpl dao = new OrderDAOImpl();

        List<OrderItem> orderItems =
                dao.getOrderItems(orderId);

        request.setAttribute("orderItems", orderItems);

        request.setAttribute("orderId", orderId);

        request.getRequestDispatcher("orderDetails.jsp")
               .forward(request, response);
    }
}