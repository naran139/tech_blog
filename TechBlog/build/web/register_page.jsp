
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        
        <!--css-->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


        
    </head>
    <body>
        
        <!--navbar-->
        <%@include file="navbar.jsp" %>
     
        <main class="d-flex align-items-center mt-4" style="height:70vh">
            <div class="container">
                <div class="row">
                <div class ="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <h4>Register Here</h4>
                            <br>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" method="POST" action="RegisterServlet">
                                <div class="form-group">
                                    <label for="userName">UserName</label>
                                    <input type="text" class="form-control" name="Username" id="userName" aria-describedby="emailHelp" placeholder="Enter Username">
                                    
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>      
                                <br>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <br>
                                
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div> 
                </div>
            </div>
        </main>
        
        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="jquery-3.7.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <script>
            $(document).ready(function(){
               $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    let form  = new FormData(this);
                    // send to register servlet
                    $.ajax({
                       url:"RegisterServlet",
                       type:'POST',
                       data:form,
                       success:function(data,textStatus,jqXHR){
                           console.log("success");
                           window.location = "login_page.jsp";
                       },
                       error:function(jqXHR,textStatus,errorThrown){
                           console.log(jqXHR);
                           alert(jqXHR);
                           
                       },
                       processData:false,
                       contentType:false
                    });
                });
                
            });
        </script>
        
    </body>
</html>
