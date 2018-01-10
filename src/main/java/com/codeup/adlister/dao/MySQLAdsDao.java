package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }


//    create a Method to request only what we need

    @Override
    public List<Ad> userAds(Long userId) {
        PreparedStatement userstmt = null;
        try {
            userstmt = connection.prepareStatement("SELECT * FROM ads a inner join users u ON a.user_id = u.id WHERE u.id= ?");
            userstmt.setLong(1, userId);
            ResultSet rs = userstmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }
//    @Override
//    public List<Ad> userEdit(Long userId)

//    @Override
//    public Ad findbyId(Long id){
//        PreparedStatement statement =null;
//        try{
//            statement = connection.prepareStatement("SELECT * FROM adlister_db.ads WHERE id=?");
//        }
//
//        catch (){
//
//
//        }

//    }


    @Override
    public Ad findById(Long id) {
        String query = "SELECT * FROM ads WHERE id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);

            ResultSet rs = stmt.executeQuery();
            rs.next();

            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);//new RuntimeException("error finding user by id");
        }
    }
    @Override
    public void deleteAd(Long id){
        PreparedStatement delStmt=null;
        try{
            delStmt = connection.prepareStatement("DELETE FROM ads WHERE id=?");
            delStmt.setLong(1, id);
            delStmt.executeUpdate();

            return;

//            ResultSet rs = delStmt.executeUpdate();
//            return createAdsFromResults(rs);


        }
        catch (SQLException e){
            throw new RuntimeException("Error deleting ads", e);
        }

    }



    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }
   public  List<Ad> search(String searchTerm) {

        PreparedStatement userstmt = null;
        try {
            userstmt = connection.prepareStatement("SELECT * FROM ads a WHERE title LIKE ? ");
            userstmt.setString(1, "%" + searchTerm + "%");
            ResultSet rs = userstmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }

    }



    @Override
    public void update(Ad ad) {
        try {
            String insertQuery = "UPDATE ads SET user_id = ?, title = ?, description = ? WHERE id=?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setLong(4,ad.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
