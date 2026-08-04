package com.food.model;

import java.time.LocalDateTime;

public class Order {

    private int orderId;
    private int userId;
    private int restaurantId;
    private double totalAmount;
    private LocalDateTime orderDate;
    private String status;

    public Order() {
    }

    public Order(int orderId, int userId,
            int restaurantId, double totalAmount,
            LocalDateTime orderDate, String status) {

        this.orderId = orderId;
        this.userId = userId;
        this.restaurantId = restaurantId;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
        this.status = status;
    }

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public LocalDateTime getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

   
}