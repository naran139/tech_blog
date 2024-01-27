<%-- 
    Document   : index
    Created on : Nov 8, 2023, 9:49:13 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        
        <!--css-->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        
        <!--banner-->
        <div class="container-fluid p-0 m-0 ">
            <div class="jumborton tex-white bg-light bg-gradient">
                <div class="container">
                    <h3 class="display-3">Welcome To My Blog </h3>
                    <p>A programming language is usually described in terms of its syntax (form) and semantics (meaning). These are usually defined by a formal language.</p>
                    <p>Programming language theory is the subfield of computer science that studies the design, implementation, analysis, characterization, and classification of programming languages.</p>
                    <button class="btn btn-outline-blue btn-lg">Start ! it's Free</button>
                    <a href="login_page.jsp"class="btn btn-outline-blue btn-lg">Login</a>
                </div>
                
                
            </div>
            
        </div>
        
        
        <!--cards-->
        <div class="container">
        <div class="row mb-2 mt-2">
            <div class="col-md-4">
                <div class="card">
                    
                    <div class="card-body">
                         <h5 class="card-title">Java Programming</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                         <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            
             <div class="col-md-4">
                <div class="card">
                    
                    <div class="card-body">
                         <h5 class="card-title">Java Programming</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                         <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            
             <div class="col-md-4">
                <div class="card">
                    
                    <div class="card-body">
                         <h5 class="card-title">Java Programming</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                         <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            
        </div>
         
         <div class="row">
            <div class="col-md-4">
                <div class="card">
                    
                    <div class="card-body">
                         <h5 class="card-title">Java Programming</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                         <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            
             <div class="col-md-4">
                <div class="card">
                    
                    <div class="card-body">
                         <h5 class="card-title">Java Programming</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                         <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            
             <div class="col-md-4">
                <div class="card">
                    
                    <div class="card-body">
                         <h5 class="card-title">Java Programming</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                         <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            
        </div>
        </div>
        
        
        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
       
    </body>
</html>
