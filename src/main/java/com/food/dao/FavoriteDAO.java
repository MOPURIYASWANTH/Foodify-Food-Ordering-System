package com.food.dao;

import java.util.List;
import com.food.model.Restaurant;

public interface FavoriteDAO {

    boolean addFavorite(int userId, int restaurantId);

    boolean removeFavorite(int userId, int restaurantId);

    boolean isFavorite(int userId, int restaurantId);

    List<Restaurant> getFavoriteRestaurants(int userId);
}