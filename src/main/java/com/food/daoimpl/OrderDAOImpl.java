package com.food.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    Connection con;

    public OrderDAOImpl() {

        con = DBConnection.getConnection();

    }

    @Override
    public int placeOrder(Order order) {

        int orderId = 0;

        try {

            String sql = "INSERT INTO orders(userId,restaurantId,totalAmount,orderDate,status) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setDouble(3, order.getTotalAmount());
            ps.setTimestamp(4, Timestamp.valueOf(order.getOrderDate()));
            ps.setString(5, order.getStatus());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {

                orderId = rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return orderId;
    }

    @Override
    public void addOrderItem(OrderItem item) {

        try {

            String sql = "INSERT INTO orderitem(orderId,menuId,itemName,price,quantity,imagePath) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getMenuId());
            ps.setString(3, item.getItemName());
            ps.setDouble(4, item.getPrice());
            ps.setInt(5, item.getQuantity());
            ps.setString(6, item.getImagePath());

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            String sql = "SELECT * FROM orders WHERE userId=? ORDER BY orderDate DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setOrderDate(rs.getTimestamp("orderDate").toLocalDateTime());
                order.setStatus(rs.getString("status"));

                orders.add(order);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return orders;
    }

    @Override
    public List<OrderItem> getOrderItems(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        try {

            String sql = "SELECT * FROM orderitem WHERE orderId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                OrderItem item = new OrderItem();

                item.setOrderItemId(rs.getInt("orderItemId"));
                item.setOrderId(rs.getInt("orderId"));
                item.setMenuId(rs.getInt("menuId"));
                item.setItemName(rs.getString("itemName"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                item.setImagePath(rs.getString("imagePath"));

                items.add(item);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return items;
    }
}
