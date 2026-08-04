package com.food.dao;

import java.util.List;
import com.food.model.Cart;

public interface CartDAO {

    void addCart(Cart cart);

    Cart getCart(int cartId);

    List<Cart> getAllCarts();

    void updateCart(Cart cart);

    void deleteCart(int cartId);

}