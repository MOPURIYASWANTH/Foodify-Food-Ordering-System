package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    Connection con = DBConnection.getConnection();

    // -------------------- INSERT --------------------

    @Override
    public void addRestaurant(Restaurant restaurant) {

        try {

            String sql = "INSERT INTO restaurant(restaurantName,cuisineType,address,phone,rating,isActive,imagePath) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, restaurant.getRestaurantName());
            ps.setString(2, restaurant.getCuisineType());
            ps.setString(3, restaurant.getAddress());
            ps.setString(4, restaurant.getPhone());
            ps.setDouble(5, restaurant.getRating());
            ps.setBoolean(6, restaurant.isActive());
            ps.setString(7, restaurant.getImagePath());

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Restaurant Added Successfully");
            else
                System.out.println("Restaurant Not Added");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // -------------------- SELECT ONE --------------------

    @Override
    public Restaurant getRestaurant(int restaurantId) {

        Restaurant restaurant = null;

        try {

            String sql = "SELECT * FROM restaurant WHERE restaurantId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurantId"));
                restaurant.setRestaurantName(rs.getString("restaurantName"));
                restaurant.setCuisineType(rs.getString("cuisineType"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setPhone(rs.getString("phone"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setActive(rs.getBoolean("isActive"));
                restaurant.setImagePath(rs.getString("imagePath"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    // -------------------- SELECT ALL --------------------

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM restaurant";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurantId"));
                restaurant.setRestaurantName(rs.getString("restaurantName"));
                restaurant.setCuisineType(rs.getString("cuisineType"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setPhone(rs.getString("phone"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setActive(rs.getBoolean("isActive"));
                restaurant.setImagePath(rs.getString("imagePath"));

                list.add(restaurant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------- UPDATE --------------------

    @Override
    public void updateRestaurant(Restaurant restaurant) {

        try {

            String sql = "UPDATE restaurant SET restaurantName=?, cuisineType=?, address=?, phone=?, rating=?, isActive=?,imagePath=? WHERE restaurantId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, restaurant.getRestaurantName());
            ps.setString(2, restaurant.getCuisineType());
            ps.setString(3, restaurant.getAddress());
            ps.setString(4, restaurant.getPhone());
            ps.setDouble(5, restaurant.getRating());
            ps.setBoolean(6, restaurant.isActive());
            ps.setString(7, restaurant.getImagePath());
            ps.setInt(8, restaurant.getRestaurantId());

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Restaurant Updated Successfully");
            else
                System.out.println("Restaurant Not Updated");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // -------------------- DELETE --------------------

    @Override
    public void deleteRestaurant(int restaurantId) {

        try {

            String sql = "DELETE FROM restaurant WHERE restaurantId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Restaurant Deleted Successfully");
            else
                System.out.println("Restaurant Not Found");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}