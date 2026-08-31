package com.food.servlets;

import java.io.IOException;

import com.food.dao.FavoriteDAO;
import com.food.daoimpl.FavoriteDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {

    private FavoriteDAO favoriteDAO;

    @Override
    public void init() throws ServletException {

        favoriteDAO = new FavoriteDAOImpl();
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user =
                (User) session.getAttribute("loggedInUser");


        // User must login first
        if (user == null) {

            response.sendRedirect("login.jsp");
            return;
        }


        int userId = user.getUserId();

        int restaurantId =
                Integer.parseInt(
                        request.getParameter("restaurantId"));

        String action =
                request.getParameter("action");


        if ("add".equals(action)) {

            // Avoid duplicate favorites
            if (!favoriteDAO.isFavorite(userId, restaurantId)) {

                favoriteDAO.addFavorite(
                        userId,
                        restaurantId);
            }

        }
        else if ("remove".equals(action)) {

            favoriteDAO.removeFavorite(
                    userId,
                    restaurantId);
        }


        response.sendRedirect("favorites");
    }
}