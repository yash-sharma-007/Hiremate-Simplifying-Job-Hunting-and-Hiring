<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Interviewer Dashboard</title>
        <link href="../css/interviewerDashboard.css" rel="stylesheet">

        <script>
            // Reload the current page
            function reloadPage() {
                window.location.reload();
            }
        </script>
    </head>
    <body>
        <div class="dashboard">
            <header>
                <h1>Interviewer Dashboard</h1>
                <a href="interviewerAddJob.jsp"><button id="add-job-button">Add Job</button></a>
            </header>
            <div class="dashboard-content">
                <div class="job-list">
                    <h2>Candidate List</h2>
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Phone Number</th>
                            <th>Age</th>
                            <th>College</th>
                            <th>Branch</th>
                            <th>Year</th>
                            <th>Skills</th>
                            <th>Title</th>
                            <th>Company Name</th>
                            <th>Actions</th>
                        </tr>
                        <%@ page import="java.sql.*" %>
                        <%@ page import="javax.naming.*, javax.sql.*" %>
                        <%@ page session="true" %>
                        <%
                            // Establish a connection to the MySQL database
                            String url = "jdbc:mysql://localhost:3306/mysql";
                            String username = "root";
                            String password = "1234";
                            try {
                                // Create a connection using a DataSource from JNDI
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");
                                // Execute a SQL query
                                Statement statement = con.createStatement();
                                String sql = "SELECT * FROM emp INNER JOIN inter ON emp.title = inter.title AND emp.cname = inter.cname WHERE emp.cname = '" + (String) session.getAttribute("username") + "'";
                                ResultSet resultSet = statement.executeQuery(sql);
                                // Generate the HTML code dynamically
                                while (resultSet.next()) {
                                    String name = resultSet.getString("name");
                                    String email = resultSet.getString("email");
                                    String address = resultSet.getString("address");
                                    String phoneNumber = resultSet.getString("num");
                                    int age = resultSet.getInt("age");
                                    String college = resultSet.getString("clg");
                                    String branch = resultSet.getString("branch");
                                    int year = resultSet.getInt("year");
                                    String skills = resultSet.getString("skills");
                                    String title = resultSet.getString("title");
                                    String companyName = resultSet.getString("cname");
                        %>
                        <tr>
                            <td><%= name%></td>
                            <td><%= email%></td>
                            <td><%= address%></td>
                            <td><%= phoneNumber%></td>
                            <td><%= age%></td>
                            <td><%= college%></td>
                            <td><%= branch%></td>
                            <td><%= year%></td>
                            <td><%= skills%></td>
                            <td><%= title%></td>
                            <td><%= companyName%></td>
                            <td class="button-column">

                                <form method="post">
                                    <button class="accept" name="action" value="accept">Accept</button>
                                    <button class="reject" name="action" value="reject">Reject</button>
                                    <input type="hidden" name="email" value="<%= email%>" />
                                </form>
                            </td>
                        </tr>
                        <% }
                                if (request.getMethod().equals("POST")) {
                                    try {
                                        if (request.getParameter("action").equals("reject")) {
                                            PreparedStatement ps = con.prepareStatement("UPDATE emp SET cname = NULL, title = NULL, status='Rejected' WHERE email = ?");
                                            ps.setString(1, request.getParameter("email"));
                                            ps.executeUpdate();
                                            response.sendRedirect(request.getRequestURI());
                                        } else if (request.getParameter("action").equals("accept")) {
                                            PreparedStatement ps = con.prepareStatement("update emp set status='Accepted' where email=?");
                                            ps.setString(1, request.getParameter("email"));
                                            ps.executeUpdate();
                                            response.sendRedirect(request.getRequestURI());
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>
