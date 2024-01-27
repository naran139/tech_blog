/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;



public class PostDao {
    Connection con;
    
    public PostDao(Connection con)
    {
        this.con = con;

    }
    public ArrayList<Categories> getAllCategories(){
        ArrayList<Categories> list = new ArrayList<>();
        try{
           String q = "Select * from categories";
           Statement st = this.con.createStatement();
           ResultSet set= st.executeQuery(q);
           while(set.next())
           {
               int cid = set.getInt("cid");
               String name = set.getString("name");
               String description = set.getString("description");
               Categories c= new Categories(cid,name,description);
               list.add(c);
           }
           
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    return list;
    }
    
    
    public boolean savePost(Post p)
    {
        boolean f = false;
        try{
            String q = "insert into posts (ptitle,pcontent,pcode,cid)values(?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPcontent());
            pstmt.setString(3,p.getPcode());
            pstmt.setInt(4, p.getCid());
            pstmt.executeUpdate();
            f= true;
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
       return f; 
    }
}
