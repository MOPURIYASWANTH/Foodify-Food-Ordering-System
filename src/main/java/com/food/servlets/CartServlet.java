package com.food.servlets;

import java.io.IOException;
import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action.equals("add")) {

            addItemToCart(request, response);

        }

        else if (action.equals("update")) {

            updateItemToCart(request, response);

        }

        else if (action.equals("delete")) {

            removeItemFromCart(request, response);

        }

    }

    private void addItemToCart(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId =
                Integer.parseInt(request.getParameter("menuId"));

        int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

        int quantity =
                Integer.parseInt(request.getParameter("quantity"));

        MenuDAOImpl dao = new MenuDAOImpl();

        Menu menu = dao.getMenu(menuId);
 

        CartItem item = new CartItem();

        item.setMenuId(menu.getMenuId());
        item.setRestaurantId(menu.getRestaurantId());
        item.setName(menu.getItemName());
        item.setPrice(menu.getPrice());
        item.setQuantity(quantity);
        item.setImagePath(menu.getImagePath());

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {

            cart = new Cart();
            session.setAttribute("cart", cart);

            cart.addItem(item);

        } else {

            // Check if cart already has items
            if (!cart.getItems().isEmpty()) {

                // Get first item from cart
                CartItem firstItem = cart.getItems().values().iterator().next();

                if (firstItem.getRestaurantId() == item.getRestaurantId()) {

                    // Same restaurant
                    cart.addItem(item);

                } else {

                    // Different restaurant
                    cart.getItems().clear();   // Remove old cart
                    cart.addItem(item);        // Add new restaurant item

                }

            } else {

                cart.addItem(item);
            }
        }

        response.sendRedirect("cart.jsp");
        // Add logic later

    }

    private void updateItemToCart(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        String operation = request.getParameter("operation");

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {

            CartItem item = cart.getItems().get(menuId);

            if (item != null) {

                if (operation.equals("plus")) {

                    item.setQuantity(item.getQuantity() + 1);

                } else if (operation.equals("minus")) {

                    if (item.getQuantity() > 1) {

                        item.setQuantity(item.getQuantity() - 1);

                    } else {

                        cart.getItems().remove(menuId);

                    }
                }
            }
        }

        response.sendRedirect("cart.jsp");
    }

    private void removeItemFromCart(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {

            cart.getItems().remove(menuId);

            // Optional: Remove the cart from session if it becomes empty
            if (cart.getItems().isEmpty()) {
                session.removeAttribute("cart");
            }
        }

        response.sendRedirect("cart.jsp");
    }

}
