<%@page import="com.tech.blog.entities.Message" %>
<%@page import= "jakarta.servlet.http.HttpSession" %>

<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
           
        <!--css-->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    </head>
    <body>
        
        <!--navbar-->
        
        <%@include file="navbar.jsp" %>
        
        <main class="d-flex align-items-center" style="height:70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-center">
                                <br>
                                <h4>Login Here</h4>
                                <br>
                            </div>
                            
                         
                            <%
                                Message msg = (Message)session.getAttribute("Message");
                                if(msg!=null)
                                {
                                
                            %>
                                    <div class="alert <%=msg.getCssClass()%>" role="alert">
                                       <%=  msg.getContent() %>
                                    </div>

                              <%    
                                  session.removeAttribute("Message");
                                  }   
                                
                            %>
                            
                            
                            
                            <div class="card-body">
                                <form action='LoginServlet' method="POST">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                    <br>
                                        <div class="form-group">
                                             <label for="exampleInputPassword1">Password</label>
                                             <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
       
        
    </body>
</html>
