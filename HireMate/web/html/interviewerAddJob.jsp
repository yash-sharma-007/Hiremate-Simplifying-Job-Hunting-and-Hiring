<!DOCTYPE html>
<html>
    <head>
        <title>Job Post</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /* Style for the job post form */
            form {
                max-width: 600px;
                margin: auto;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type=text], textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-bottom: 15px;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            /* Style for the job listing */
            ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            li {
                border: 1px solid #ccc;
                border-radius: 4px;
                padding: 10px;
                margin-bottom: 10px;
            }

            h2 {
                margin-top: 0;
            }
        </style>

        <%@ page import="java.sql.*" %>
        <%@ page import="javax.naming.*" %>        
        <%@ page import="java.io.*" %>       
        <%@ page import="javax.servlet.*" %>      
        <%@ page import="javax.servlet.http.*" %>
    </head>
    <body>

        <form method="post">
            <h1>Add Job</h1>
            <label for="cname">Company Name</label>
            <input type="text" id="cname" name="cname" required>

            <label for="job-title">Job Title</label>
            <input type="text" id="job-title" name="title" required>

            <label for="job-salary">Salary</label>
            <input type="text" id="job-salary" name="salary" required>

            <label for="city">City</label>
            <input type="text" id="city" name="city" required>

            <label for="job-education">Education</label>
            <input type="text" id="job-education" name="education" required>

            <label for="job-experience">Experience</label>
            <input type="text" id="job-experience" name="experience" required>

            <label for="job-work">Requirements</label>
            <textarea id="job-work" name="work" rows="5"></textarea>

            <input type="submit" value="Add Job">
        </form>
    </body>

    <%

        if (request.getMethod().equals("POST")) {
            String title = request.getParameter("title");
            int salary = Integer.parseInt(request.getParameter("salary"));
            String city = request.getParameter("city");
            String education = request.getParameter("education");
            int experience = Integer.parseInt(request.getParameter("experience"));
            String req = request.getParameter("work");
            String cname = request.getParameter("cname");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");

                PreparedStatement pstmt = con.prepareStatement("update inter set title=?,salary=?,city=?,edu=?,exp=?,req=?,cname=? where username=?;");
                pstmt.setString(1, title);
                pstmt.setInt(2, salary);
                pstmt.setString(3, city);
                pstmt.setString(4, education);
                pstmt.setInt(5, experience);
                pstmt.setString(6, req);
                pstmt.setString(7, cname);
                pstmt.setString(8, (String)session.getAttribute("username"));

                pstmt.executeUpdate();
                
                out.print("<script>alert('Job Posted Successfully...');</script>");
                response.sendRedirect("interviewerDashboard.jsp");

            } catch (SQLException | ClassNotFoundException e) {

            }
        }
    %>

</html>