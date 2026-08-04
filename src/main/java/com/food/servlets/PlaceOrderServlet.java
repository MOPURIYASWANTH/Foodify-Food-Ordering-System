package com.food.servlets;

import java.io.IOException;
import java.time.LocalDateTime;

import com.food.daoimpl.OrderDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Logged in user
        User user = (User) session.getAttribute("loggedInUser");

        // Cart
        Cart cart = (Cart) session.getAttribute("cart");

        // Check user and cart
        if (user == null || cart == null || cart.getItems().isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;

        }

        // Calculate Total Amount
        double totalAmount = 0;

        for (CartItem item : cart.getItems().values()) {

            totalAmount += item.getPrice() * item.getQuantity();

        }

        // First cart item (Restaurant Id)
        CartItem firstItem = cart.getItems().values().iterator().next();

        // Create Order Object
        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setRestaurantId(firstItem.getRestaurantId());
        order.setTotalAmount(totalAmount);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus("Placed");

        // DAO
        OrderDAOImpl dao = new OrderDAOImpl();

        // Save Order
        int orderId = dao.placeOrder(order);

        // Save Order Items
        for (CartItem cartItem : cart.getItems().values()) {

            OrderItem item = new OrderItem();

            item.setOrderId(orderId);
            item.setMenuId(cartItem.getMenuId());
            item.setItemName(cartItem.getName());
            item.setPrice(cartItem.getPrice());
            item.setQuantity(cartItem.getQuantity());
            item.setImagePath(cartItem.getImagePath());

            dao.addOrderItem(item);

        }

     // Clear Cart
        session.removeAttribute("cart");

        // Send Order ID to success page
        request.setAttribute("orderId", orderId);

        // Forward to success page
        request.getRequestDispatcher("orderSuccess.jsp")
               .forward(request, response);
    }

}