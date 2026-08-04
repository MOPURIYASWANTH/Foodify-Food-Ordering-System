package com.food.dao;

import java.util.List;
import com.food.model.Order;
import com.food.model.OrderItem;

public interface OrderDAO {

	 int placeOrder(Order order);

	    void addOrderItem(OrderItem item);

	    List<Order> getOrdersByUser(int userId);

	    List<OrderItem> getOrderItems(int orderId);

}