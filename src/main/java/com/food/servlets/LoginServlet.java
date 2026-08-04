package com.food.servlets;

import java.io.IOException;

import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAOImpl dao = new UserDAOImpl();

        User user = dao.getUser(email, password);

        if (user != null) {

            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", user);

            if(session.getAttribute("cart") != null){

                resp.sendRedirect("checkout");

            }else{

                resp.sendRedirect("restaurant");

            }

        } else {

            req.setAttribute("error", "Invalid Email or Password");

            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}