package com.food.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {

        items = new HashMap<>();

    }

    public Map<Integer, CartItem> getItems() {

        return items;

    }

    // Add Item
    public void addItem(CartItem item) {

        int menuId = item.getMenuId();

        if (items.containsKey(menuId)) {

            CartItem existingItem = items.get(menuId);

            existingItem.setQuantity(
                    existingItem.getQuantity() + item.getQuantity());

        } else {

            items.put(menuId, item);

        }
    }

    // Update Quantity
    public void updateItem(int menuId, int quantity) {

        if (items.containsKey(menuId)) {

            items.get(menuId).setQuantity(quantity);

        }

    }

    // Remove Item
    public void removeItem(int menuId) {

        items.remove(menuId);

    }
}