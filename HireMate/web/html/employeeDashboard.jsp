<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Job Seeker Dashboard</title>
        <link rel="stylesheet" href="../css/employeeDashboard.css">
    </head>
    <body>
        <header>
            <h1>Job Seeker Dashboard</h1>
            <a href="employeeProfile.jsp" class="profile-button">Profile</a>

        </header>
        <div class="container">
            <h2>Available Jobs</h2>
            <ul id="jobcontainer">
                <%@ page import="java.sql.*" %>
                <%@ page import="javax.naming.*, javax.sql.*" %>
                <%@ page session="true" %>

                <%
                    // Establish a connection to the MySQL database
                    String url = "jdbc:mysql://localhost:3306/mysql";
                    String username = "root";
                    String password = "1234";

                    // sending request attr to
                    // sending request attr to interviewer dashboard
                    try {
                        // Load the MySQL JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Create a connection using a DataSource from JNDI
                        Connection con = DriverManager.getConnection(url, username, password);

                        // Execute a SQL query
                        Statement statement = con.createStatement();
                        String sql = "SELECT * FROM inter;";
                        ResultSet resultSet = statement.executeQuery(sql);
//                        Statement statement2 = con.createStatement();

                        // Generate the HTML code dynamically
                        String html = "";
                        while (resultSet.next()) {
                            String title = resultSet.getString("title");
                            String city = resultSet.getString("city");
                            String education = resultSet.getString("edu");
                            String salaryString = resultSet.getString("salary");
                            String expString = resultSet.getString("exp");
                            String req = resultSet.getString("req");
                            String cname = resultSet.getString("cname");

                            // Check if any of the required fields are null
                            if (title != null && city != null && education != null && salaryString != null && expString != null && req != null && cname != null) {
                                int salary = Integer.parseInt(salaryString);
                                int exp = Integer.parseInt(expString);

                                // Generate the HTML for the job listing
                                html += "<li>"
                                        + "<h1>" + cname + "</h1>"
                                        + "<h3>" + title + "</h3>"
                                        + "<p>" + education + "</p>"
                                        + "<p>" + req + "</p>"
                                        + "<form name='applyForm' method='POST'>"
                                        + "<input type='hidden' name='cname' value='" + cname + "'>"
                                        + "<input type='hidden' name='title' value='" + title + "'>"
                                        + "<button type='submit'>Apply</button>"
                                        + "</form>"
                                        + "</li>";
                            }
                        }

                        // Close the resources
                        resultSet.close();
                        statement.close();
                        con.close();

                        // Print the HTML code
                        out.println(html);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

                <%
                    if (request.getMethod().equals("POST")) {

                        try {
                            String cname = request.getParameter("cname");
                            String title = request.getParameter("title");
//                            session.setAttribute("cname", cname);
//                            session.setAttribute("title", title);

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(url, username, password);

                            PreparedStatement pstmt = con.prepareStatement("update emp set cname=?,title=? where username=?");
                            String user = (String) session.getAttribute("username");

                            pstmt.setString(1, cname);
                            pstmt.setString(2, title);
                            pstmt.setString(3, user);
//                            out.print(pstmt.toString());

                            pstmt.executeUpdate(); // Execute the update statement
//                            con.commit(); // Commit the changes

                            pstmt.close();
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }
                %>

            </ul>
        </div>
    </body>
</html>
