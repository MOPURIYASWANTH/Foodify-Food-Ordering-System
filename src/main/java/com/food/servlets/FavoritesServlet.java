package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.food.dao.FavoriteDAO;
import com.food.daoimpl.FavoriteDAOImpl;
import com.food.model.Restaurant;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/favorites")
public class FavoritesServlet extends HttpServlet {

    private FavoriteDAO favoriteDAO;

    @Override
    public void init() throws ServletException {

        favoriteDAO = new FavoriteDAOImpl();
    }


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user =
                (User) session.getAttribute("loggedInUser");


        if (user == null) {

            response.sendRedirect("login.jsp");
            return;
        }


        int userId = user.getUserId();
       


        List<Restaurant> favoriteRestaurants =
                favoriteDAO.getFavoriteRestaurants(userId);
       


        request.setAttribute(
                "favoriteRestaurants",
                favoriteRestaurants);


        request
            .getRequestDispatcher("favorites.jsp")
            .forward(request, response);
    }
}