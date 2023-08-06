<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/employeeProfileCSS.css">
        <title>My Profile</title>

        <style>

            /* Profile details styles */
            .profile-details {
                margin: 20px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #ffffff;
                background-image: linear-gradient(90deg, #ffffff 0%, #e8f5e9 50%, #ffffff 100%);
                box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
            }
            .profile-details h2 {
                margin-top: 0;
            }
            .profile-details ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .profile-details li {
                margin-bottom: 10px;
            }
            .profile-details label {
                display: inline-block;
                width: 150px;
                font-weight: bold;
            }

            /* Applied jobs styles */
            .applied-jobs {
                margin: 20px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #ffffff;
                background-image: linear-gradient(90deg, #ffffff 0%, #e8f5e9 50%, #ffffff 100%);
                box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
            }
            .applied-jobs h2 {
                margin-top: 0;
            }
            .applied-jobs ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .applied-jobs li {
                margin-bottom: 10px;
            }
            .applied-jobs h3 {
                margin-top: 0;
            }
            .applied-jobs p {
                margin-top: 0;
            }

            /* Responsive styles */
            @media screen and (max-width: 600px) {
                .profile-details label {
                    display: block;
                    width: auto;
                    margin-bottom: 5px;
                }
            }
        </style>

        <%@ page import="java.sql.*" %>
        <%@ page import="javax.naming.*" %>        
        <%@ page import="java.io.*" %>       
        <%@ page import="javax.servlet.*" %>      
        <%@ page import="javax.servlet.http.*" %>
        <%@ page session="true" %>
    </head>
    <body>
        <header>
            <h1>My Profile</h1>
        </header>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");

            PreparedStatement ps = con.prepareStatement("select * from emp where username=?");
            ps.setString(1, (String) session.getAttribute("username"));
            ResultSet rs = ps.executeQuery();
        %>

        <div class="container">
            <div class="profile-details">
                <h2>Personal Details</h2>
                <ul>
                    <li>
                        <label for="full-name">Full Name:</label>
                        <% if (rs.next()) {%>
                        <span id="full-name"><%= rs.getString("name")%></span>
                        <% }%>
                    </li>
                    <li>
                        <label for="email">Email:</label>
                        <span id="email"><%= rs.getString("email")%></span>
                    </li>
                    <li>
                        <label for="address">Address:</label>
                        <span id="address"><%= rs.getString("address")%></span>
                    </li>
                    <li>
                        <label for="phone">Phone:</label>
                        <span id="phone"><%= rs.getString("num")%></span>
                    </li>
                    <label for="age">Age:</label>
                    <span id="age"><%= rs.getString("age")%></span>
                    </li>
                    <li>
                        <label for="college">College:</label>
                        <span id="college"><%= rs.getString("clg")%></span>
                    </li>
                    <li>
                        <label for="branch">Branch:</label>
                        <span id="branch"><%= rs.getString("branch")%></span>
                    </li>
                    <li>
                        <label for="graduation-year">Year of Graduation:</label>
                        <span id="graduation-year"><%= rs.getString("year")%></span>
                    </li>
                    <li>
                        <label for="skills">Skills:</label>
                        <span id="skills"><%= rs.getString("skills")%></span>
                    </li>
                </ul>
            </div>

            <div class="applied-jobs">
                <h2>Latest Applied Jobs</h2>
                <ul>
                    <%
                        // Re-establish the connection and create a new ResultSet for the second query
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");

                        PreparedStatement pstmt = con.prepareStatement("select cname, title, status from emp where username=?;");
                        pstmt.setString(1, (String) session.getAttribute("username"));

                        ResultSet rs2 = pstmt.executeQuery();
                        while (rs2.next()) {
                            String cname = rs2.getString("cname");
                            String title = rs2.getString("title");
                            String status = rs2.getString("status");
                            if (cname != null && title != null) {
                    %>
                    <li>
                        <h3><%= title%></h3>
                        <p><%= cname%></p>
                        <p><%= status%></p>
                    </li>
                    <% }
                }%>
                </ul>
            </div>

        </div>
    </body>
</html>