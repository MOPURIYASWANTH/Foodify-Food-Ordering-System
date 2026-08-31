package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.FavoriteDAO;
import com.food.model.Restaurant;
import com.food.utility.DBConnection;

public class FavoriteDAOImpl implements FavoriteDAO {

    private static final String ADD_FAVORITE =
            "INSERT INTO favorites (userId, restaurantId) VALUES (?, ?)";

    private static final String REMOVE_FAVORITE =
            "DELETE FROM favorites WHERE userId = ? AND restaurantId = ?";

    private static final String CHECK_FAVORITE =
            "SELECT favoriteId FROM favorites WHERE userId = ? AND restaurantId = ?";

    private static final String GET_FAVORITE_RESTAURANTS =
            "SELECT r.* FROM restaurant r " +
            "INNER JOIN favorites f " +
            "ON r.restaurantId = f.restaurantId " +
            "WHERE f.userId = ?";


    @Override
    public boolean addFavorite(int userId, int restaurantId) {

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement pstmt = con.prepareStatement(ADD_FAVORITE);
        ) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            int result = pstmt.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean removeFavorite(int userId, int restaurantId) {

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement pstmt = con.prepareStatement(REMOVE_FAVORITE);
        ) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            int result = pstmt.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean isFavorite(int userId, int restaurantId) {

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement pstmt = con.prepareStatement(CHECK_FAVORITE);
        ) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            try (ResultSet res = pstmt.executeQuery()) {

                return res.next();
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    @Override
    public List<Restaurant> getFavoriteRestaurants(int userId) {

        List<Restaurant> restaurants = new ArrayList<>();

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement pstmt =
                    con.prepareStatement(GET_FAVORITE_RESTAURANTS);
        ) {

            pstmt.setInt(1, userId);

            try (ResultSet res = pstmt.executeQuery()) {

                while (res.next()) {

                    Restaurant restaurant = new Restaurant();

                    restaurant.setRestaurantId(
                            res.getInt("restaurantId"));

                    restaurant.setRestaurantName(
                            res.getString("restaurantName"));

                    restaurant.setCuisineType(
                            res.getString("cuisineType"));

                    restaurant.setAddress(
                            res.getString("address"));

                    restaurant.setPhone(
                            res.getString("phone"));

                    restaurant.setRating(
                            res.getDouble("rating"));

                    restaurant.setImagePath(
                            res.getString("imagePath"));

                    restaurants.add(restaurant);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return restaurants;
    }
}