package com.food.daoimpl;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.utility.DBConnection;
public class UserDAOImpl implements UserDAO {

    Connection con = DBConnection.getConnection();

    // -------------------- INSERT --------------------

    @Override
    public void addUser(User user) {

        try {

            String sql = "INSERT INTO user(name,email,password,phone,address) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("User Added Successfully");
            else
                System.out.println("User Not Added");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // -------------------- SELECT ONE --------------------

    @Override
    public User getUser(int userId) {

        User user = null;

        try {

            String sql = "SELECT * FROM user WHERE userId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    // -------------------- SELECT ALL --------------------

    @Override
    public List<User>getAllUsers() {

        List<User> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM user";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

                list.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------- UPDATE --------------------

    @Override
    public void updateUser(User user) {

        try {

            String sql = "UPDATE user SET name=?,email=?,password=?,phone=?,address=? WHERE userId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getUserId());

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("User Updated Successfully");
            else
                System.out.println("User Not Updated");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // -------------------- DELETE --------------------

    @Override
    public void deleteUser(int userId) {

        try {

            String sql = "DELETE FROM user WHERE userId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("User Deleted Successfully");
            else
                System.out.println("User Not Found");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // -------------------- getuser --------------------
    @Override
    public User getUser(String email, String password) {

        User user = null;

        try {

            String sql = "SELECT * FROM user WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    public void updateUser1(User user) {

        try {

            String sql = "UPDATE user SET name=?, email=?, phone=?, address=? WHERE userId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setInt(5, user.getUserId());

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
    
}
