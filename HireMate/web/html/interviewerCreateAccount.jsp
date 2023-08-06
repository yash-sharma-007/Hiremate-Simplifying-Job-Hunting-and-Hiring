<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <style>
            .create-account {
                display: inline-block;
                margin-left: 650px;
                color: blue;
                text-decoration: underline;
            }
            .create-account:hover {
                color: darkblue;
            }
            .error-message {
                color: red;
                margin-bottom: 10px;
                margin-left: 40px;
                font-weight: bold;
            }
        </style>
        <link rel="stylesheet" href="..\css\style.css">
    </head>

    <%@ page import="java.sql.*" %>
    <%@ page import="javax.naming.*" %>        
    <%@ page import="java.io.*" %>       
    <%@ page import="javax.servlet.*" %>      
    <%@ page import="javax.servlet.http.*" %>
    <body>

        <%
            String error = "";
            if (request.getMethod().equals("POST")) {
                response.setContentType("text/html;charset=UTF-8");

                String user = request.getParameter("username");
                String pass = request.getParameter("password");
                String rpass = request.getParameter("repassword");
                String sql = "insert into inter(username,password) values(?,?);";
                PreparedStatement s, ps;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");

                    s = con.prepareStatement("select password from inter where username=?;");
                    s.setString(1, user);
                    ResultSet rs = s.executeQuery();

                    if (rs.next()) {
                        error = "username already exists";
                    } else {
                        if (pass.equals(rpass)) {
                            ps = con.prepareStatement(sql);
                            ps.setString(1, user);
                            ps.setString(2, pass);
                            ps.executeUpdate();
                            response.sendRedirect("interviewerLogin.jsp");
                        } else {
                            error = "passwords are not same!";
                        }

                    }
                    con.close();

                } catch (ClassNotFoundException | SQLException ex) {
//                    out.print(ps.toString());
                }
            }


        %>


        <form method="post" class="form">
            <div class="error-message" style="color:red; margin-bottom: 25px; margin-left: 40px;">
                <%=error%>
            </div>

            <div class="control">
                <h1>Create Account</h1>
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
            <div class="control block-cube block-input">
                <input name="repassword" placeholder="Re-enter Password" type="password" required>
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
    </body>



</html>
