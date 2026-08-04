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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        User user = new User();

        user.setUserId(userId);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);

        UserDAOImpl dao = new UserDAOImpl();

        dao.updateUser(user);

        HttpSession session = request.getSession();

        session.setAttribute("loggedInUser", user);

        response.sendRedirect("restaurant");
    }
}