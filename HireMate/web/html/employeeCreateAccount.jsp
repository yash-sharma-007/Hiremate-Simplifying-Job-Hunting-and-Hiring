<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/style.css">


        <title>Application Form</title>

        <%@ page import="java.sql.*" %>
        <%@ page import="javax.naming.*" %>        
        <%@ page import="java.io.*" %>       
        <%@ page import="javax.servlet.*" %>      
        <%@ page import="javax.servlet.http.*" %>
    </head>

    <%
        String error = "";
    %>

    <body>

        <h2 style="text-align: center; color: white; height: 10px;">Job Seekers Application Form</h2>
        <form class='form' method="post">
            <div class='control'>
                <h1>
                    Full Name:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='name' placeholder='Full name' type='text' pattern="^[a-zA-Z ]*$" required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Username:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='username' placeholder='Username' type='text' pattern="^[a-zA-Z0-9 ]*$" required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div><span><%out.print(error);%></span>

            <div class='control'>
                <h1>
                    Email:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='email' placeholder='email' type='email' required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Password:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='password' placeholder='Password' type='password' pattern="^[a-zA-Z ]*$" required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Re-enter Password:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='repassword' placeholder='Re-enter Password' type='password' pattern="^[a-zA-Z ]*$" required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Address:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='add' placeholder='add' type='text'>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Phone No:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='number' placeholder='phone number' type='text' pattern="^0{1}[0-9]{10}$" required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Age
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='age' placeholder='age' type='number' required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    College Name:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='clg' placeholder='college name' type='text' required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Branch:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='branch' placeholder='branch' type='text' required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Year Of Graduation:
                </h1>
            </div>
            <div class='control block-cube block-input'>
                <input name='year' placeholder='year' type='number' required>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>

            <div class='control'>
                <h1>
                    Skills:
                </h1>
            </div>


            <div class='control block-cube block-input'  >
                <input name='skills' placeholder='Skills' type='text' id="skill" >
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
            </div>
            <!--<br>-->


            <div class='control'>
                <h1>
                    <button style="width:60px;height:30px;background-color: blue;padding: 10px 40px 30px 15px;opacity:0.6;border-radius: 5px;" class="btn" id="addbtn" onclick="ADD()" >Add</button>
                </h1>
            </div>

            <div style="margin-bottom: 30px; display: flex; flex-direction: column; border: 2px solid yellow; background-color: black">
                <textarea rows="10" cols="10" name="skills" id="skill-list" aria-label="Skills" >
     
                </textarea>
            </div>


            <button class='btn block-cube block-cube-hover' type='submit'>
                <div class='bg-top'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg-right'>
                    <div class='bg-inner'></div>
                </div>
                <div class='bg'>
                    <div class='bg-inner'></div>
                </div>
                <div class='text'>
                    Submit
                </div>
            </button>
        </form>

        <script src="../js/script.js"></script>
    </body>

    <%
        if (request.getMethod().equals("POST")) {
            response.setContentType("text/html;charset=UTF-8");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String add = request.getParameter("add");
            String numStr = request.getParameter("number");
            String ageStr = request.getParameter("age");
            String clg = request.getParameter("clg");
            String branch = request.getParameter("branch");
            String yearStr = request.getParameter("year");
            String skills = request.getParameter("skills");
            String username = request.getParameter("username");
            String pass = request.getParameter("password");
            String repass = request.getParameter("repassword");

            // Check if all required fields are filled
            if (name != null && !name.isEmpty()
                    && email != null && !email.isEmpty()
                    && numStr != null && !numStr.isEmpty()
                    && ageStr != null && !ageStr.isEmpty()
                    && clg != null && !clg.isEmpty()
                    && branch != null && !branch.isEmpty()
                    && yearStr != null && !yearStr.isEmpty()
                    && skills != null && !skills.isEmpty()
                    && username != null && !username.isEmpty()
                    && pass != null && !pass.isEmpty()
                    && repass != null && !repass.isEmpty()) {

                long num = Long.parseLong(numStr);
                int age = Integer.parseInt(ageStr);
                int year = Integer.parseInt(yearStr);

//                session.setAttribute("name", name);
//                session.setAttribute("email", email);
//                session.setAttribute("add", add);
//                session.setAttribute("num", num);
//                session.setAttribute("age", age);
//                session.setAttribute("clg", clg);
//                session.setAttribute("branch", branch);
//                session.setAttribute("year", year);
//                session.setAttribute("skills", skills);
//                session.setAttribute("username", username);
//                session.setAttribute("pass", pass);
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "1234");

                    PreparedStatement pstmt = con.prepareStatement("select password from emp where username=?");
                    pstmt.setString(1, username);
                    ResultSet rs1 = pstmt.executeQuery();

                    if (rs1.next()) {
                        error = "Username Already Exists...";
                    } else {

                        pstmt = con.prepareStatement("select email from emp where email=?");
                        pstmt.setString(1, email);
                        rs1 = pstmt.executeQuery();

                        if (rs1.next()) {
                            error = "Email Already Exists...";
                        } else {
                            pstmt = con.prepareStatement("insert into emp values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                            pstmt.setString(1, name);
                            pstmt.setString(2, email);
                            pstmt.setString(3, add);
                            pstmt.setLong(4, num);
                            pstmt.setInt(5, age);
                            pstmt.setString(6, clg);
                            pstmt.setString(7, branch);
                            pstmt.setInt(8, year);
                            pstmt.setString(9, skills);
                            pstmt.setString(10, null);
                            pstmt.setString(11, null);
                            pstmt.setString(12, username);
                            pstmt.setString(13, pass);
                            pstmt.setString(14, "Pending");

                            pstmt.executeUpdate();

                            out.print("<script>alert('Applied successfully...');</script>");
//                    response.sendRedirect("employeeLogin.jsp");
                        }
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    // Handle the exception
                }
            }
        }
    %>


</html>