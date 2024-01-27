<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Categories" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import= "java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>


<%
  User user = (User)session.getAttribute("currentUser");
  if(user==null)
  {
    response.sendRedirect("login_page.jsp");
  }
    
%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!--css-->
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        
    </head>
    <body>
        <!--navbar start-->
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Java</a></li>
            <li><a class="dropdown-item" href="#">Python</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Web Technology</a></li>
          </ul>
        </li>
  
       
      </ul>
        
        <ul class="navbar-nav mr-auto">
             <li class="nav-item">
             <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal"><%= user.getUsername()%></a>
        </li>
            
             <li class="nav-item">
          <a href="LogoutServlet" class="nav-link" tabindex="-1" >Logout</a>
        </li>
        
        </ul>
      
    </div>
  </div>
</nav>
        
        
      <!--navbar end-->
       
      
      <!--Start of add post container-->
      <main class="d-flex align-items-center mt-2"> 
      <div class="container">
           <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                                                        <div class="card-header primary-background text-center">
                               
                                <h4>Add Post</h4>
                                
                            </div>
                          
           <div class="card-body">                  
          <form action="AddPostServlet" method="post" id="add-post">
              <div class="form-group">
                  <input name="ptitle" type="text" placeholder="Enter Post Title" class="form-control"/> 
              </div>
              <br>
              <div class="form-group">
                  <textarea name="pcontent" type="text" style="height: 150px;" placeholder="Enter Post Content" class="form-control"></textarea> 
              </div>
              <br>
              <div class="form-group">
                  <textarea name="pcode" type="text" style="height: 150px;" placeholder="Enter your code here" class="form-control"></textarea>
              </div>
              <br>
              
              <div class="form-control">
                  <select class="form-control" name="cid">
                      <option selected disabled>----Select Option----</option>
                      <%
                      PostDao postd = new PostDao(ConnectionProvider.getConnection());
                      ArrayList<Categories> list = postd.getAllCategories();
                      for(Categories c: list){
                      %>
                      <option value="<%= c.getCid()%>" ><%= c.getName()%></option>
                      <%
                          } 
                       %>   
                      
                  </select>
              </div>
             
              <div class="text-center mt-3">
                  <button type="submit" class="btn btn-primary">Add</button>
              </div>

          </form>
           </div>
                        </div>
                    </div>
           </div>
      </div>
      </main>
      
      
      
      
      <!--end of add post container-->

        
        <!--start of modal-->
        
       
         <!-- Button trigger modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <div class="container text-center" >
              <h5 class="modal-title" id="exampleModalLabel">Profile Details</h5>
          </div>
 
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div id="profile-details">
                 <table class="table">
  <tbody>
    <tr>
        <th scope="row">ID:</th>
        <td><%= user.getId()%></td>
    </tr>
    <tr>
      <th scope="row">Name:</th>
      <td><%= user.getUsername()%></td>
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td colspan="2"><%= user.getEmail()%></td>
      
    </tr>
  
  </tbody>
</table>
          </div>
      
      <div id="profile-edit" style="display:none;">
          <form action="EditServlet" method="post">
              <table class="table">
                  <tr>
                      <td scope="row">Id</td>
                      <td><%= user.getId()%></td>
                  </tr>
                   <tr>
                      <td scope="row">Email</td>
                      <td><%= user.getEmail()%></td>
                  </tr>
                  <tr>
                      <td scope="row">UserName</td>
                      <td><input name="username" type="text" value="<%= user.getUsername()%>"></td>
                  </tr>
                  <tr>
                      <td scope="row">Password</td>
                      <td><input name="userpassword" type="password" value="<%= user.getPassword()%>"></td>
                  </tr>
                  
                 
                  
              </table>
                  <div class="container text-center">
                      <button type="submit" >Save</button>
                  </div>
          </form>
          
      </div>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="profile-edit-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
        
        
        
        
        <!--end of modal-->
        
        
        
        
        
        <!--javascript-->
     
                 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
                <script>
                   $(document).ready(function(){
                    let editStatus = false;

                            $("#profile-edit-button").click(function(){
        // Toggle between showing profile details and edit form
        if (editStatus == false){
            $("#profile-details").hide();
            $("#profile-edit").show();
            editStatus = true;
            $(this).text("Back")
        } else {
            $("#profile-details").show();
            $("#profile-edit").hide();
            editStatus = false;
            $(this).text("Edit")
        }
    });
});

                        
                </script>
                
                
               <!--add post js-->
               
               <script>
                   $(document).ready(function(e){
                      $("#add-post").on('submit',function(e){
                         e.preventDefault();
                         let form = new FormData(this);
                         $.ajax({
                             url:"AddPostServlet",
                             type:"POST",
                             data:form,
                             success:function(data,textStatus,jqXHR){
                                 
                             },
                             error:function(jqXHR,textStatus,errorThrown){
                                 
                             },
                             processData:false,
                             contentType:false
                         });
                          
                      });
                   });
               </script>
    </body>
</html>
