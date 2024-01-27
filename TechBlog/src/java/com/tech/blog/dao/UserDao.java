/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
   // method to insert user to database
    public void saveUser(User user ){
      try{
            String query = "Insert into User(username,email,password)values(?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.executeUpdate();
      }catch(Exception e){
      e.printStackTrace();
      }
        
    }
    // update user profile
    
    public boolean Updateuser(User user){
        boolean f = false;
        try{
            String query = "update User set username =?,password=? where email=?";
            PreparedStatement pstmt =  this.con.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.executeUpdate();
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
    
    
//   get user by email and passowrd
    
    
    public User getUserByEmailAndPassword(String email,String password){
        User user = null;
        try{
           String query = "Select * from User Where email=? and password =?";
           PreparedStatement pstmt = this.con.prepareStatement(query);
           pstmt.setString(1,email);
           pstmt.setString(2, password);
           
           ResultSet rs = pstmt.executeQuery();
           if(rs.next()){
               user = new User();
               String name = rs.getString("Username");
               user.setUsername(name);
               
               
               //directly setting to user
               
               user.setEmail(rs.getString("email"));
               
               
           }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
    
}
