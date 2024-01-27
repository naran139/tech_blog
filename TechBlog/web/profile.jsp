<%@page import="com.tech.blog.entities.User" %>
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
        
        <!--add post button-->
         <li class="nav-item">
          <a class="nav-link" href="addpostpage.jsp">Add Post</a>
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
      
      
      
      <main>
          <div class="container">
              <div class="row mt-4">
                  <div class="col-md-4">
                      <div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
      All Post
  </a>
  <%
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Categories> list1 = d.getAllCategories();
    for(Categories cc : list1){
   %>
   <a href="#" class="list-group-item list-group-item-action"><%= cc.getName()%></a>
   
   <%
       } 
   %>
  
</div>
                  </div>
                  <div class="col-md-8">
                  </div>
                  
              </div>
          </div>
      </main>
       
      
      
      <!--add post-->
      
<!-- <div class="modal fade" id="add-post-modal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="AddPostServlet" method="post">
              <div class="form-group">
                  <input type="text" placeholder="Enter Post Title" class="form-control"/> 
              </div>
              <div class="form-group">
                  <textarea type="text" style="height: 200px;" placeholder="Enter Post Content" class="form-control"/> >
              </div>
              <div class="form-group">
                  <textarea type="text" style="height: 200px;" placeholder="Enter Post Code" class="form-control"/> >
              </div>
              
              <div class="form-control">
                  <select class="form-control">
                      <option selected disabled>----Select Option----</option>
                      <option>Cat1</option>
                      <option>Cat2</option>
                      <option>Cat3</option>
                      
                  </select>
              </div>
              
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
      -->
      
      <!--end of add post-->
        
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
    </body>
</html>
