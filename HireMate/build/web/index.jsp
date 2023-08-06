<!DOCTYPE html>
<html>

<head>
    <title>Interview Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* Reset default browser styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: .5;
        }

        /* Set up global styles */
        body {
            font-family: Arial, sans-serif;
            line-height: 1;
            color: #333;
            background-image: url('https://th.bing.com/th/id/R.c7acd5ae37baf4c5b6b50b6e84a109b5?rik=Zqgo%2bEOvBNiCnA&riu=http%3a%2f%2fwww.incomeactivator.com%2fimages%2ffreebg5.jpg&ehk=U7paqPqpb2Ex9TLrtkBl47D2Wiq5UDm6N73Tlyza2cE%3d&risl=&pid=ImgRaw&r=0');
            background-repeat: no-repeat;
            background-size: cover;
        }

        /* Style the header */
        header {
            background-image: url('your-image-url.jpg');
            background-size: cover;
            background-position: center;

            background-color: #000000;
            color: #22cc13;
            padding: 20px;
            text-align: center;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 0.5em;
        }

        /* Style the main content */
        main {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .button {
            display: inline-block;
            padding: 16px 32px;
            font-size: 1.5em;
            font-weight: bold;
            text-transform: uppercase;
            color: #ffffff;
            background-color: #4287f5;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px;
        }

        .button:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
        }

        .button-jobseeker {
            background-color: #f54242;
        }

        .button-jobseeker:hover {
            background-color: #f55d5d;
        }

        .button-interviewer {
            background-color: #42aaf5;
        }

        .button-interviewer:hover {
            background-color: #5dbaf5;
        }

        .button span {
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }

        .button span::after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }

        .button:hover span {
            padding-right: 25px;
        }

        .button:hover span::after {
            opacity: 1;
            right: 0;
        }

        footer p {
            margin-bottom: 0;
        }

        footer a {
            color: #fff;
        }

        /* Responsive styles */
        @media only screen and (max-width: 600px) {
            h1 {
                font-size: 2em;
            }

            .button {
                font-size: 1.2em;
                padding: 12px 24px;
            }
        }
    </style>

</head>

<body>
    <header>
        <h1>Welcome To The Interview Management </h1>
        <h2>Made By </h2>
        <h2> Solanki Rikin (20BCE284)</h2>
        <h2> Thawani vishal (21BCE533)</h2>
        <h2> Sharma Yash (20BCE270)</h2>+
    </header>
    <main>
        <a href="./html/interviewerLogin.jsp" class="button button-jobseeker"><span>Interviewer</span></a>
        <a href="./html/employeeLogin.jsp" class="button button-interviewer"><span>Job Seeker</span></a>
    </main>
</body>
                        
</html>
