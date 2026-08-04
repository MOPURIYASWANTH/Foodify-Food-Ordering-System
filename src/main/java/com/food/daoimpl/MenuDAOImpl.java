package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.MenuDAO;
import com.food.model.Menu;
import com.food.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    Connection con = DBConnection.getConnection();

    // -------------------- INSERT --------------------

    @Override
    public void addMenu(Menu menu) {

        try {

            String sql = "INSERT INTO menu(restaurantId,itemName,description,price,available) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setBoolean(5, menu.isAvailable());

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Menu Added Successfully");
            else
                System.out.println("Menu Not Added");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // -------------------- SELECT ONE --------------------

    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        try {

            String sql = "SELECT * FROM menu WHERE menuId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setItemName(rs.getString("itemName"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setAvailable(rs.getBoolean("isAvailable"));
                String img = rs.getString("imagePath");
                System.out.println("Image from DB = " + img);
                menu.setImagePath(img);
                System.out.println("Menu Object Image = " + menu.getImagePath());

                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menu;
    }

    // -------------------- SELECT ALL --------------------

    @Override
    public List<Menu> getAllMenus() {

        List<Menu> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM menu";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setItemName(rs.getString("itemName"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setAvailable(rs.getBoolean("isAvailable"));

                list.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------- UPDATE --------------------

    @Override
    public void updateMenu(Menu menu) {

        try {

            String sql = "UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=? WHERE menuId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setBoolean(5, menu.isAvailable());
            ps.setInt(6, menu.getMenuId());

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Menu Updated Successfully");
            else
                System.out.println("Menu Not Updated");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // -------------------- DELETE --------------------

    @Override
    public void deleteMenu(int menuId) {

        try {

            String sql = "DELETE FROM menu WHERE menuId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, menuId);

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Menu Deleted Successfully");
            else
                System.out.println("Menu Not Found");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // -------------------- Menu of restaurent --------------------
    
    @Override
    
    public List<Menu> getMenusByRestaurantId(int restaurantId) {

        List<Menu> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM menu WHERE restaurantId=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
           

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setItemName(rs.getString("itemName"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setAvailable(rs.getBoolean("isAvailable"));
                menu.setImagePath(rs.getString("imagePath"));
                list.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        

        return list;
    }
    
}