<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to HireMate</title>
        <link rel="stylesheet" href="..\css\style.css">
        <style>
            .create-account {
                position: fixed;
                color: yellow;
                bottom: 270px;
                right: 540px;
            }
            .error-message {
                color: red;
            }
        </style>

        <%@ page import="java.sql.*" %>
        <%@ page import="javax.naming.*" %>        
        <%@ page import="java.io.*" %>       
        <%@ page import="javax.servlet.*" %>      
        <%@ page import="javax.servlet.http.*" %>
    </head>
    <body>

        <%
            String errorMessage = "";
            if (request.getMethod().equals("POST")) {
                response.setContentType("text/html;charset=UTF-8");

                String user = request.getParameter("username");
                String pass = request.getParameter("password");

                session.setAttribute("username", user);
                session.setAttribute("password", pass);

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");

                    PreparedStatement ps = con.prepareStatement("SELECT password FROM inter WHERE username = ?");
                    ps.setString(1, user);

                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        String fetchedPass = rs.getString("password");
                        if (pass.equals(fetchedPass)) {
                            response.sendRedirect("interviewerDashboard.jsp");
                        } else {
                            // Incorrect password
                            errorMessage = "Incorrect password";
                        }
                    } else {
                        // User name doesn't exist
                        errorMessage = "User name does not exist.";
                    }
                } catch (ClassNotFoundException | SQLException ex) {
                    errorMessage = "An error occurred: " + ex.getMessage();
                }
            }
        %>


        <form method="post" class="form">
            <div class="error-message" style="color:red; margin-bottom: 10px; margin-left: 40px;">
                <%=errorMessage%>
            </div>

            <div class="control">
                <h1 style="margin-left:80px;">Sign In</h1>
            </div>
            <div class="control block-cube block-input">
                <input name="username" placeholder="Username" type="text" required>
                <div class="bg-top">
                    <div class="bg-inner"></div>
                </div>
                <div class="bg-right">
                    <div class="bg-inner"></div>
                </div>
                <div class="bg">
                    <div class="bg-inner"></div>
                </div>
            </div>
            <div class="control block-cube block-input">
                <input name="password" placeholder="Password" type="password" required>
                <div class="bg-top">
                    <div class="bg-inner"></div>
                </div>
                <div class="bg-right">
                    <div class="bg-inner"></div>
                </div>
                <div class="bg">
                    <div class="bg-inner"></div>
                </div>
            </div>
            <button class="btn block-cube block-cube-hover" type="submit">
                <div class="bg-top">
                    <div class="bg-inner"></div>
                </div>
                <div class="bg-right">
                    <div class="bg-inner"></div>
                </div>
                <div class="bg">
                    <div class="bg-inner"></div>
                </div>
                <div class="text">
                    Submit Details
                </div>
            </button>
        </form>

        <a href="interviewerCreateAccount.jsp" class="create-account">Create Account</a>


    </body>
</html>
